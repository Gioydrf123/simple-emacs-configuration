;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-refresh-contents)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))
(unless (package-installed-p 'sublime-themes)
  (package-install 'sublime-themes))
(unless (package-installed-p 'company)
  (package-install 'company))

;;emacs font
(set-face-attribute 'default nil :font "Monospace-11")

(setq-default indent-tabs-mode t) ; Use tabs for indentation
(setq-default tab-width 4)        ; Set tab width to 4 spaces

;; Use TABS instead of spaces for indentation
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)

;; Force tabs in C/C++/Java modes
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq indent-tabs-mode t)  ; Force tabs for this buffer
            (setq c-basic-offset 4)))  ; Match your tab width

;; Optional: Disable electric-indent if it interferes
(remove-hook 'prog-mode-hook #'electric-indent-local-mode)


;;themes
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'hickey t)
;; (load-theme 'lethe t t)
;; (enable-theme 'lethe)


;; Suppress startup screen and messages
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
;; vim
;;relative number like in vim
(setq display-line-numbers-type 'relative)  ; Set relative type first

(add-hook 'prog-mode-hook 'display-line-numbers-mode)  ; For programming modes
(add-hook 'text-mode-hook 'display-line-numbers-mode)   ; For text files
;; Configure Evil to use regular TAB for indentation
(require 'evil)
(evil-mode 1)
(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)



;; backup section
;; Create a backup directory if it doesn't exist
(defvar my-backup-directory "~/.emacs.d/backups")
(make-directory my-backup-directory t)

;; Set backup settings
(setq backup-directory-alist `(("." . ,my-backup-directory))
      backup-by-copying t      ;; Don't rename current file, just copy it
      version-control t        ;; Use version numbers for backups
      delete-old-versions t    ;; Automatically delete old backup versions
      kept-new-versions 6      ;; Keep latest 6 backups
      kept-old-versions 2      ;; Keep oldest 2 backups
      delete-by-moving-to-trash t) ;; Move deleted files to trash
      
      
;;brackets
(electric-pair-mode 1)

;; eshell
(defun es ()
  "Start Eshell (shortcut for `eshell')."
  (interactive)
  (eshell))
;; kill-emacs
(defun ke ()
  "Kill Emacs (shortcut for `kill-emacs')."
  (interactive)
  (kill-emacs))
;;make
(defun cm ()
  "Shortcut to compile with a custom command."
  (interactive)
  (compile "make"))
;;make
(defun cmc ()
  "Shortcut to compile with a custom command."
  (interactive)
  (compile "make clean"))
;;make
(defun cmfc ()
  "Shortcut to compile with a custom command."
  (interactive)
  (compile "make fclean"))
;;
(defun c ()
  "Shortcut to compile C program."
  (interactive)
  (compile "gcc -Wall -Werror -Wextra -pthread *.c"))
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")  t)
(package-initialize)

(with-eval-after-load 'magit
  (require 'magit))
;; disable gui emacs


;; Optional: prevent startup screen
(setq inhibit-startup-screen t)
(delete-other-windows)

;;autocomplete
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(color-theme-modern auto-complete cmake-mode company corfu dired-sidebar evil flycheck kakoune neotree pdf-tools treemacs)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;auto completion
(require 'company) ; Load company-mode
(global-company-mode 1) ; Enable globally

;; Start suggesting after 1 character
(setq company-minimum-prefix-length 1)

;; Show suggestions quickly (0.1 seconds delay)
(setq company-idle-delay 0.1)

;; Allow cycling through suggestions with C-n / C-p
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "<tab>") 'company-complete-selection);; Enable Evil
(require 'evil)
(evil-mode 1)
;;sublime theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'hickey t)
;;startup
(setq inhibit-splash-screen t)         ; hide welcome screen
