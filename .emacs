;; for evil
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; proper linear undo
(add-to-list 'load-path "~/.emacs.d/undo-tree")
(require 'undo-tree)
(global-undo-tree-mode 1)

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
 '(org-level-1 ((t (:inherit outline-1))))
 '(org-level-2 ((t (:inherit outline-2))))
 '(org-level-3 ((t (:inherit outline-4))))
 '(org-level-4 ((t (:inherit outline-5))))
 '(org-level-5 ((t (:inherit outline-6))))
 '(org-level-6 ((t (:inherit outline-6 :foreground "orange"))))
 '(org-level-7 ((t (:inherit outline-8))))
 '(org-level-8 ((t (:foreground "DarkOliveGreen1")))))

;; org
(require 'org)
(setq org-log-done t)
(setq org-startup-indented t)
(setq org-link-abbrev-alist
'(("wiki" . "file:/home/mhr/doc/%s.org")))

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
(package-initialize)
(add-to-list 'package-archives
			 '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
			 '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; theme
(load-theme 'solarized-light t)
;(load-theme 'solarized-dark t)
;(load-theme 'monokai t)

;; word-wrapping - visual line mode
(setq line-move-visual t)

;; I hate backup files, I have git
(setq make-backup-files nil)
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))


;; y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; -- Display images in org mode
;; enable image mode first
(iimage-mode)
;; add the org file link format to the iimage mode regex
(add-to-list 'iimage-mode-image-regex-alist
(cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex "\\)\\]") 1))
;; add a hook so we can display images on load
(add-hook 'org-mode-hook '(lambda () (org-turn-on-iimage-in-org)))
;; function to setup images for display on load
(defun org-turn-on-iimage-in-org ()
"display images in your org file"
(interactive)
(turn-on-iimage-mode)
(set-face-underline-p 'org-link nil))
;; function to toggle images in a org bugger
(defun org-toggle-iimage-in-org ()
"display images in your org file"
(interactive)
(if (face-underline-p 'org-link)
(set-face-underline-p 'org-link nil)
(set-face-underline-p 'org-link t))
(call-interactively 'iimage-mode))

;; supercollider mode
(add-to-list 'load-path "/usr/local/bin/sclang")
(require 'sclang)

;; extempore
(autoload 'extempore-mode "~/.linuxbrew/Cellar/extempore/0.5/extras/extempore.el" "" t)
(add-to-list 'auto-mode-alist '("\\.xtm$" . extempore-mode))

;; keep cursor in place when scrolling
(setq scroll-preserve-screen-position t)
