;;; package -- init-lsp-mode
;;; Commentary:
;;; Code:

(require 'cc-mode)
(require 'use-package)

(use-package projectile :ensure t)
(use-package yasnippet :ensure t)
(use-package lsp-mode :ensure t)
(use-package hydra :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-ui :ensure t)

;; enable helm-lsp
(use-package helm-lsp :ensure t :after lsp)

(use-package posframe :ensure t)
(use-package dap-mode
  :ensure t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t)
  (dap-tooltip-mode t)
  (tooltip-mode t)
  (dap-ui-controls-mode t))

;; enable dap-hydra
(add-hook 'dap-stopped-hook
          (lambda (arg) (call-interactively #'dap-hydra)))

(provide 'init-lsp-mode)
;;; init-lsp-mode.el ends here
