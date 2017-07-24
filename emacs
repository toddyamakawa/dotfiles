
;; (add-to-list 'load-path "/home/jimcum01/.emacs.d/")

;;to make it work like regular backspace is backwards and del is forward
;;(normal-erase-is-backspace-mode 1)
(global-set-key [(control h)] 'delete-backward-char)

;; turn on font-lock mode
(global-font-lock-mode t)

;; enable visual feedback on selections
(setq-default transient-mark-mode t)

;; always end a file with a newline
(setq require-final-newline t)

;; stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;;to display time
(display-time)

;;to set the cursor color
(set-cursor-color "red")

;;to set the font
(set-frame-font "-*-fixedsysttf-*-*-*-*-40-*-*-*-*-*-*-*")


;;to set foreground color to white
;;(set-foreground-color "white")

;;to set background color to black
(set-background-color "black")

;;to manage the geometric size of initial window.
(setq initial-frame-alist '((width . 87) (height . 42)))

;;set the keybinding so that you can use f4 for goto line
(global-set-key [f4] 'goto-line)
;;set the keybinding so that f3 will start the shell
(global-set-key [f3] 'shell)
;;set the keybinding so that f5 will start query replace
(global-set-key [f5] 'query-replace)
(global-set-key [f6] 'switch-to-buffer)
(global-set-key [f7] 'hippie-expand)
(global-set-key [f8] 'ispell)

;;disable the stupid annoying bell
(setq ring-bell-function 'ignore)

(setq autoclear)
;; for the backup files
(setq make-backup-files nil)

;;goto line number using ctrl-j
(global-set-key "\C-j" 'goto-line)
(global-set-key "\C-c" 'comment-region)
(global-set-key "\C-u" 'uncomment-region)
(global-set-key "\C-i" 'indent-region)

;;(global-set-key "\A-5" 'search-forward)

;; show column number
(setq column-number-mode t)

(setq initial-scratch-message nil)

;;(set-frame-paramter frame 'font "Monopace-13"))

;; Add this line to your .emacs
;;
;(require '/home/sdatta/.emacs.d/ruby-block.el)
;(ruby-block-mode t)
;;
;; In addition, you can also add this line too.
;;
;; ;; do overlay
;(setq ruby-block-highlight-toggle 'overlay)
;; ;; display to minibuffer
;(setq ruby-block-highlight-toggle 'minibuffer)
;; ;; display to minibuffer and do overlay
;(setq ruby-block-highlight-toggle t)

(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
(add-to-list 'auto-mode-alist '("\\.[ds]?vh?\\'" . verilog-mode))
;; Enable syntax highlighting of **all** languages
(global-font-lock-mode t)
;;(setq x-alt-keysym 'meta)
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

(put 'downcase-region 'disabled nil)

(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("01ce486c3a7c8b37cf13f8c95ca4bb3c11413228b35676025fdf239e77019ea1" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#112328" :foreground "#b1b1b1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 115 :width semi-condensed :foundry "misc" :family "fixed")))))

;; some theme excitement
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

(load-theme 'reykjavik)


;; fix some green background issues...
(setq default-frame-alist '((background-color . "black")
                            (foreground-color . "gray")))
;; BUnch of cool go stuff

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(setenv "GOPATH" "/home/jimcum01/unisched/trunk/work/src/arm.com/uniSched")
(add-to-list 'exec-path "/home/jimcum01/unisched/trunk/work/src/arm.com/uniSched")

(defun my-go-mode-hook ()
                                        ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
                                        ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  (setq tab-width 2)

  )
(add-hook 'go-mode-hook 'my-go-mode-hook)


(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)
