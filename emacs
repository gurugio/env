; "~/.emacs" and "site-lisp/default.el" file for Emacs Korean users
;  Author: Deogtae Kim <dtkim@calab.kaist.ac.kr>, 1999/04/30

; default initialization library is loaded

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibit-default-init nil)

;;; =============================================================
;;; Korean Language Environment
;;; =============================================================

(if enable-multibyte-characters
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

;(load "cc-mode")

(setq c-indent-level 4)
(setq c-label-offset 4)
(setq-default indent-tabs-mode t) ; use tab
(setq-default tab-width 4)
(setq tab-width 4)

(setq sh-basic-offset 8)
(setq sh-indentation 8)


(setq c-default-style "linux"
      c-basic-offset 8) ; linux-kernel style

(transient-mark-mode t)

(autoload 'c++-mode "cc-mode" "C++ Editing Mode" t)
(autoload 'c-mode   "cc-mode" "C Editing Mode" t)
(autoload 'objc-mode "cc-mode" "Objective-C Editing Mode" t)
(autoload 'java-mode "cc-mode" "Java Editing Mode" t)


;; setting tab-width to 4 does not work, c-basic-offset works!
(setq-default c-basic-offset 4)

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

;; (global-set-key [C-f4] 'c-func-ide-test-through)
;; (global-set-key [C-f5] 'c-func-body)
;; (global-set-key [C-f6] 'c-func-test-raise)   ; ide-test-raise
;; (global-set-key [C-f7] 'c-func-ide-exception)
;; (global-set-key [C-f8] 'c-func-ide-exception-end)
;; (global-set-key [C-f10] 'c-comment)   ; comment


(if (and (eq system-type 'windows-nt) ; for Windows
         (null window-system))
    (progn
      (setq-default grep-command "grep -n -e --color")
      (setq-default grep-find-command
                    '("find . -type f -exec grep -n -e {} /dev/null \\;" . 32))
      (setq-default grep-find-use-xargs nil))
    ;; for Linux
    (setq-default grep-command "grep -nHI --color --exclude-dir=.svn --exclude-dir=.git -se "))

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


;(pc-selection-mode)
;(pc-bindings-mode)


(set-foreground-color "black")
(set-background-color "white")
(set-face-foreground 'region "white")
(set-face-background 'region "gray")
;(set-face-foreground 'modeline "lightsteelblue")
;(set-face-background 'modeline "midnightblue")
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
;(setq standard-indent 4)
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

;; GNU GLOBAL for source tag
(setq load-path (cons "/usr/share/emacs/site-lisp/global/" load-path))
(autoload 'gtags-mode "gtags"
  "Minor mode for browsing source code using GLOBAL" t)
(add-hook 'c-mode-hook
          (lambda () (gtags-mode 1)))
;; Those values must be setup for key-binding of emacs-25
(setq gtags-suggested-key-mapping t)
(setq gtags-auto-update t)


(which-function-mode)
; always insert indent at ENTER-key
(define-key global-map (kbd "RET") 'newline-and-indent)


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))



; M-x fullscreen
(defun fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_FULLSCREEN" 0)))


(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)


;; rust-mode
;(add-to-list 'load-path "~/rust-mode/")
;(autoload 'rust-mode "rust-mode" nil t)
;(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; lisp development with sbcl+slime
;(if (file-exists-p "~/lisp/slime-helper.el")
;  (progn
;    (load (expand-file-name "~/lisp/slime-helper.el"))
;    ;; Replace "sbcl" with the path to your implementation
;    (setq inferior-lisp-program "sbcl")))

;; disable beep sound and enable flash
(setq visible-bell 1)

;; rust development environment
;(add-to-list 'load-path "~/rust-mode/")
;(autoload 'rust-mode "rust-mode" nil t)
;(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

; remove only-tab line
(add-hook 'before-save-hook 'whitespace-cleanup)

; activate TAB in eshell - ssh mode
(setq eshell-cmpl-dir-ignore "\\`\\(CVS\\)/\\'")
(eshell)

