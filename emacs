;; -*- mode: lisp; -*-
;; vi: filetype=lisp


;; =============================================================================
;; INITIAL
;; =============================================================================
(menu-bar-mode     -1) ; hide menu bar
(tool-bar-mode     -1) ; hide tool bar
(toggle-scroll-bar -1) ; hide scroll bar


;; =============================================================================
;; AUTO-GENERATED STUFF
;; =============================================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
	(airline-themes evil-leader powerline helm-describe-modes helm-descbinds whitespace-cleanup-mode solarized-theme magit helm evil-visual-mark-mode))))

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
(setq custom-safe-themes t)

; --- Monokai Theme ---
(require 'monokai-theme)
(load-theme 'monokai t)

; org-mode font size
(setq
	monokai-height-minus-1 0.8
	monokai-height-plus-1 1.1
	monokai-height-plus-2 1.15
	monokai-height-plus-3 1.2
	monokai-height-plus-4 1.3
)

; --- Airline Theme ---
(require 'airline-themes)
(load-theme 'airline-molokai)


;; =============================================================================
;; EVIL MODE
;; =============================================================================

(require 'evil)
(require 'evil-magit)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-mode t)

(require 'key-chord)
(key-chord-mode 1)

; --- Normal/Visual Mode ---
(define-key evil-normal-state-map "H" 'evil-beginning-of-line)
(define-key evil-visual-state-map "H" 'evil-beginning-of-line)
(define-key evil-normal-state-map "L" 'evil-end-of-line)
(define-key evil-visual-state-map "L" 'evil-end-of-line)

; --- Normal Mode ---
(define-key evil-normal-state-map "U" 'redo)
(define-key evil-normal-state-map (kbd "RET") 'evil-ex)
(define-key evil-normal-state-map (kbd "C-k") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-j") 'evil-scroll-down)
; TODO: Figure out how to unbind q:
(define-key evil-normal-state-map "q" nil)
(evil-leader/set-key
	"q" 'evil-quit
	"w" 'evil-write
	"h" 'evil-window-left
	"j" 'evil-window-down
	"k" 'evil-window-up
	"l" 'evil-window-right
)

; --- "Motion" Mode ---
(define-key evil-motion-state-map "K" nil)

; --- Insert/Replace Mode ---
(key-chord-define evil-insert-state-map  "jj" 'evil-normal-state)
(key-chord-define evil-replace-state-map "jj" 'evil-normal-state)
(key-chord-define evil-insert-state-map  "kk" 'evil-normal-state)
(key-chord-define evil-replace-state-map "kk" 'evil-normal-state)


;; =============================================================================
;; GENERAL SETTINGS
;; =============================================================================

; <F5> to reload ~/.emacs
(global-set-key (kbd "<f5>") '(lambda() (interactive) (load-file user-init-file)))

(require 'helm)
(helm-mode 1)

(require 'helm-descbinds)
(helm-descbinds-mode)
(global-set-key (kbd "<f6>") 'helm-descbinds)

(require 'helm-describe-modes)
(global-set-key [remap describe-mode] #'helm-describe-modes)

; <M-Enter> to run command
(global-set-key (kbd "M-RET") 'execute-extended-command)

; --- Backup Directory ---
; FIXME: I don't think this works
(setq
	backup-directory-alist '(("." . "~/.emacs.d/.backup"))
	backup-by-copying t
	version-control t
	delete-older-versions t
	kept-new-versions 6
	kept-old-versions 2
	make-backup-files nil
)
(setq create-lock-files nil)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(background-color . black))
(add-to-list 'default-frame-alist '(foreground-color . gray))

(defun kill-other-buffers()
	"Kill all other buffers."
	(interactive)
	(mapc 'kill-buffer
		(delq (current-buffer) (remove-if-not 'buffer-file-name (buffer-list)))
	)
)

(setq-default display-line-numbers 'visual)

; --- Whitespace Mode ---
(require 'whitespace)
(setq whitespace-style '(face trailing tabs tab-mark))
(setq whitespace-display-mappings '(
	(space-mark 32 [183] [183])
	(tab-mark 9 [9654 9] [92 9])
))
(if window-system nil (progn
	(set-face-foreground 'whitespace-tab "#303030")
	(set-face-background 'whitespace-tab "#181818")
))
(global-whitespace-mode 1)

(setq-default tab-width 4)
(setq-default tab-stop-list (number-sequence 4 80 4))

; --- Powerline ---
(require 'powerline)

