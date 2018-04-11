;;; package -- init-ycmd
;;; Commentary:
;;; Code:

(require 'ycmd)
;;(add-hook 'after-init-hook #''global-ycmd-mode)
(add-hook 'c++-mode-hook 'ycmd-mode)

(set-variable 'ycmd-server-command (quote ("python" "~/github/ycmd/ycmd")))
(set-variable 'ycmd-global-config "~/github/ycmd/cpp/ycm/.ycm_extra_conf.py")

(require 'company-ycmd)
(company-ycmd-setup)

(require 'flycheck-ycmd)
(flycheck-ycmd-setup)

;;(require 'ycmd-eldoc)
;;(add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup)

(provide 'init-ycmd)
;;; init-ycmd.el ends here
