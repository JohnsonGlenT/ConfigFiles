;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Glen Johnson"
      user-mail-address "Johnson.Glen.T@outlook.com")

;; Font Settings
(setq doom-font (font-spec :family "Roboto Mono" :size 12)
      doom-variable-pitch-font (font-spec :family "Roboto Mono" :size 12)
      doom-big-font (font-spec :family "Roboto Mono" :size 18))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-molokai)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/Org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(setq-default tab-width 4)

;; Set Ispell Dictionary
(setq ispell-dictionary "en")

;; Mini Map
;; (minimap-mode)

;; Comment Keybinds
(map! :leader
      (:prefix-map ("a" . "Comments"))
      :desc "Comment Area"
      "a a" #'comment-region
      :desc "Uncomment Area"
      "a d" #'uncomment-region)

;; set fullscreen on start
(toggle-frame-maximized)
