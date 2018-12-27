;; -*- mode: lisp; -*-
;; vi: filetype=lisp

;; =============================================================================
;; AUTO-GENERATED STUFF
;; =============================================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (helm evil-visual-mark-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; =============================================================================
;; PACKAGES
;; =============================================================================
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)


;; =============================================================================
;; THEME
;; =============================================================================

; --- Monokai Theme ---
; M-x package-install monokai-theme
(load-theme 'monokai t)

; org-mode font size
(setq
	monokai-height-minus-1 0.8
	monokai-height-plus-1 1.1
	monokai-height-plus-2 1.15
	monokai-height-plus-3 1.2
	monokai-height-plus-4 1.3
)


;; =============================================================================
;; GENERAL SETTINGS
;; =============================================================================

; <F5> to reload ~/.emacs
(global-set-key (kbd "<f6>") '(lambda() (interactive) (load-file user-init-file)))


; --- Backup Directory ---
; FIXME: I don't think this works
(setq
	backup-directory-alist `(("." . "~/.emacs.d/.backup"))
	backup-by-copying t
	delete-older-versions t
	kept-new-versions 6
	kept-old-versions 2
	version-control t
	make-backup-files nil
)


;; =============================================================================
;; EVIL MODE
;; =============================================================================

; M-x package-install evil
(require 'evil)
(evil-mode t)

(define-key evil-normal-state-map "H" 'evil-beginning-of-line)
(define-key evil-normal-state-map "L" 'evil-end-of-line)

