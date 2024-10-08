;; ===================================
;; MELPA Package Support
;; ===================================
;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Installs packages
;;
;; myPackages contains a list of package names
;; If some package installation fails,
;; do M-x package-refresh-contents manually and try again.
;;
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    material-theme                  ;; Theme
    tabbar session markdown-mode initsplit browse-kill-ring boxquote bm bar-cursor apache-mode zenburn-theme                  ;; just some packages I used before
    blacken                         ;; Black formatting on save
    rust-mode
    )
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; ===================================
;; Basic Customization
;; ===================================

(setq inhibit-startup-message t)    ;; Hide the startup message
(load-theme 'material t)            ;; Load material theme
(global-display-line-numbers-mode 1) ;; Enable line numbers globally


;; ====================================
;; Development packages
;; ====================================

;; GNU GLOBAL for source tag
(autoload 'gtags-mode "gtags"
  "Minor mode for browsing source code using GLOBAL" t)
;; Those values must be setup for key-binding of emacs-25
(setq gtags-suggested-key-mapping t)
(setq gtags-auto-update t)


;; ====================================
;; style setup
;; ====================================

(add-hook 'c-mode-hook
          (lambda ()
	    (setq c-indent-level 8)
	    (setq c-default-style "linux")
	    (setq c-basic-offset 8)
	    (setq indent-tabs-mode t)
	    (setq tab-width 8)
	    (gtags-mode 1)))

(add-hook 'c++-mode-hook
          (lambda ()
	    (setq c-indent-level 4)
	    (setq c-default-style "linux")
	    (setq c-basic-offset 4)
	    (setq indent-tabs-mode t)
	    (setq tab-width 4)
	    (gtags-mode 1)))

(set-face-font 'default "-*-terminus-medium-r-normal-*-16-*-*-*-*-*-*-*")
(tool-bar-mode -1) ;; remove tool-bar
(menu-bar-mode -1) ;; remove menu-bar
;; revert buffer to saved file
;; If a file is modified by another program, emacs will reload the file automatically.
(global-auto-revert-mode 1)
(setq visible-bell 1) ;; flash screen instead of beep sound
(show-paren-mode 1) ;; hlight matching brackets when your cursor is on one of the bracket.
(setq scroll-step 1
    scroll-conservatively 10000) ;; scroll one by one lines 

(setq python-indent-guess-indent-offset-verbose nil) ;; remove error "Can't guess python-indent-offset"

; install rust-mode from github
(require 'rust-mode)
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(setq column-number-mode t)
(setq linum-format "%d ")


;; ====================================
;; User-Defined init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(rust-mode blacken tabbar session markdown-mode initsplit htmlize graphviz-dot-mode folding eproject diminish csv-mode browse-kill-ring boxquote bm bar-cursor apache-mode zenburn-theme material-theme better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
