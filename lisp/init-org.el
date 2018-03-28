;;; package --- init-org
;;; Commentary:
;;; Code:

(use-package 'org)

;; org-mode 文本内语法高亮
(setq org-src-fontify-natively t)

;; set default agend files
(setq org-agenda-files '("~/JumpingEagle-misc" ))

;; org-agenda key binding
(global-set-key (kbd "C-c a") 'org-agenda)

(defun my-image-mode()
  (imagex-auto-adjust-mode 1)
  )

(defun my-org-mode()
  (global-visual-line-mode 1)
  (require 'ox-md nil t)
  (require 'org-latex nil t)
  )

(add-hook 'org-mode-hook' my-org-mode)
(add-hook 'image-mode-hook' my-image-mode)

(provide 'init-org)

;;; init-org.el ends here

