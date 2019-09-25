;;; package --- init-org
;;; Commentary:
;;
;; Configure org mode with features:
;; - refile support.
;; - Fast Capturing template for TODO and NOTE.
;; - Org babel languages support.
;;
;; Lots of stuff from - https://github.com/purcell/emacs.d/blob/master/lisp/init-org.el
;;
;;; Code:

(when *is-a-mac*
  (require-package 'grab-mac-link))

(require-package 'org-cliplink)
;; for latex.
(require-package 'cdlatex)
(require-package 'auctex)
(require-package 'gnuplot)
;; used to export html
(require-package 'htmlize)
;; using the pomodoro technique
(require-package 'org-pomodoro)
;; using play
(require-package 'sound-wav)
;; for ob-sql-mode
;;(require-package 'sql)
;;(require-package 'ob-sql-mode)

;; ob-http is used to send http request using curl
(require-package 'ob-http)

;;(require-package 'gnuplot-mode)
;; (require-package 'image+)
;; (require 'org-tempo)

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)

;; Various preferences
(setq org-log-done 'time
      org-log-done 'note
      org-log-into-drawer t
      ;;org-log-note-state t
      mark-holidays-in-calendar t
      org-src-tab-acts-natively t
      org-edit-timestamp-down-means-later t
      org-archive-mark-done nil
      org-hide-emphasis-markers t
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8
      org-fast-tag-selection-single-key 'expert
      org-html-validation-link nil
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 80)

;; set the play sounds notification
(setq org-pomodoro-play-sounds t)

(global-visual-line-mode t)

(setq org-src-fontify-natively t)
(setq org-support-shift-select t)

;; Enlarge latex Fragment in Org-mode
;;(plist-put org-format-latex-options :scale 2)
;;(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

;; for spell check
;; could be ispell as well, depending on your preferences
(setq ispell-program-name "aspell")
;; this can obviously be set to any language your spell-checking program supports
(setq ispell-dictionary "english")

(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-buffer)

;; define the refile targets
(defvar org-agenda-dir "")
(setq-default org-agenda-dir "~/junahan-cal")
(setq org-default-notes-file "~/junahan-cal/notes.org")
(setq org-agenda-files (list org-agenda-dir))

;; Capturing
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      `(("t" "todo" entry (file "")  ; "" => `org-default-notes-file'
         "* TODO %?\n SCHEDULED: %U\n" :clock-resume t)
        ("n" "note" entry (file "")
         "* %? :NOTE:\n%U\n%a\n" :clock-resume t)
        ))

;; task keyworks.
(setq org-todo-keywords
      '((sequence "TODO(t!)" "DRAFT(s)" "|" "DONE(d!)" "CANCELED(c @/!)")
        ))

;; for image-model
;; (eval-after-load 'image '(require 'image+))
;; auto adjust the image to fit the frame.
;; (eval-after-load 'image+ '(imagex-auto-adjust-mode 1))
(eval-after-load 'org '(require 'ox-md nil t))
;;(eval-after-load 'org '(require 'org-latex nil t))

(after-load 'org
  (define-key org-mode-map (kbd "C-M-<up>") 'org-up-element)
  (when *is-a-mac*
    (define-key org-mode-map (kbd "M-h") nil)))

;; don't prompt to confirm everytime
(setq org-confirm-babel-evaluate nil)

;; org babel language settings.
(after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   `((R            . t)
     (ditaa        . t)
     (dot          . t)
     (emacs-lisp   . t)
     (gnuplot      . t)
     (haskell      . nil)
     (latex        . t)
     (asymptote    . t)
     (ledger       . t)
     (ocaml        . nil)
     (octave       . t)
     (plantuml     . t)
     (python       . t)
     (ruby         . t)
     (screen       . nil)
     (,(if (locate-library "ob-sh") 'sh 'shell) . t)
     (sql          . t)
     ;;(sql-mode     . t)
     (sqlite       . t)
     (http          . t))))

(provide 'init-org)
;;; init-org.el ends here
