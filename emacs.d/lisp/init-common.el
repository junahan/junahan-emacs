;;; package --- init-common
;;; commentary:
;;; code:

;; simplify the yes-or-no-p
(defalias 'yes-or-no-p 'y-or-n-p)

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
(global-aggressive-indent-mode t)

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)

(use-package yasnippet
  :config
  (yas-global-mode t))

;;(use-package dumb-jump
;;:bind
;;(("M-g o" . dumb-jump-go-other-window)
;;("M-g j" . dumb-jump-go)
;;("M-g i" . dumb-jump-go-prompt)
;;("M-g x" . dumb-jump-go-prefer-external)
;;("M-g z" . dumb-jump-go-prefer-external-other-window))
;;:config
;;(dumb-jump-mode)
;;(setq dumb-jump-selector 'ivy))

;; editorconfig
(use-package editorconfig
  :config
  (editorconfig-mode t))

;; $PATH
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

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
  (projectile-global-mode)
  (setq projectile-enable-caching t))

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
(global-undo-tree-mode t)
(global-auto-revert-mode t)

;; open super save mode
(super-save-mode t)
(setq super-save-auto-save-when-idle t)
(setq auto-save-default nil)

;; enable smartparens
(use-package smartparens-config
  :config
  (smartparens-global-mode t))

(setq x-select-enable-clipboard t)

;; enable which key
(which-key-mode)
;;(window-numbering-mode t)

;; (setq init-open-recentf-interface 'swiper)
;; (init-open-recentf)
;; (require 'expand-region)
;; search using avy
;; (require 'avy)
;; (require 'ace-jump-mode)
;; (require 'crux)

(provide 'init-common)
;;; init-common.el ends here
