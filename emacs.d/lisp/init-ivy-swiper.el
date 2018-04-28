;;; package --- init-ivy-swiper
;;; commentary:
;;; code:

(require-package 'ivy)
(require-package 'swiper)

;; for more about ivy-mode, please refer to https://oremacs.com/swiper/
(use-package ivy
  :init
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t))
  :bind
  (("C-s" . swiper)
   ("C-c C-r" . ivy-resume)))

(provide 'init-ivy-swiper)
;;; init-ivy-swiper.el ends here
