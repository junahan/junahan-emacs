;;; package -- s
;;; Commentary:
;;; author cnsworder, cnsworder@gmail.com


;;; Code:

;;{{VERSION}}

;; 插件载入路径
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;设置插件服务器
(require 'init-package)

(require 'init-env)
;;(require 'init-helm)
(require 'init-dev)
(require 'init-theme)

;; load org-mode
(require 'init-org)
(require 'keyset)
(require 'init-custom)

(defun hack-emacs ()
  "config file"
  (interactive)
  (find-file "~/.emacs.d/lisp/"))

(provide 'init-utils)
;;; init-utils.el ends here
