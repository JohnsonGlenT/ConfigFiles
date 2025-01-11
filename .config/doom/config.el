;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

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
(setq doom-theme 'doom-one-iosvkem)
(setq doom-one-iosvkem-brighter-comments nil)
(setq doom-one-iosvkem-brighter-modeline nil)

;; Fix Link Coloring
(set-face-foreground 'link "#Db7093")

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/Org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)
(setq scroll-margin 10)

(setq indent-tabs-mode t)
(setq-default indent-tabs-mode t)

(setq tab-width 4)
(setq-default tab-width 4)

;; Set Ispell Dictionary
(setq ispell-dictionary "en")

;; auto save file changes
(setq auto-save-default t
      make-backup-files t)

(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

;; Enable Modes
;; (minimap-mode)
;; (format-all-mode)
(beacon-mode)
(undo-tree-mode)
(global-undo-tree-mode)
(global-tree-sitter-mode)

(setq global-undo-tree-mode t)
(setq global-tree-sitter-mode t)

(setq-default undo-tree-mode t)
(setq-default global-tree-sitter-mode t)

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
      "a T" #'powerthesaurus-lookup-dwim

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
      :desc "Launches wo(man)"
      "o w" #'woman
      )

;; Direct Keybinds
(map!
 :desc "Increment Number"
 "C-a" #'evil-numbers/inc-at-pt-incremental
 :desc "Decrement Number"
 "C-s" #'evil-numbers/dec-at-pt-incremental
 )

;; Insert Mode Keybinds
(map! :desc "select" :i "C-y" #'company-complete-selection)

;; Disable Default Keybinds
(with-eval-after-load 'company
  (define-key company-active-map (kbd "<return>") nil)
  (define-key company-active-map (kbd "RET") nil))

(setq projectile-require-project-root nil)
(setq-default projectile-require-project-root nil)

(defun dired-open-marked-files()
  "Open all marked files in another buffer"
  (interactive)
  (mapc 'find-file (dired-get-marked-files)))
