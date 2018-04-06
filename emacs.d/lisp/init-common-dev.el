;;; package --- init-common-dev
;;; commentary:
;;; code:

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

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

;; 缩进线
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

(add-hook 'c-mode-hook
          'c++-mode)

(add-hook 'c++-mode-hook
          (lambda ()
            (setq flycheck-clang-language-standard "c++11")))

(global-aggressive-indent-mode 1)

(provide 'init-common-dev)
;;; init-common-dev.el ends here
