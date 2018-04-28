;;; package -- init-ein
;;; commentary:
;;; code:

;; using ein
(require-package 'ein)

;;(set-variable 'ein:jupyter-default-server-command "jupyter")
(set-variable 'ein:jupyter-default-notebook-directory "~/jupyter-notebook")
(set-variable 'ein:query-timeout 3000)
;;(set-variable 'ein:completion-backend 'ein:use-company-backend)
;;(add-to-hook ’after-init-hook ’ein:notebooklist-load)

(provide 'init-ein)
;;; init-ein.el ends here
