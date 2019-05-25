;;; package -- init-lsp-java
;;; Commentary:
;;; Code:

(require 'cc-mode)
(require 'use-package)
;;(require 'dap-java)
;;(require 'lsp-java-boot)

(use-package projectile :ensure t)
(use-package yasnippet :ensure t)
(use-package lsp-mode :ensure t)
(use-package hydra :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-ui :ensure t)
(use-package lsp-java :ensure t :after lsp
  :config (add-hook 'java-mode-hook 'lsp))

(use-package dap-mode
  :ensure t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

;;(use-package dap-java :after (lsp-java))

;; for STS support.
;;(add-hook 'lsp-mode-hook #'lsp-lens-mode)
;;(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)

;; (require-package 'lsp-mode)
;; (require-package 'company-lsp)
;; (require-package 'lsp-ui)
;; (require-package 'lsp-java)

;; (use-package projectile
;;   :ensure t)

;; (use-package treemacs
;;   :ensure t)

;; (use-package yasnippet
;;   :ensure t
;;   :config
;;   (yas-global-mode))

;; (use-package lsp-mode
;;   :ensure t
;;   :init (setq lsp-eldoc-render-all nil
;;               lsp-highlight-symbol-at-point nil))

;; (use-package hydra
;;   :ensure t)

;; (use-package company-lsp
;;   :after  company
;;   :ensure t
;;   :config
;;   (setq company-lsp-cache-candidates t
;;         company-lsp-async t))

;; (use-package lsp-ui
;;   :ensure t
;;   :config
;;   (setq lsp-ui-sideline-update-mode 'point))

;; (use-package lsp-java
;;   :ensure t
;;   :config
;;   (add-hook 'java-mode-hook
;;             (lambda ()
;;               (setq-local company-backends (list 'company-lsp))))

;;   (add-hook 'java-mode-hook 'lsp-java-enable)
;;   (add-hook 'java-mode-hook 'flycheck-mode)
;;   (add-hook 'java-mode-hook 'company-mode)
;;   (add-hook 'java-mode-hook 'lsp-ui-mode)
;;   (setq lsp-inhibit-message t))

;; (use-package dap-mode
;;   :ensure t
;;   :after lsp-mode
;;   :config
;;   (dap-mode t)
;;   (dap-ui-mode t))

;;(use-package dap-java
;;:after (lsp-java))

;;(use-package lsp-java-treemacs
;;:after (treemacs))

(provide 'init-lsp-java)
;;; init-lsp-java.el ends here
