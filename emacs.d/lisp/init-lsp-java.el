;;; package -- init-lsp-java
;;; Commentary:
;;; Code:

(require-package 'lsp-java)
(require-package 'lsp-ui)

(use-package lsp-ui
  :init
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(after-load 'lsp-ui
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))

(use-package lsp-java
  :init
  (add-hook 'java-mode-hook #'lsp-java-enable)
  (add-hook 'java-mode-hook 'flycheck-mode)
  (setq lsp-java-server-install-dir "~/.emacs.server/eclipse.jdt.ls"))

(provide 'init-lsp-java)
;;; init-lsp-java.el ends here
