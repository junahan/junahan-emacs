;;; package --- init-cask
;;; Commentary:
;;; Code:

;;{{VERSION}}

;;设置插件管理工具
(if (eq system-type 'darwin)
    (require  'cask "/usr/local/share/emacs/site-lisp/cask/cask.el"))
(cask-initialize)
(setq use-package-always-ensure t)

;; 插件cask的管理器
(use-package pallet
  :config
  (pallet-mode t))

(provide 'init-cask)
;;; init-cask.el ends here

