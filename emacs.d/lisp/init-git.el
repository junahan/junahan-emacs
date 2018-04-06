;;; package --- init-git
;;; commentary:
;;; code:

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

;; (global-set-key (kbd "C-c g c") 'magit-commit)
;; (global-set-key (kbd "C-c g p") 'magit-push)
;; (global-set-key (kbd "C-c g f") 'magit-pull)
;; (global-set-key (kbd "C-c g s") 'magit-status)
;; (global-set-key (kbd "C-c g d") 'magit-diff)
;; (global-set-key (kbd "C-c g o") 'magit-checkout)
;; (global-set-key (kbd "C-c g b") 'magit-branch)
;; (global-set-key (kbd "C-c g l") 'magit-log-all)
;; (global-set-key (kbd "C-c g m") 'magit-merge)
;; (global-set-key (kbd "C-c g r") 'magit-rebase)
;; (global-set-key (kbd "C-c g v") 'magit-revert)
;; (global-set-key (kbd "C-c g e") 'magit-rebase)

(provide 'init-git)
;;; init-git.el ends here
