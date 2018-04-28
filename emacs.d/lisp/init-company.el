;;; Package -- init-company
;;; Commentary:
;;; Code:

(require-package 'company)
(require-package 'company-quickhelp)

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

;; Enable global-company-mode.
(add-hook 'after-init-hook 'global-company-mode)

(after-load 'company
  (define-key company-mode-map (kbd "M-/") 'comwalletpany-compl)
  (define-key company-active-map (kbd "M-/") 'company-other-backend)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (setq-default company-dabbrev-other-buffers 'all
                company-tooltip-align-annotations t))

;; global key mapping for company-complete
(global-set-key (kbd "M-C-/") 'company-complete)

;; (global-company-mode t)
(after-load 'company
  (setq company-idle-delay 0.08)
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (setq company-require-match nil)
  (setq company-dabbrev-downcase nil))

;; function to push company backend to local variable - company-backends.
(defun sanityinc/local-push-company-backend (backend)
  "Add BACKEND to a buffer-local version of 'company-backends'."
  (make-local-variable 'company-backends)
  (push backend company-backends))

;; for company-elisp
(after-load 'company
  (add-hook 'emacs-lisp-hook
            (lambda () (sanityinc/local-push-company-backend 'company-elisp))))

;; (use-package 'company-quickhelp)
(after-load 'company-quickhelp
  (add-hook 'after-init-hook 'company-quickhelp-mode))

;; Suspend page-break-lines-mode while company menu is active
;; (see https://github.com/company-mode/company-mode/issues/416)
(after-load 'company
  (after-load 'page-break-lines
    (defvar sanityinc/page-break-lines-on-p nil)
    (make-variable-buffer-local 'sanityinc/page-break-lines-on-p)

    (defun sanityinc/page-break-lines-disable (&rest ignore)
      (when (setq sanityinc/page-break-lines-on-p (bound-and-true-p page-break-lines-mode))
        (page-break-lines-mode -1)))

    (defun sanityinc/page-break-lines-maybe-reenable (&rest ignore)
      (when sanityinc/page-break-lines-on-p
        (page-break-lines-mode 1)))

    (add-hook 'company-completion-started-hook 'sanityinc/page-break-lines-disable)
    (add-hook 'company-completion-finished-hook 'sanityinc/page-break-lines-maybe-reenable)
    (add-hook 'company-completion-cancelled-hook 'sanityinc/page-break-lines-maybe-reenable)))

(provide 'init-company)
;;; init-company.el ends here
