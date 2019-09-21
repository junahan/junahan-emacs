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

;; MySQL connection
;; (ejc-create-connection
;;  "MySQL-ces-debian-3306"
;;  :classpath (concat "~/.m2/repository/mysql/mysql-connector-java/5.1.47/"
;;                     "mysql-connector-java-5.1.47.jar")
;;  :subprotocol "mysql"
;;  :subname "//10.250.214.134:3306/mysql"
;;  :user "test"
;;  :password "test")

;; MySQL connections
;; (ejc-create-connection
;;  "Mysql-ces-debian-test"
;;  :classname "com.mysql.jdbc.Driver"
;;  :classpath "/Users/junahan/.m2/repository/mysql/mysql-connector-java/5.1.44/mysql-connector-java-5.1.44.jar"
;;  :password "test"
;;  :user "test"
;;  :port "3306"
;;  :host "10.250.214.134"
;;  :dbname "mysql"
;;  :dbtype "mysql")

(provide 'init-sql)
;;; init-sql.el ends here
