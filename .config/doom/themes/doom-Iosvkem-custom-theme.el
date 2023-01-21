;;; doom-Iosvkem-custom-theme.el --- A customized doom-Iosvkem theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: Janurary 11, 2023
;; Author: Glen Johnson
;; Maintainer:
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables


;;
;;; Theme definition
(def-doom-theme doom-Iosvkem-custom
  "A dark theme inspired by VIM Iosvkem"

  ;; name        default   256       16
  ((bg         '("#1b1d1e" "#1b1d1e" nil))
   (bg-alt     '("#262829" "#262829" nil))
   (base0      '("#1b1d1e" "#1b1d1e" "black"))
   (base1      '("#202020" "#202020" "brightblack"))
   (base2      '("#303030" "#303030" "brightblack"))
   (base3      '("#303030" "#303030" "brightblack"))
   (base4      '("#505050" "#505050" "brightblack"))
   (base5      '("#505050" "#505050" "brightblack"))
   (base6      '("#808080" "#808080" "brightblack"))
   (base7      '("#808080" "#808080" "brightblack"))
   (base8      '("#DFDFDF" "#dfdfdf" "white"))
   (fg         '("#dddddd" "#dddddd" "white"))
   (fg-alt     '("#5B6268" "#2d2d2d" "white"))

   (grey       base4)
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

   ;; face categories -- required for all themes
   (highlight      ioteal)
   (vertical-bar   base2)
   (selection      bg-alt)
   (builtin        magenta)
   (comments       (doom-darken ioteal .25))
   (doc-comments   (doom-darken ioteal .25))
   (constants      green)
   (functions      magenta)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           cyan)
   (strings        yellow)
   (variables      iocyan)
   (numbers        green)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base0) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))

   (modeline-fg     nil)
   (modeline-fg-alt base6)

   (modeline-bg (doom-darken blue 0.15))
   (modeline-bg-alt (doom-darken blue 0.35))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg-alt))))


  ;;;; Base theme face overrides
  (
   ;; ((font-lock-comment-face &override)
   ;;  :background (if doom-Iosvkem-custom-comment-bg (doom-lighten bg 0.05))
   ;;  :slant 'italic)
   ((font-lock-function-name-face &override) :weight 'bold)
   ((font-lock-doc-face &override) :slant 'normal)
   (lazy-highlight :background iocyan :foreground bg :weight 'bold)
   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground iocyan :background bg)
   ;; (mode-line
   ;;  :background modeline-bg :foreground modeline-fg
   ;;  :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   ;; (mode-line-inactive
   ;;  :background modeline-bg-inactive :foreground modeline-fg-alt
   ;;  :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground base8)
   ((tooltip &override) :background bg)

   ;;;; company
   ((company-tooltip-selection &override) :foreground iopink)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background modeline-bg)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; highlight-escape-sequences
   ((hes-escape-backslash-face &override) :inherit 'normal :foreground red)
   ((hes-escape-sequence-face &override) :inherit 'normal :foreground red)
   ;;;; highlight-numbers
   (highlight-numbers-number :foreground numbers)
   ;;;; ivy
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)
   ;;;; js2-mode
   ((js2-function-param &override) :foreground fg :slant 'italic)
   ((js2-object-property &override) :foreground fg)
   ;;;; markdown-mode
   ((markdown-bold-face &override) :foreground cyan)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))
   (markdown-header-delimiter-face :inherit 'bold :foreground red)
   (markdown-header-face :inherit 'bold :foreground fg)
   ((markdown-italic-face &override) :foreground cyan)
   ((markdown-link-face &override) :foreground blue)
   ((markdown-list-face &override) :foreground magenta)
   (markdown-markup-face :foreground red)
   ((markdown-url-face &override) :foreground base5)
   ;;;; nav-flash
   ((nav-flash-face &override) :background bg-alt :foreground iopink)
   ;;;; outline
   ((outline-1 &override) :foreground blue)
   ((outline-2 &override) :foreground orange)
   ((outline-3 &override) :foreground teal)
   ((outline-4 &override) :foreground magenta)
   ((outline-5 &override) :foreground blue)
   ((outline-6 &override) :foreground orange)
   ((outline-7 &override) :foreground teal)
   ((outline-8 &override) :foreground magenta)
   ;;;; org <built-in>
   (org-hide :foreground hidden)
   (org-link :foreground urlblue :underline t)
   ((org-block &override) :background bg-alt)
   ((org-quote &override) :background bg-alt)
   ((org-block-begin-line &override) :foreground comments :background bg)
   ;;;; mic-paren
   ((paren-face-match &override) :foreground iopink :background bg :weight 'ultra-bold)
   ;;;; solaire-mode
   ;; (solaire-mode-line-face
   ;;  :inherit 'mode-line
   ;;  :background modeline-bg-alt
   ;;  :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   ;; (solaire-mode-line-inactive-face
   ;;  :inherit 'mode-line-inactive
   ;;  :background modeline-bg-inactive-alt
   ;;  :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt)))
   ;;;; whitespace <built-in>
   ((whitespace-tab &override) :background bg))

  ;;;; Base theme variable overrides-
  ;; ()
  )

;;; doom-Iosvkem-custom-theme.el ends here
