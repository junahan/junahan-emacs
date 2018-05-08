;;; package --- init-cedet
;;; commentary:
;;; code:

(require-package 'semantic)

(after-load 'semantic
  (global-semanticdb-minor-mode t)
  (global-semantic-idle-scheduler-mode t)
  (global-semantic-stickyfunc-mode t)
  (semantic-mode t)
  (setq-default semantic-idle-scheduler-idle-time 432000)
  (add-hook 'semantic-init-hooks 'semantic-idle-completions-mode))

(defun alexott/cedet-hook ()
  "Config key bind for semantic fast jump."
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

;; Enable EDE only in C/C++
;; (require 'ede)
;; (global-ede-mode)

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t)

(provide 'init-cedet)
;;; init-cedet.el ends here
