;;; package -- init-lsp-go
;;; commentary:
;;; code:

(require-package 'lsp-mode)
(require-package 'lsp-go)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

;; Golang lsp
(lsp-define-stdio-client
 lsp-go
 "go"
 (lambda () default-directory)
 '("go-langserver" "-mode=stdio" "-gocodecompletion"))
;; :ignore-regexps
;; '("^langserver-go: reading on stdin, writing on stdout$"))

(add-hook 'go-mode-hook #'lsp-go-enable)

(provide 'init-lsp-go)
;;; init-lsp-go.el ends here
