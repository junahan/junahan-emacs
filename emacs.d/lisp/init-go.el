;;; package -- init-go
;;; commentary:
;;; code:

(require-package 'go-mode)
(require-package 'go-autocomplete)
(require-package 'go-eldoc)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; auto config default.
(ac-config-default)

;; enable go-eldoc
(add-hook 'go-mode-hook 'go-eldoc-setup)

(provide 'init-go)
;;; init-go.el ends here
