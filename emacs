; "~/.emacs" and "site-lisp/default.el" file for Emacs Korean users
;  Author: Deogtae Kim <dtkim@calab.kaist.ac.kr>, 1999/04/30

; default initialization library is loaded
(setq inhibit-default-init nil)

;;; =============================================================
;;; Korean Language Environment
;;; =============================================================

(if enable-multibyte-characters
;;    (set-language-environment "Korean")
    (setq-default file-name-coding-system 'utf-8)
    (prefer-coding-system 'utf-8)
    (set-default-coding-systems 'utf-8)
    (if  (not window-system)
         (set-keyboard-coding-system 'utf-8)
         (set-terminal-coding-system 'utf-8))
    (set-selection-coding-system 'utf-8)
    ;; Hangul Mail setting
    (setq-default sendmail-coding-system 'utf-8))


;;; =============================================================
;;; Fonts and Frame for Unix X11
;;; =============================================================

(global-font-lock-mode 1)


;;; =============================================================
;;; Text Mode
;;; =============================================================

(setq default-major-mode (quote text-mode))


;;; =============================================================
;;; Programming Modes
;;; =============================================================


;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)


;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)


(global-set-key [C-f1] 'man)
(global-set-key [f2] 'grep)
(global-set-key [f3] 'svn-status)
(global-set-key [f4] 'query-replace) 
(global-set-key [f5] 'goto-line)
(global-set-key "\M-g" 'goto-line)
(global-set-key [f6] 'other-window)

(global-set-key [f7] 'previous-error)
(global-set-key [f8] 'next-error)    


(global-set-key [f9] 'compile)
(global-set-key [f10] 'eshell) 
(global-set-key [C-f12] 'indent-region)   


(load-library "font-lock")
(load-library "tex-mode")

(load "cc-mode")

(setq c-indent-level 4)
(setq c-label-offset 4)
(setq-default indent-tabs-mode nil) ; use space instead of tab
(setq-default tab-width 4)
(setq tab-width 4)

(transient-mark-mode t)

(autoload 'c++-mode "cc-mode" "C++ Editing Mode" t)
(autoload 'c-mode   "cc-mode" "C Editing Mode" t)
(autoload 'objc-mode "cc-mode" "Objective-C Editing Mode" t)
(autoload 'java-mode "cc-mode" "Java Editing Mode" t)

;; (defconst my-c-style
;;   '((c-tab-always-indent        . t)
;;     (c-hanging-colons-alist     . ((member-init-intro before)
;; 								   (inher-intro)
;; 								   (case-label after)
;; 								   (label after)
;; 								   (access-label after)))
;;     (c-cleanup-list             . (scope-operator
;; 								   empty-defun-braces
;; 								   defun-close-semi))
;;     (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
;; 								   (substatement-open . 0)
;; 								   (case-label        . 4)
;; 								   (block-open        . 0)
;; 								   (knr-argdecl-intro . -)))
;;     (c-echo-syntactic-information-p . t)
;;     )
;;   "My C Programming Style")


;; Customizations for all of c-mode, c++-mode, and objc-mode
(defun my-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  (font-lock-mode)
  ;; show compiler-warning on edit buffer
  (cwarn-mode)
;;  (c-add-style "PERSONAL" my-c-style t)
  ;; offset customizations not in my-c-style
  (c-set-offset 'member-init-intro '++)
  ;; other customizations
  (setq tab-width 4
	;; this will make sure spaces are used instead of tabs
	tab-to-tab-stop)
  ;; we like auto-newline and hungry-delete
;  (c-toggle-auto-hungry-state 1)
  ;; keybindings for all supported languages.  We can put these in
  ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map,
  ;; java-mode-map, and idl-mode-map inherit from it.
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
  ;;-----------------------------------
  ;; add settings for ALTIBASE
  ;;-----------------------------------
  (c-set-style "stroustrup")
  (c-set-offset 'case-label '+)
  (c-set-offset 'statement-case-open '+)
  (c-set-offset 'inline-open 0)
;;  (set-variable 'c-backslash-max-column 76)
)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; setting tab-width to 4 does not work, c-basic-offset works!
(setq-default c-basic-offset 4)

;;; do not use tab character
(setq-default indent-tabs-mode nil)

(setq auto-mode-alist
      (append
       '(("\\.C$" . c++-mode)
         ("\\.H$" . c++-mode)
         ("\\.cc$" . c++-mode)
         ("\\.cpp$" . c++-mode)
         ("\\.hh$" . c++-mode)
         ("\\.c$" . c-mode)
         ("\\.h$" . c-mode)
         ("\\.i$" . c++-mode)
         ("\\.l$" . c++-mode)
         ("\\.y$" . c++-mode)
         ("\\.in$" . makefile-mode)
         ("\\.tsp$" . makefile-mode)
         ("\\.mak$" . makefile-mode)
         ("Makefile.$" . makefile-mode)
         ("makefile.$" . makefile-mode)
         ("\\.m$" . objc-mode)
         ("\\.java$" . java-mode)
         ("\\.html$" . html-helper-mode)
         ("\\.phtml$" . html-helper-mode)
         (".emacs" . lisp-mode)
         )
       auto-mode-alist)
      )

(add-hook 'java-mode-hook
	  (function (lambda ()
		      (c-set-style "java"))))

(global-set-key [C-f4] 'c-func-ide-test-through) ; 
(global-set-key [C-f5] 'c-func-body)
(global-set-key [C-f6] 'c-func-test-raise)   ; ide-test-raise
(global-set-key [C-f7] 'c-func-ide-exception)   
(global-set-key [C-f8] 'c-func-ide-exception-end) 
(global-set-key [C-f10] 'c-comment)   ; comment 


(if (and (eq system-type 'windows-nt) ; for Windows
         (null window-system))
    (progn
      (setq-default grep-command "grep -n -e --color")
      (setq-default grep-find-command 
                    '("find . -type f -exec grep -n -e {} /dev/null \\;" . 32))
      (setq-default grep-find-use-xargs nil))
    ;; for Linux
    (setq-default grep-command "grep -nH --color --exclude-dir=.svn -e "))

;;; =============================================================
;;; Version Control
;;; =============================================================

(setq vc-make-backup-files t)

;;; =============================================================
;;; Private Settting and Customization
;;; =============================================================
;; To see available colors, run `M-x list-colors-dislay'

;; include extra emacs library
(setq load-path (cons "/usr/share/emacs/site-lisp/emacs-goodies-el/" load-path))
(setq load-path (cons "~/env/els" load-path))


(pc-selection-mode)
(pc-bindings-mode)


(set-foreground-color "black")
(set-background-color "white")
(set-face-foreground 'region "white")
(set-face-background 'region "gray")
(set-face-foreground 'modeline "lightsteelblue")
(set-face-background 'modeline "midnightblue")
(set-cursor-color "black")

;color theme
; this path is default at Ubuntu
(require 'color-theme)
; If color-theme-initlaize is defined, call it
(if (fboundp 'color-theme-initialize)
    (color-theme-initialize))
(color-theme-charcoal-black)

(setq line-number-mode t)
(require 'linum)
(add-hook 'find-file-hook (lambda () (linum-mode 1))) ; line number at left margin


(setq blink-matching-delay 0.1)
(setq standard-indent 4)
(setq scroll-step 1)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(default-input-method "korean-hangul")
 '(ecb-options-version "2.32")
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(speedbar-frame-parameters (quote ((minibuffer) (width . 20) (border-width . 0) (menu-bar-lines . 0) (tool-bar-lines . 0) (unsplittable . t) (set-background-color "black"))))
 '(tool-bar-mode nil nil (tool-bar))
 '(transient-mark-mode t))

(setq make-backup-files nil)


;; set font
(set-face-font 'default "-*-terminus-medium-r-normal-*-16-*-*-*-*-*-*-*")

;; doxymacs (doxygen+emacs)
;C-c d ? will look up documentation for the symbol under the point.
;C-c d r will rescan your Doxygen tags file.
;C-c d f will insert a Doxygen comment for the next function.
;C-c d i will insert a Doxygen comment for the current file.
;C-c d ; will insert a Doxygen comment for a member variable on the current line (like M-;).
;C-c d m will insert a blank multi-line Doxygen comment.
;C-c d s will insert a blank single-line Doxygen comment.
;C-c d @ will insert grouping comments around the current region.

(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
(add-hook 'c++-mode-common-hook 'doxymacs-mode)

(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

;; function to reload .emacs
(defun reload-dotemacs ()
  "Reload .emacs"
  (interactive)
  (load-file "~/.emacs"))

; changing emacs script effects immediately
(global-auto-revert-mode 1)

; truncate long line or display entire line onto multiple screen lines
(setq-default truncate-lines nil)

;;; =============================================================
;; gio's key bindings
;;; =============================================================

; Copy Line Command
(defun gio-copy-line (n)
    "Copy N lines at point to the kill-ring."
    (interactive "p")
    (kill-ring-save (line-beginning-position) (line-beginning-position (1+ n)))
    (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(global-set-key "\C-c\C-y" 'gio-copy-line)


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(setq gdb-many-windows t) ; open info windows for gdb

;; TRAMP
(setq tramp-default-method "ssh")
(setq tramp-chunksize 300)

; speed!
;(setq svn-status-verbose nil)

;; GNU GLOBAL for source tag
(setq load-path (cons "/usr/share/emacs/site-lisp/global/" load-path))
(autoload 'gtags-mode "gtags"
  "Minor mode for browsing source code using GLOBAL" t)
(add-hook 'c-mode-common-hook
          (lambda () (gtags-mode 1)))

; slime
;; (setq inferior-lisp-program "/usr/bin/clisp") ; your Lisp system
;; (setq load-path (cons "/usr/share/emacs/site-lisp/slime/" load-path))
;; (require 'slime)
;; (slime-setup)



(setq gdb-many-windows t) ; open info windows for gdb

(iswitchb-mode)
(which-function-mode)
; always insert indent at ENTER-key
(define-key global-map (kbd "RET") 'newline-and-indent)


; M-x fullscreen
(defun fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_FULLSCREEN" 0)))


;; run ipython as M-x ipython
(setq ipython-command "/usr/bin/ipython")
(require 'ipython)
(setq-default py-python-command-args '("--pylab" "--colors=Linux"))

;(require 'python-mode)
(add-hook 'python-mode-hook '(lambda () 
                              (setq python-indent 4)))

; activate TAB in eshell - ssh mode
(setq eshell-cmpl-dir-ignore "\\`\\(CVS\\)/\\'")
(eshell)



