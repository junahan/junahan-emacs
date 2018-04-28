;;; package -- init-flycheck
;;; Commentary:
;;; Code:

(require-package 'flycheck)
(require-package 'flycheck-color-mode-line)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list))

;; (require 'flycheck-color-mode-line)
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

(provide 'init-flycheck)
;;; init-flycheck.el ends here
