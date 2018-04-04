;;; package -- init-python
;;; Commentary:
;;; Code:

;; using elpy with ipython
(require 'elpy)
(elpy-enable)
;; enable ipython
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; using flycheck replace flymake
(when (require 'flychck nil t)
  (setq elpy-models (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable qutopep8 on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; disable aggressive-indent-mode
(aggressive-indent-mode nil)

(add-hook 'python-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends) '(elpy-company-backend
                                                           company-ycmd
                                                           (company-keywords
                                                            company-files
                                                            company-gtags
                                                            company-etags
                                                            company-yasnippet
                                                            company-abbrev
                                                            company-dabbrev
                                                            )
                                                           company-bbdb
                                                           company-nxml
                                                           company-css
                                                           company-files
                                                           (company-dabbrev-code
                                                            company-gtags
                                                            company-etags
                                                            company-keywords
                                                            )
                                                           company-oddmuse
                                                           company-dabbrev))))


(provide 'init-python)
;;; init-python.el ends here
