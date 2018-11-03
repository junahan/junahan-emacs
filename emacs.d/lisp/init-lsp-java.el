;;; package -- init-lsp-java
;;; Commentary:
;;; Code:

(require-package 'lsp-mode)
(require-package 'company-lsp)
(require-package 'lsp-ui)
(require-package 'lsp-java)

;; (use-package lsp-ui
;;   :init
;;   (add-hook 'lsp-mode-hook 'lsp-ui-mode))

;; (after-load 'lsp-ui
;;   (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;;   (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))

;; (use-package lsp-java
;;   :init
;;   (add-hook 'java-mode-hook #'lsp-java-enable)
;;   (add-hook 'java-mode-hook 'flycheck-mode)
;;   (setq lsp-java-server-install-dir "~/.emacs.server/eclipse.jdt.ls"))

(use-package lsp-mode
  :ensure t
  :init (setq lsp-inhibit-message t ; you may set this to t to hide messages from message area
              lsp-eldoc-render-all nil
              lsp-highlight-symbol-at-point nil))

(use-package company-lsp
  :after  company
  :ensure t
  :config
  (add-hook 'java-mode-hook (lambda () (push 'company-lsp company-backends)))
  (setq company-lsp-enable-snippet t
        company-lsp-cache-candidates t))
;;  (push 'java-mode company-global-modes))

(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-sideline-enable t
        lsp-ui-sideline-show-symbol t
        lsp-ui-sideline-show-hover t
        lsp-ui-sideline-show-code-actions t
        lsp-ui-sideline-update-mode 'point))

(use-package lsp-java
  :ensure t
  :requires (lsp-ui-flycheck lsp-ui-sideline)
  :config
  (add-hook 'java-mode-hook  'lsp-java-enable)
  (add-hook 'java-mode-hook  'flycheck-mode)
  (add-hook 'java-mode-hook  'company-mode)
  (add-hook 'java-mode-hook  (lambda () (lsp-ui-flycheck-enable t)))
  (add-hook 'java-mode-hook  'lsp-ui-sideline-mode)
  :init
  (setq lsp-java-server-install-dir "~/.emacs.server/eclipse.jdt.ls"))

(provide 'init-lsp-java)
;;; init-lsp-java.el ends here
