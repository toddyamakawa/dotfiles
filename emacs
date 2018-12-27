;; -*- mode: lisp; -*-
;; vi: filetype=lisp
;;
;; =============================================================================
;; AUTO-GENERATED STUFF
;; =============================================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (solarized-theme magit helm evil-visual-mark-mode))))

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


(add-hook 'magit-status-mode-hook (lambda () (load-theme 'solarized-dark t)))

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
;; EVIL MODE
;; =============================================================================

; M-x package-install evil
(require 'evil)
(require 'evil-magit)
(evil-mode t)

; M-x package-install key-chord
(require 'key-chord)
(key-chord-mode 1)

; <C-h b> to list all available bindings
; <C-h k> to get help on binding

; --- Normal Mode ---
(define-key evil-normal-state-map "H" 'evil-beginning-of-line)
(define-key evil-normal-state-map "L" 'evil-end-of-line)
(define-key evil-normal-state-map "U" 'redo)
(define-key evil-normal-state-map (kbd "RET") 'evil-ex)
(define-key evil-normal-state-map (kbd "C-k") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-j") 'evil-scroll-down)

; --- Insert Mode ---
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-define evil-insert-state-map "kk" 'evil-normal-state)


;; =============================================================================
;; GENERAL SETTINGS
;; =============================================================================

; <F5> to reload ~/.emacs
(global-set-key (kbd "<f5>") '(lambda() (interactive) (load-file user-init-file)))

; <M-Enter> to run command
(global-set-key (kbd "M-RET") 'execute-extended-command)

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

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(defun kill-other-buffers()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
    (delq (current-buffer) (remove-if-not 'buffer-file-name (buffer-list)))
  )
)

