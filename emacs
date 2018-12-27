
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
 '(package-selected-packages nil))

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
;; GENERAL SETTINGS
;; =============================================================================

; Use backup file directory
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
(require 'evil)
(evil-mode t)


