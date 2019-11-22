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
    better-defaults
    tabbar session pod-mode markdown-mode initsplit browse-kill-ring boxquote bm bar-cursor apache-mode zenburn-theme                  ;; just some packages I used before
    elpy                            ;; Emacs Lisp Python Environment
    flycheck                        ;; On the fly syntax checking
    py-autopep8                     ;; Run autopep8 on save
    blacken                         ;; Black formatting on save
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
(global-linum-mode t)               ;; Enable line numbers globally

;; ====================================
;; Development packages
;; ====================================
;; Enable elpy
(elpy-enable)

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable autopep8
;; It detects the convention errors and fix them when saving the file.
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; GNU GLOBAL for source tag
(autoload 'gtags-mode "gtags"
  "Minor mode for browsing source code using GLOBAL" t)
;; Those values must be setup for key-binding of emacs-25
(setq gtags-suggested-key-mapping t)
(setq gtags-auto-update t)


;; ====================================
;; style setup
;; ====================================
(add-hook 'python-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nul)
	    (setq tab-width 4)
	    (setq python-indent-offset 4)))

(add-hook 'c-mode-hook
          (lambda ()
	    (setq c-indent-level 8)
	    (setq c-default-style "linux")
	    (setq c-basic-offset 8)
	    (setq indent-tabs-mode t)
	    (setq tab-width 8)
	    (gtags-mode 1)))

(set-face-font 'default "-*-terminus-medium-r-normal-*-16-*-*-*-*-*-*-*")

;; ====================================
;; User-Defined init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (blacken py-autopep8 tabbar session pod-mode muttrc-mode mutt-alias markdown-mode initsplit htmlize graphviz-dot-mode folding eproject diminish csv-mode browse-kill-ring boxquote bm bar-cursor apache-mode zenburn-theme material-theme flycheck elpy better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
