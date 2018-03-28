
;; (if (eq system-type 'darwin)
;;    (progn
;;      (setq exec-path (append exec-path '("/Users/crossorbit/bin")))
;;      (setq exec-path (append exec-path '("/usr/local/bin")))
;;      (setq exec-path (append exec-path '("/Users/crossorbit/dev/gopath/bin")))))

;; (setq backup-directory-alist '(("." . "/tmp")))
;; (setenv "PATH" (concat ".:/Users/crossorbit/bin/:/usr/local/bin:" (getenv "PATH")))

;; (let ((path (shell-command-to-string ". ~/.bash_profile; echo -n $PATH")))
;; (setenv "PATH" path)
;; (setq exec-path
;; (append
;; (split-string-and-unquote path ":")
;;   exec-path)))

(use-package direnv)

(provide 'init-env)
