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

;; enable helm-lsp
(use-package helm-lsp :ensure t :after lsp)

(use-package dap-mode
  :ensure t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

;;(require 'dap-java :after (lsp-java))
(after-load 'lsp-java
  (require 'dap-java))

;; enable dap-hydra
(add-hook 'dap-stopped-hook
          (lambda (arg) (call-interactively #'dap-hydra)))

;; spring boot support
(require 'lsp-java-boot)

;; to enable the lenses
(add-hook 'lsp-mode-hook #'lsp-lens-mode)
(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)

;; 设置 tab-width 以使用 2 个空格代替 TAB。
;; 需要特别注意设置 c-basic-offset 以防止 java formatter 不起作用。
;; 相关设置详情，请参阅 https://www.emacswiki.org/emacs/IndentingJava.
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2
                                  tab-width 2
                                  indent-tabs-mode nil)))

;;(setq lsp-java-format-settings-url "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml")
;;(setq lsp-java-format-settings-profile "GoogleStyle")

(provide 'init-lsp-java)
;;; init-lsp-java.el ends here
