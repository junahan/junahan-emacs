;;; package --- init-git
;;; commentary:
;;; code:

(require-package 'git-gutter)
(require-package 'magit)

;; for more about magit mode, please refer to
;; https://github.com/magit/magit/blob/master/Documentation/magit.org.
(use-package git-gutter
  :init
  (global-git-gutter-mode t)
  (git-gutter:linum-setup))

(use-package magit
  :bind
  (("C-x g" . magit-status)
   ("C-x M-g" . magit-dispatch-popup)))

(provide 'init-git)
;;; init-git.el ends here
