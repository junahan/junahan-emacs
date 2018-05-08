;;; package --- init-common
;;; commentary:
;;; code:

;; install require packages.
(require-package 'use-package)
(require-package 'exec-path-from-shell)
(require-package 'aggressive-indent)
(require-package 'yasnippet)
;; (require-package 'indent-guide)
(require-package 'xcscope)
(require-package 'projectile)
(require-package 'zygospore)
(require-package 'sr-speedbar)
(require-package 'undo-tree)
(require-package 'neotree)
(require-package 'super-save)
(require-package 'smartparens)
(require-package 'highlight-parentheses)
(require-package 'which-key)
(require-package 'popwin)

(setq use-package-always-ensure t)

;; simplify the yes-or-no-p
(defalias 'yes-or-no-p 'y-or-n-p)

;; clos the ring bell
(setq ring-bell-function 'ignore)

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; a tab is represented by 4 spaces
(setq-default tab-width 4)

;;(require 'direnv)
(use-package exec-path-from-shell
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; enable aggressive indent
(use-package aggressive-indent
	:init
	(global-aggressive-indent-mode t))

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)

(use-package yasnippet
  :init
  (yas-global-mode t))

;; indent global mode
;;(use-package indent-guide
;;:config
;;(indent-guide-global-mode))

(use-package xcscope
  :init
  (cscope-minor-mode t))

(use-package emmet-mode
  :bind
  ("C-c m e" . emmet-mode)
  :init
  (emmet-mode t))

;; Package projejctile
(use-package projectile
  :init
  (setq projectile-enable-caching t)
  (projectile-global-mode))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent))) ;; automatically indent when press RET

;; Package sr-speedbar
(use-package sr-speedbar
  :init
  (setq speedbar-show-unknown-files t)
  :bind
  ("C-c C-s" . sr-speedbar-toggle))

;; enable neotree
(use-package neotree
  :init
  (setq projectile-switch-project-action 'neotree-projectile-action))

;; enable recentf-mode
(recentf-mode t)

;; disable backup file.
(setq-default make-backup-files nil)
(setq x-select-enable-clipboard t)

;; enable undo tree mode
(use-package undo-tree
  :init
  (global-undo-tree-mode t))

;; enable auto revert mode
;;(global-auto-revert-mode t)

;; open super save mode
(use-package super-save
  :init
  (super-save-mode t)
  (setq super-save-auto-save-when-idle t)
  (setq auto-save-default nil))

;; enable smartparens
(use-package smartparens
  :init
  (smartparens-global-mode t))

;; enable which key
(use-package which-key
  :init
  (which-key-mode t))

;; enable popwin mode
(use-package popwin
  :config
  (popwin-mode t))

(use-package highlight-parentheses
  :init
  (global-highlight-parentheses-mode t))

;; define theme
(if (display-graphic-p)
    (progn     ;; for graphic system
      (tool-bar-mode 0)
      (scroll-bar-mode 0)
      (setq-default cursor-type 'bar)))

;; display line number
;; (global-linum-mode t)
(column-number-mode t)

(provide 'init-common)
;;; init-common.el ends here
