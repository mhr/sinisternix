;; for evil
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; proper linear undo
(add-to-list 'load-path "~/.emacs.d/undo-tree")
(require 'undo-tree)
(global-undo-tree-mode 1)

;;; top-level settings
;; Visual Line mode (line wrapping by word)
(global-visual-line-mode t)

;; line numbers
(global-linum-mode t)

;; esc quits...vi

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; backups
(setq backup-directory-alist '(("." . "~/.saves")))

;; tabs (style and tab/space conversion)
(setq c-default-style "linux"
      c-basic-offset 4)

(setq-default c-basic-offset 4
	      tab-width 4
	      indent-tabs-mode t)

;; prevent regular startup screen
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; org
(require 'org)
(setq org-log-done t)
(setq org-startup-indented t)

;; deft
(add-to-list 'load-path "~/.emacs.d/deft")
(require 'deft)
(setq deft-extension "org")
(setq deft-directory "~/doc")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)
(global-set-key [f5] 'deft)

;; removal of temp file
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*",temporary-file-directory t)))

;; dirtree
(add-to-list 'load-path "~/.emacs.d/dirtree")
(add-to-list 'load-path "~/.emacs.d/tree-mode")
(add-to-list 'load-path "~/.emacs.d/windata")
(require 'dirtree)

;; marmalade
(require 'package)
(add-to-list 'package-archives
			 '("marmalade" .
			   "http://marmalade-repo.org/packages/"))
(package-initialize)

;; theme
; (load-theme 'solarized-dark t)
(load-theme 'monokai t)

;; word-wrapping - visual line mode
(setq line-move-visual t)
