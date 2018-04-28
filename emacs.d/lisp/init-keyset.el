;;; package --- init-keyset
;;; Commentary:
;; Keyset binding for mac
;; - redefine the meta key for mac
;; - key binding for most common usage.
;;
;;; Code:

(defun format-buffer ()
  "Format the selected buffer."
  (interactive)
  ;; C-x h and C-M-\
  (indent-region (point-min) (point-max) nil))

(defun key-set ()
  "Keyset for most common usage."
  (interactive)
  ;; define meta key.
  (if (eq system-type 'darwin)
      (progn
        (setq mac-command-modifier 'alt)
        (setq mac-control-modifier 'control)
        (setq mac-option-modifier 'meta)))

  ;; unset C-SPC key to avoid conflict with system
  (global-unset-key (kbd "C-SPC"))
  ;; binding set-mark-command
  (global-set-key (kbd "C-x C-m") 'set-mark-command)

  ;; package
  (global-set-key (kbd "C-x p") 'package-list-packages))

(key-set)

(provide 'init-keyset)

;;; init-keyset.el ends here
