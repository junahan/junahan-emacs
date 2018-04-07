;;; package --- init-common-dev
;;; commentary:
;;; code:

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

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent))) ;; automatically indent when press RET

;;  (require 'sr-speedbar)
;;  (global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(use-package sr-speedbar
  :config
  (setq speedbar-show-unknown-files t)
  ;; (setq speedbar-use-images nil)
  ;;  (setq sr-speedbar-right-side nil)
  :bind
  ("C-c C-s" . sr-speedbar-toggle))

(provide 'init-common-dev)
;;; init-common-dev.el ends here
