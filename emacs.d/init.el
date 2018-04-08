;;; package -- init
;;; commentary:
;;; code:

;; Most config copy from https://github.com/purcell/emacs.d project.

;; -*- lexical-binding: t -*-

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq debug-on-error t)

;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

;; Check Emacs version
(let ((minver "24.3"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "24.5")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; Add dir lisp to load-path - it contains more configuration module.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;; Adjust garbage collection thresholds during startup, and thereafter
(let ((init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold (* 20 1024 1024))))

;; Bootstrap confign
;; (setq inhibit-startup-message t)
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(require 'init-cask)
(require 'init-utils)
(require 'init-common)
(require 'init-git)
(require 'init-company)
(require 'init-flycheck)
(require 'init-ivy-counsel)
(require 'init-helm)
(require 'init-helm-gtags)
(require 'init-cpp)
(require 'init-cedet)
(require 'init-python)
(require 'init-ein)
(require 'init-org)
(require 'init-theme)
(require 'init-dashboard)
(require 'init-keyset)

;;; init.el ends here
