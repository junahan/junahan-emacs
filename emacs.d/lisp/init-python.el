;;; package -- init-python
;;; commentary:
;;; code:

;; using elpy with ipython
(require 'elpy)
(elpy-enable)

;; enable ipython
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; virtual env with conda.
(require 'conda)
;; interactive shell support
(conda-env-initialize-interactive-shells)
;; eshell support
(conda-env-initialize-eshell)
;; enable auto-activation
;; (conda-env-autoactivate-mode t)
;; anaconda home
(custom-set-variables  '(conda-anaconda-home "~/anaconda3"))

;; using flycheck replace flymake
(when (require 'flychck nil t)
  (setq elpy-models (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable qutopep8 on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; disable aggressive-indent-mode
(aggressive-indent-mode nil)

;; ;; company
;; (after-load 'company
;;   (add-hook 'python-mode-hook
;;             (lambda () (sanityinc/local-push-company-backend 'elpy-company-backend))))

(provide 'init-python)
;;; init-python.el ends here
