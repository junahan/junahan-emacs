;;; package --- init-sql
;;; Commentary:
;;
;; Configure ejc-sql mode
;;
;;; Code:

;; install ejc-sql
(require-package 'ejc-sql)

;; configure auto-complete-mode and ejc-ac
(add-hook 'ejc-sql-minor-mode-hook
          (lambda ()
            (auto-complete-mode t)
            (ejc-ac-setup)
            (ejc-eldoc-setup)))

;; output customization for performance
(add-hook 'ejc-sql-connected-hook
          (lambda ()
            (ejc-set-fetch-size 50)
            (ejc-set-max-rows 50)
            (ejc-set-column-width-limit 25)))

;; use orgtbl-mode to provide result table.
;; disable the org mode babel wrapper.
(setq ejc-result-table-impl 'orgtbl-mode
      ejc-org-mode-babel-wrapper t)

(provide 'init-sql)
;;; init-sql.el ends here
