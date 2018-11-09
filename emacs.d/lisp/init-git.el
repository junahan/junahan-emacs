;;; package --- init-git
;;; commentary:
;;; code:

(require-package 'git-gutter)
(require-package 'magit)

(use-package git-gutter
  :init
  (global-git-gutter-mode t))
  ;;(git-gutter:linum-setup))

;; for more about magit mode, please refer to
;; https://github.com/magit/magit/blob/master/Documentation/magit.org.
(use-package magit
  :bind
  (("C-x g" . magit-status)
   ("C-x M-g" . magit-dispatch-popup)))

(provide 'init-git)
;;; init-git.el ends here
