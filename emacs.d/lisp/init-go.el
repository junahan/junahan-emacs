;;; package -- init-go
;;; commentary:
;;; code:

(require-package 'go-mode)
(require-package 'company-go)
(require-package 'go-eldoc)
(require-package 'go-errcheck)
(require-package 'go-dlv)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; enable company-go
;; (add-hook 'go-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'company-backends)
;;                  (append '((company-go company-capf company-dabbrev-code))
;;                          company-backends))))

;; enable company-go only
(add-hook 'go-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends) '(company-go))
            (company-mode)))

;; enable go-eldoc
(add-hook 'go-mode-hook 'go-eldoc-setup)

;; godef jump key binding
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") 'godef-jump)))

(provide 'init-go)
;;; init-go.el ends here
