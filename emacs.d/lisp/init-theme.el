;;; package --- init-theme
;;; commentary:
;;; code:

(require-package 'spacemacs-theme)

;; define theme
(if (display-graphic-p)
    (progn     ;; for graphic system
      ;;(use-package spacemacs-theme
      ;;(use-package gruvbox-theme
      ;;:config
      (tool-bar-mode 0)
      (scroll-bar-mode 0)
      (set-cursor-color "White")
      (load-theme 'spacemacs-dark t)
      (setq-default cursor-type 'bar))
  (progn   ;; for text only terminal system
    ;;(use-package spacemacs-theme
    ;;(use-package gruvbox-theme
    ;;:config
    (load-theme 'spacemacs-dark t)
    ;;(set-cursor-color "White")
    (setq-default cursor-type 'bar)))

;; display line number
;; (global-linum-mode t)
;; (column-number-mode t)

;; (setq inhibit-startup-message t)

;; set the default frame size
;; (setq default-frame-alist
;;       '((height . 60)
;;         (width . 160)))

;; set maximized frame size.
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))

(provide 'init-theme)
;;; init-theme.el ends here
