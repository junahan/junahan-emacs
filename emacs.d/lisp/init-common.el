;;; package --- init-common
;;; commentary:
;;; code:

;; simplify the yes-or-no-p
(defalias 'yes-or-no-p 'y-or-n-p)

;; clos the ring bell
(setq ring-bell-function 'ignore)

;;(require 'direnv)
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; a tab is represented by 4 spaces
(setq-default tab-width 4)

;; enable aggressive indent
(use-package aggressive-indent
	:init
	(global-aggressive-indent-mode t))

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)

(use-package yasnippet
  :config
  (yas-global-mode t))

;; editorconfig
(use-package editorconfig
  :config
  (editorconfig-mode t))

;; indent global mode
(use-package indent-guide
  :config
  (indent-guide-global-mode))

(use-package xcscope
  :config
  (cscope-minor-mode t))

(use-package emmet-mode
  :bind
  ("C-c m e" . emmet-mode)
  :config
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
  :config
  (setq speedbar-show-unknown-files t)
  :bind
  ("C-c C-s" . sr-speedbar-toggle))

;; enable neotree
(use-package neotree
  :config
  (setq projectile-switch-project-action 'neotree-projectile-action))

;; enable recentf-mode
(recentf-mode t)

;; disable backup file.
(setq-default make-backup-files nil)

;; enable undo tree mode
(use-package undo-tree
  :init
  (global-undo-tree-mode t))

;; enable auto revert mode
(global-auto-revert-mode t)

;; open super save mode
;; open super save mode
(use-package super-save
	:init
	(super-save-mode t)
	:config
	(setq super-save-auto-save-when-idle t)
	(setq auto-save-default nil))

;; enable smartparens
(use-package smartparens
  :config
  (smartparens-global-mode t))

(setq x-select-enable-clipboard t)

;; enable which key
(use-package which-key
  :init
  (which-key-mode))

(provide 'init-common)
;;; init-common.el ends here
