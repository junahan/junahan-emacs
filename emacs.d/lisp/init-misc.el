;;; Pacakage -- init-misc
;;; Commentary:
;;; Code:

;;evil 配置
;;(require 'evil)
;;(evil-mode 1)
;;(setq evil-default-state 'emacs)

;; 扩展选择区域
(require 'expand-region)

;;搜索配置
(require 'avy)
(require 'ace-jump-mode)

(require 'smartparens-config)
(smartparens-global-mode t)

(setq x-select-enable-clipboard t)
(defalias 'yes-or-no-p 'y-or-n-p)

(ivy-mode t)
(setq ivy-use-virtual-buffers t)

(which-key-mode)
;; (window-numbering-mode t)

(require 'crux)

(recentf-mode t)
(setq-default make-backup-files nil)

(global-undo-tree-mode t)

(global-auto-revert-mode t)

(super-save-mode t)
(setq super-save-auto-save-when-idle t)
(setq auto-save-default nil)

;;(setq init-open-recentf-interface 'swiper)
;; (init-open-recentf)
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "GNU Emacs")
(setq dashboard-setup-startup-banner 'logo)

(setq dashboard-items '((recents . 5)
                           (bookmarks . 5)
                           (projects . 5)
                           (agenda . 5)))
(page-break-lines-mode)

(require 'neotree)
;;(when neo-persist-show
;;  (add-hook 'popwin:before-popup-hook
;;            (lambda() (setq neo-persist-show nil)))
;;  (add-hook 'popwin:after-popup-hook
;;            (lambda () (setq neo-persist-show t))))

(setq projectile-switch-project-action 'neotree-projectile-action)

(provide 'init-misc)

;;; init-misc.el ends here
