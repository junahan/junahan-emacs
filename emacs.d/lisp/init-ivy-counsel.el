;;; package --- init-ivy-counsel
;;; commentary:
;;; code:

;; a lots of stuff is copy from - https://github.com/tuhdo/emacs-c-ide-demo
;; for more information about ivy-mode, please refer to https://oremacs.com/swiper/
(use-package ivy
  :init
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t))
  :bind
  (("C-s" . swiper)
   ("C-x b" . ivy-switch-buffer)
   ("C-c C-r" . ivy-resume)))

(use-package counsel
  :bind
  (("M-x" . counsel-M-x)
   ("M-y" . counsel-yank-pop)
   ("C-c r" . counsel-recentf)
   ("C-x C-f" . counsel-find-file)
   ("C-c C-i" . counsel-imenu)
   ("C-c C-g" . counsel-git)
   ("C-c C-b" . counsel-bookmark)
   ("C-c m t" . counsel-gtags-mode)
   ("<f1> f" . counsel-describe-function)
   ("<f1> v" . counsel-describe-variable)
   ("<f1> l" . counsel-load-library)
   ("C-h f" . counsel-describe-function)
   ("C-h v" . counsel-describe-variable)
   ("C-h l" . counsel-load-library)))

;; (use-package counsel-projectile
;;   :init
;;   (counsel-projectile-mode)
;;   :bind
;;   (("C-c p f" . counsel-projectile-find-file)
;;    ("C-c p a" . projectile-ag)
;;    ("C-c p l" . projectile-switch-project)))

(provide 'init-ivy-counsel)
;;; init-ivy-counsel.el ends here
