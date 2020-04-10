;;; package -- init-lsp-mode
;;; Commentary:
;;; Code:
(require 'use-package)
(require 'cc-mode)

(use-package projectile :ensure t)
(use-package yasnippet :ensure t)
(use-package lsp-mode :ensure t)
(use-package hydra  :ensure t)
(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)
(use-package company-lsp
  :ensure t
  :commands company-lsp)
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; enable helm-lsp
(use-package helm-lsp
  :ensure t :after lsp
  :commands helm-lsp-workspace-symbol)

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
