;;; package --- init-cask
;;; commentary:
;;; code:

;; use cask as package management tool.
(if (eq system-type 'darwin)
    (require  'cask "/usr/local/share/emacs/site-lisp/cask/cask.el"))
(cask-initialize)
(setq use-package-always-ensure t)

;; use pallet to allow package installation from Emacs.
(use-package pallet
  :config
  (pallet-mode t))

(provide 'init-cask)
;;; init-cask.el ends here
