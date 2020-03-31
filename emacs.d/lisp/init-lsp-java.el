;;; package -- init-lsp-java
;;; Commentary:
;;; Code:

(require 'cc-mode)
(require 'use-package)

(use-package lsp-mode :ensure t)
(use-package lsp-java :ensure t :after lsp
  :config (add-hook 'java-mode-hook 'lsp))

;;(require 'dap-java :after (lsp-java))
(after-load 'lsp-java
  (require 'dap-java))

;; correct the dap-java-test-runner parameter.
(setq dap-java-test-runner
      (concat lsp-java-server-install-dir "test-runner/junit-platform-console-standalone.jar"))

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
