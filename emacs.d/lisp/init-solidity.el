;;; Package --- init-solidity
;;; Commentary:
;;; Code:

;; install solidity-mode
(require-package 'solidity-mode)

(use-package solidity-mode
  :bind
  ;; bind key for gas estimation at point
  ("C-c C-g" .  'solidity-estimate-gas-at-point)
  :init
  (setq solidity-comment-style 'slash)
  ;; active solc check
  (setq solidity-flycheck-solc-checker-active t)
  ;; active solium check
  (setq solidity-flycheck-solium-checker-active t)
  ;; append the company-solidity
  (add-hook 'solidity-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends)
                   (append '((company-solidity company-capf company-dabbrev-code))
                           company-backends)))))

(provide 'init-solidity)
;;; init-solidity.el ends here
