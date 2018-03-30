;;; package --- init-org
;;; Commentary:
;;; Code:

(require 'org)
(require 'ox-md nil t)
(require 'org-latex nil t)

;; org-mode 文本内语法高亮
(setq org-src-fontify-natively t)

;; set default agend files
(setq org-agenda-files '("~/JUNAHAN-A" ))

;; org-agenda key binding
(global-set-key (kbd "C-c a") 'org-agenda)

(global-visual-line-mode 1)

(eval-after-load 'image '(require 'image+))
;; auto adjust the image to fit the frame.
(eval-after-load 'image+ '(imagex-auto-adjust-mode 1))

(provide 'init-org)

;;; init-org.el ends here

