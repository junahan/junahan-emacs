;;; package -- init-jdee
;;; Commentary:
;; Losts of stuff copy from https://github.com/purcell/emacs.d project.
;;
;;; Code:

(require-package 'jdee)

(use-package jdee
  :config
  (custom-set-variables
   '(jdee-server-dir "~/java-lib/jdee-server")))

(provide 'init-jdee)
;;; init-jdee.el ends here
