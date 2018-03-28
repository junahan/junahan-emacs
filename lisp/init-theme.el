;;; package --- init-theme
;;; Commentary:
;;; Code:

;; 不要tab页了没用
;;(require 'tabbar)
;;(setq tabbar-buffer-groups-function nil)
;;(tabbar-mode t)

;;(require 'sr-speedbar)
;;(setq speedbar-show-unknown-files t)
;;(setq speedbar-use-images nil)

(use-package highlight-parentheses
  :config
  (global-highlight-parentheses-mode t))

;; (use-package all-the-icons
;;   :config
;;   (mode-icons-mode t))

(use-package popwin
  :config
  (popwin-mode t))

(use-package gruvbox-theme)

;; 暗色主题下光标颜色设置一下
(set-cursor-color "White")
(setq-default cursor-type 'bar)

;; 去掉工具栏
(if window-system
    (tool-bar-mode 0))

;; Disabled scroll bar
(if window-system
    (scroll-bar-mode 0))

;; 开启折叠
;; (hs-minor-mode t)
;; 显示行号
(global-linum-mode t)
(column-number-mode t)

;;(require 'spaceline-config)
;;(spaceline-spacemacs-theme)

(setq inhibit-startup-message t)

;; 字体配置
;; (set-default-font "SauceCodePro Nerd Font 16")
;; (set-default-font "Inziu Iosevka Slab SC 16")
;;(set-default-font "-*-STSong-normal-normal-normal-*-14-*-*-*-p-0-iso10646-1")
(set-frame-font "-*-STSong-normal-normal-normal-*-14-*-*-*-p-0-iso10646-1")

;; set the default frame size
(setq default-frame-alist
      '((height . 40)
        (width . 180)
        )
      )

;; (setq neo-theme (if window-system 'icons 'arrow))

(provide 'init-theme)

;;; init-theme.el ends here
