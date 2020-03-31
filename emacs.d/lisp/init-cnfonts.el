;;; package --- init-cnfonts
;;; Commentary:
;;
;; From https://github.com/tumashu/cnfonts
;;
;;; Code:
(require-package 'cnfonts)

;; enable cnfonts
(use-package cnfonts
  :init
  (cnfonts-enable))

;; for org-mode headline
(after-load 'org
  (setq cnfonts-use-face-font-rescale t))

(provide 'init-cnfonts)
;;; init-cnfonts.el ends here
