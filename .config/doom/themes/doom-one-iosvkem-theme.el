;;; doom-one-iosvkem-theme.el --- inspired by Atom One Dark -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Glen Johnson
;; Maintainer:
;; Source:
;;
;;; Commentary:
;;;
;;  A doom one and iosvkem inspired theme.
;;
;;; Code:

(require 'doom-themes)

;;
;;; Variables

(defgroup doom-one-iosvkem-theme nil
  "Options for doom one iosvkem."
  :group 'doom-themes)

(defcustom doom-one-iosvkem-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-one-iosvkem-theme
  :type 'boolean)

(defcustom doom-one-iosvkem-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-one-iosvkem-theme
  :type 'boolean)

(defcustom doom-one-iosvkem-comment-bg doom-one-iosvkem-brighter-comments
  "If non-nil, comments will have a subtle highlight to enhance their legibility."
  :group 'doom-one-iosvkem-theme
  :type 'boolean)

(defcustom doom-one-iosvkem-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to determine the exact padding."
  :group 'doom-one-iosvkem-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-one-iosvkem
  "A dark theme inspired by Atom One Dark and Iosvkem."

  ;; name        default   256           16
  ((bg         '("#242424" "#242424" nil))
   (fg         '("#dddddd" "#dddddd" "white"))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#2e2e2e" "#2e2e2e" nil))
   (fg-alt     '("#3f3f3f" "#3f3f3f" "white"))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0      '("#1b1d1e" "#1b1d1e" "black"))
   (base1      '("#202020" "#202020" "brightblack"))
   (base2      '("#303030" "#303030" "brightblack"))
   (base3      '("#303030" "#303030" "brightblack"))
   (base4      '("#505050" "#505050" "brightblack"))
   (base5      '("#505050" "#505050" "brightblack"))
   (base6      '("#808080" "#808080" "brightblack"))
   (base7      '("#808080" "#808080" "brightblack"))
   (base8      '("#dfdfdf" "#dfdfdf" "white"))

   (white      '("#dfdfdf" "#dfdfdf" "white"))
   (grey       '("#3af945" "#3af945" "brightblack"))
   (black      '("#0f0f0f" "#0f0f0f" "black"))
   (red        '("#e70a23" "#e70a23" "red"))
   (orange     '("#ff6f00" "#ff6f00" "brightred"))
   (green      '("#44c500" "#44c500" "green"))
   (teal       '("#00c968" "#00c968" "brightgreen"))
   (yellow     '("#ffed00" "#ffed00" "yellow"))
   (blue       '("#118def" "#118def" "brightblue"))
   (dark-blue  '("#002ab2" "#002ab2" "blue"))
   (magenta    '("#d517c0" "#d517c0" "magenta"))
   (violet     '("#d80ff3" "#d80ff3" "brightmagenta"))
   (cyan       '("#30e7ba" "#30e7ba" "brightcyan"))
   (dark-cyan  '("#0082ba" "#0082ba" "cyan"))
   (urlblue    '("#034cda" "#034cda" "blue"))
   (iolime     '("#9ffc20" "#9ffc20" "green"))
   (iopurple   '("#bb20fc" "#bb20fc" "magenta"))
   (iocyan     '("#11dbed" "#11dbed" "cyan"))
   (iopink     '("#fc208a" "#fc208a" "red"))
   (ioteal     '("#16f5a8" "#16f5a8" "brightgreen"))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom themes, or your theme will throw an
   ;; error, as they are used in the base theme defined in doom-themes-base.
   (highlight      ioteal)
   (vertical-bar   (doom-darken base2 0.1))
   (selection      white)
   (builtin        magenta)
   (comments       ioteal)
   (doc-comments   ioteal)
   (constants      green)
   (functions      magenta)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           teal)
   (strings        yellow)
   (variables      (doom-lighten iocyan 0.2))
   (numbers        orange)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base1) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (hidden                   `(,(car bg) "black" "black"))
   (hl-line                  bg-alt)
   (modeline-fg              fg)
   (modeline-fg-alt          base5)
   (modeline-bg              (if doom-one-iosvkem-brighter-modeline
			       (doom-darken blue 0.45)
			       (doom-darken bg-alt 0.1)))
   (modeline-bg-alt          (if doom-one-iosvkem-brighter-modeline
				 (doom-darken blue 0.475)
			       `(,(doom-darken (car bg-alt) 0.15) ,@(cdr bg))))
   (modeline-bg (doom-darken bg-alt 0.1))
   (modeline-bg-alt (doom-darken (car bg-alt) 0.15))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg)))

   (-modeline-pad
    (when doom-one-iosvkem-padded-modeline
      (if (integerp doom-one-iosvkem-padded-modeline) doom-one-iosvkem-padded-modeline 4))))


  ;;;; Base theme face overrides
  (((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   (hl-line :background hl-line :foreground nil)
   ((font-lock-comment-face &override)
    :background (if doom-one-iosvkem-comment-bg (doom-lighten bg 0.05) 'unspecified))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if doom-one-iosvkem-brighter-modeline base8 highlight))

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if doom-one-iosvkem-brighter-modeline modeline-bg highlight))
   (doom-modeline-bar :background  highlight)
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; ivy
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)
   ;;;; LaTeX-mode
   (font-latex-math-face :foreground green)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))
   ;;;; rjsx-mode
   (rjsx-tag :foreground red)
   (rjsx-attr :foreground orange)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt))))

  ;;;; Base theme variable overrides-
  ())

;; (provide 'doom-one-iosvkem)
;;; doom-one-iosvkem-theme.el ends here
