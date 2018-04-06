;;; package --- init-ggtags
;;; commentary:
;;; code:

;; for more about ggtags mode, please refer to https://github.com/leoliu/ggtags.
(require 'ggtags)

;; enable ggtags mode
(ggtags-mode 1)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

;;(dolist (map (list ggtags-mode-map dired-mode-map))
;;(define-key map (kbd "C-c t s") 'ggtags-find-other-symbol)
;;(define-key map (kbd "C-c t h") 'ggtags-view-tag-history)
;; (define-key map (kbd "C-c t r") 'ggtags-find-reference)
;; (define-key map (kbd "C-c t f") 'ggtags-find-file)
;; (define-key map (kbd "C-c t c") 'ggtags-create-tags)
;; (define-key map (kbd "C-c t u") 'ggtags-update-tags)
;; (define-key map (kbd "C-c t a") 'helm-gtags-tags-in-this-function)
;; (define-key map (kbd "M-.") 'ggtags-find-tag-dwim)
;; (define-key map (kbd "M-,") 'pop-tag-mark)
;; (define-key map (kbd "C-c <") 'ggtags-prev-mark)
;; (define-key map (kbd "C-c >") 'ggtags-next-mark))

(provide 'init-ggtags)
;;; init-ggtags.el ends here
