;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Glen Johnson"
      user-mail-address "Johnson.Glen.T@outlook.com")

;; Font Settings
(setq doom-font (font-spec :family "Roboto Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "Roboto Mono" :size 16)
      doom-big-font (font-spec :family "Roboto Mono" :size 20))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-Iosvkem-custom)
;; brighter comments are done by changing
;; (comments        base5)
;; in ~/.emacs.d/.local/straight/repos/themes/doom-old-hope-theme.el to
;; (comments       (doom-lighten base6 0.2))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/Org/")

;; Set Ispell Dictionary
(setq ispell-dictionary "en")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

(setq-default tab-width 4)
(setq tab-width 4)

(setq-default indent-tabs-mode t)
(setq indent-tabs-mode t)

(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

;; Enable Modes
;; (minimap-mode)
;;(format-all-mode)
(beacon-mode)
(undo-tree-mode)
(global-undo-tree-mode)
(global-tree-sitter-mode)

;; Custom Functions
(defun dired-open-marked-files()
  "Open all marked files in another buffer"
  (interactive)
  (mapc 'find-file (dired-get-marked-files)))

;; Menu Keybinds
(map! :leader
      ;; Custom Binds
      (:prefix-map ("a" . "+Custom Binds"))
      :desc "Comment Area"
      "a a" #'comment-region
      :desc "Uncomment Area"
      "a s" #'uncomment-region
      :desc "Launch GDB"
      "a g" #'gdb
      :desc "Open Dictionary"
      "a t" #'dictionary-lookup-definition
      :desc "Open Thesaurus"
      "a T" #'mw-thesaurus-lookup-at-point

      ;; Undo Tree
      (:prefix-map ("u" . "+Undo Tree"))
      :desc "Undo Tree Visualize"
      "u u" #'undo-tree-visualize
      :desc "Undo Tree Visualize"
      "u u" #'undo-tree-visualize

      ;; Compile
      :desc "lookup help (documentation)"
      "c h"  #'+lookup/documentation

      ;; Man pages
      :desc "Launches (wo)man"
      "o m" #'woman
      )

;; Direct Keybinds
(map!
 :desc "Increment Number"
 "C-a" #'evil-numbers/inc-at-pt-incremental
 :desc "Decrement Number"
 "C-s" #'evil-numbers/dec-at-pt-incremental
 )
