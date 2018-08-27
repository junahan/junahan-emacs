;;; package --- init-theme
;;; commentary:
;;; code:

;; define theme
(if (display-graphic-p)
    (progn     ;; for graphic system
      (use-package gruvbox-theme
        :config
        (tool-bar-mode 0)
        (scroll-bar-mode 0)
        (set-cursor-color "White")
        (load-theme 'gruvbox-dark-soft t)
        (setq-default cursor-type 'bar)))
  (progn   ;; for text only terminal system
    (use-package gruvbox-theme
      :config
      ;; (load-theme 'gruvbox-dark-soft t)
      (set-cursor-color "White")
      (setq-default cursor-type 'bar))))

;; display line number
;; (global-linum-mode t)
(column-number-mode t)

;; (setq inhibit-startup-message t)

;; font setting
;; (set-default-font "SauceCodePro Nerd Font 16")
;; (set-default-font "Inziu Iosevka Slab SC 16")
;; (set-frame-font "-*-STSong-normal-normal-normal-*-14-*-*-*-p-0-iso10646-1")
(if (display-graphic-p)
    (set-default-font "-*-STSong-normal-normal-normal-*-16-*-*-*-p-0-iso10646-1"))

;; set the default frame size
(setq default-frame-alist
      '((height . 60)
        (width . 160)))

(provide 'init-theme)
;;; init-theme.el ends here
