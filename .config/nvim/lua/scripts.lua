local action_state = require("telescope.actions.state")
--local action_set = require("telescope.actions.set")
local actions = require("telescope.actions")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local pickers = require("telescope.pickers")
local utils = require("telescope.utils")
local conf = require("telescope.config").values
local log = require("telescope.log")

local flatten = utils.flatten

local sessions = require("sessions")

Scripts = {}

local session_load_finder = function(opts)
	opts = opts or {}
	local find_command = (function()
		if opts.find_command then
			if type(opts.find_command) == "function" then
				return opts.find_command(opts)
			end
			return opts.find_command
		elseif 1 == vim.fn.executable("rg") then
			return { "rg", "--files", "--color", "never" }
		elseif 1 == vim.fn.executable("fd") then
			return { "fd", "--type", "f", "--color", "never" }
		elseif 1 == vim.fn.executable("fdfind") then
			return { "fdfind", "--type", "f", "--color", "never" }
		elseif 1 == vim.fn.executable("find") and vim.fn.has("win32") == 0 then
			return { "find", ".", "-type", "f" }
		elseif 1 == vim.fn.executable("where") then
			return { "where", "/r", ".", "*" }
		end
	end)()

	if not find_command then
		utils.notify("builtin.find_files", {
			msg = "You need to install either find, fd, or rg",
			level = "ERROR",
		})
		return
	end

	local command = find_command[1]
	local hidden = opts.hidden
	local no_ignore = opts.no_ignore
	local no_ignore_parent = opts.no_ignore_parent
	local follow = opts.follow
	local search_dirs = opts.search_dirs
	local search_file = opts.search_file

	if search_dirs then
		for k, v in pairs(search_dirs) do
			search_dirs[k] = vim.fn.expand(v)
		end
	end

	if command == "fd" or command == "fdfind" or command == "rg" then
		if hidden then
			find_command[#find_command + 1] = "--hidden"
		end
		if no_ignore then
			find_command[#find_command + 1] = "--no-ignore"
		end
		if no_ignore_parent then
			find_command[#find_command + 1] = "--no-ignore-parent"
		end
		if follow then
			find_command[#find_command + 1] = "-L"
		end
		if search_file then
			if command == "rg" then
				find_command[#find_command + 1] = "-g"
				find_command[#find_command + 1] = "*" .. search_file .. "*"
			else
				find_command[#find_command + 1] = search_file
			end
		end
		if search_dirs then
			if command ~= "rg" and not search_file then
				find_command[#find_command + 1] = "."
			end
			vim.list_extend(find_command, search_dirs)
		end
	elseif command == "find" then
		if not hidden then
			table.insert(find_command, { "-not", "-path", "*/.*" })
			find_command = flatten(find_command)
		end
		if no_ignore ~= nil then
			log.warn("The `no_ignore` key is not available for the `find` command in `find_files`.")
		end
		if no_ignore_parent ~= nil then
			log.warn("The `no_ignore_parent` key is not available for the `find` command in `find_files`.")
		end
		if follow then
			table.insert(find_command, 2, "-L")
		end
		if search_file then
			table.insert(find_command, "-name")
			table.insert(find_command, "*" .. search_file .. "*")
		end
		if search_dirs then
			table.remove(find_command, 2)
			for _, v in pairs(search_dirs) do
				table.insert(find_command, 2, v)
			end
		end
	end

	if opts.cwd then
		opts.cwd = vim.fn.expand(opts.cwd)
	end

	opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)

	return finders.new_oneshot_job(find_command, opts)
end

Scripts.session_save = function()
	local table = Scripts.split(vim.loop.cwd(), "/")
	local workspace = Scripts.array_reverse_index(table, 0)
	local time = os.date("!%Y-%m-%d_%H:%M:%S")
	sessions.save("~/.config/nvim/session/" .. workspace .. "_" .. tostring(time), { autosave = true, silent = false })
end

Scripts.session_load = function()
	local path = vim.fn.stdpath("config") .. "/session"
	local opts = { cwd = path }
	pickers
		.new(opts, {
			prompt_title = "colors",
			finder = session_load_finder(opts),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					sessions.load(path .. "/" .. selection[1], {})
				end)
				return true
			end,
		})
		:find()
end

Scripts.session_delete = function()
	local path = vim.fn.stdpath("config") .. "/session"
	local opts = { cwd = path }
	pickers
		.new(opts, {
			prompt_title = "colors",
			finder = session_load_finder(opts),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					os.remove(path .. "/" .. selection[1])
				end)
				return true
			end,
		})
		:find()
end

Scripts.split = function(str, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	for s in string.gmatch(str, "([^" .. sep .. "]+)") do
		table.insert(t, s)
	end
	return t
end

Scripts.array_reverse_index = function(table, entry)
	entry = entry or 1
	local count = (table and #table or false)
	if count then
		return table[count - entry]
	end
	return false
end

Scripts.file_open_last_location = function()
	local ignore_buftype = { "quickfix", "nofile", "help" }
	local ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" }

	local function run()
		if vim.tbl_contains(ignore_buftype, vim.bo.buftype) then
			return
		end

		if vim.tbl_contains(ignore_filetype, vim.bo.filetype) then
			-- reset cursor to first line
			vim.cmd([[normal! gg]])
			return
		end

		-- If a line has already been specified on the command line, we are done
		--   nvim file +num
		if vim.fn.line(".") > 1 then
			return
		end

		local last_line = vim.fn.line([['"]])
		local buff_last_line = vim.fn.line("$")

		-- If the last line is set and the less than the last line in the buffer
		if last_line > 0 and last_line <= buff_last_line then
			local win_last_line = vim.fn.line("w$")
			local win_first_line = vim.fn.line("w0")
			-- Check if the last line of the buffer is the same as the win
			if win_last_line == buff_last_line then
				-- Set line to last line edited
				vim.cmd([[normal! g`"]])
			-- Try to center
			elseif buff_last_line - last_line > ((win_last_line - win_first_line) / 2) - 1 then
				vim.cmd([[normal! g`"zz]])
			else
				vim.cmd([[normal! G'"<c-e>]])
			end
		end
	end

	vim.api.nvim_create_autocmd({ "BufWinEnter", "FileType" }, {
		group = vim.api.nvim_create_augroup("nvim-lastplace", {}),
		callback = run,
	})
end

return Scripts
