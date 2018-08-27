;;; package -- init-lsp-python
;;; commentary:
;;; code:

(require-package 'lsp-mode)
(require-package 'lsp-python)
(add-hook 'python-mode-hook #'lsp-python-enable)

(provide 'init-lsp-python)
;;; init-lsp-python.el ends here
