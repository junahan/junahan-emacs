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
(require-package 'gnuplot)
;; used to export html
(require-package 'htmlize)
;; for bib
(require-package 'ebib)
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

(defvar sanityinc/org-global-prefix-map (make-sparse-keymap)
  "A keymap for handy global access to org helpers, particularly clocking.")

(define-key sanityinc/org-global-prefix-map (kbd "j") 'org-clock-jump-to-current-clock)
(define-key sanityinc/org-global-prefix-map (kbd "l") 'org-clock-in-last)
(define-key sanityinc/org-global-prefix-map (kbd "i") 'org-clock-in)
(define-key sanityinc/org-global-prefix-map (kbd "o") 'org-clock-out)
(define-key global-map (kbd "C-c o") sanityinc/org-global-prefix-map)

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

;; Lots of stuff from http://doc.norang.ca/org-mode.html

;; TODO: fail gracefully
(defun sanityinc/grab-ditaa (url jar-name)
  "Download URL and extract JAR-NAME as `org-ditaa-jar-path'."
  ;; TODO: handle errors
  (message "Grabbing %s for org." jar-name)
  (let ((zip-temp (make-temp-name "emacs-ditaa")))
    (unwind-protect
        (progn
          (when (executable-find "unzip")
            (url-copy-file url zip-temp)
            (shell-command (concat "unzip -p " (shell-quote-argument zip-temp)
                                   " " (shell-quote-argument jar-name) " > "
                                   (shell-quote-argument org-ditaa-jar-path)))))
      (when (file-exists-p zip-temp)
        (delete-file zip-temp)))))

(after-load 'ob-ditaa
  (unless (and (boundp 'org-ditaa-jar-path)
               (file-exists-p org-ditaa-jar-path))
    (let ((jar-name "ditaa0_9.jar")
          (url "http://jaist.dl.sourceforge.net/project/ditaa/ditaa/0.9/ditaa0_9.zip"))
      (setq org-ditaa-jar-path (expand-file-name jar-name (file-name-directory user-init-file)))
      (unless (file-exists-p org-ditaa-jar-path)
        (sanityinc/grab-ditaa url jar-name)))))

(after-load 'ob-plantuml
  (let ((jar-name "plantuml.jar")
        (url "http://jaist.dl.sourceforge.net/project/plantuml/plantuml.jar"))
    (setq org-plantuml-jar-path (expand-file-name jar-name (file-name-directory user-init-file)))
    (unless (file-exists-p org-plantuml-jar-path)
      (url-copy-file url org-plantuml-jar-path))))

;; Re-align tags when window shape changes
(after-load 'org-agenda
  (add-hook 'org-agenda-mode-hook
            (lambda () (add-hook 'window-configuration-change-hook 'org-agenda-align-tags nil t))))

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
;; default notes file
;; (setq org-default-notes-file "~/junahan-cal/parking.org")
(setq org-default-notes-file (expand-file-name "notes.org" org-agenda-dir))
;; define org files
(setq org-agenda-file-history (expand-file-name "history.org" org-agenda-dir))
(setq org-agenda-file-parking (expand-file-name "parking.org" org-agenda-dir))
;; define agenda files loaded by agendas by default
(setq org-agenda-files (list org-agenda-dir))

;; Capturing
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      `(("t" "todo" entry (file "")  ; "" => `org-default-notes-file'
         "* TODO [#B] %?\n%T\n%a\n" :clock-in t :clock-resume t)
        ("n" "note" entry (file "")
         "* %? :NOTE:\n%T\n%a\n" :clock-in t :clock-resume t)
        ("j" "journal" entry (file "")
         "* %? :JOURNAL:\n%U\n%a\n" :clock-in t :clock-resume t)
        ("m" "meeting" entry (file "")
         "* %? :MEETING:\n%T" :clock-in t :clock-resume t)
        ("p" "Phone call" entry (file "")
         "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
        ))

;; task keyworks.
(setq org-todo-keywords
      '((sequence "TODO(t!)" "DRAFT(s)" "|" "DONE(d @/!)" "CANCELED(c @/!)")
        ))

;;; Refiling
(setq org-refile-use-cache nil)

;; Targets include this file and any file contributing to the agenda - up to 3 levels deep
(setq org-refile-targets '((nil :maxlevel . 3) (org-agenda-files :maxlevel . 3)))

(after-load 'org-agenda
  (add-to-list 'org-agenda-after-show-hook 'org-show-entry))

(advice-add 'org-refile :after (lambda (&rest _) (org-save-all-org-buffers)))

;; Exclude DONE state tasks from refile targets
(defun sanityinc/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets."
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))
(setq org-refile-target-verify-function 'sanityinc/verify-refile-target)

(defun sanityinc/org-refile-anywhere (&optional goto default-buffer rfloc msg)
  "A version of `org-refile' which allows refiling to any subtree."
  (interactive "P")
  (let ((org-refile-target-verify-function))
    (org-refile goto default-buffer rfloc msg)))

(defun sanityinc/org-agenda-refile-anywhere (&optional goto rfloc no-update)
  "A version of `org-agenda-refile' which allows refiling to any subtree."
  (interactive "P")
  (let ((org-refile-target-verify-function))
    (org-agenda-refile goto rfloc no-update)))

;; Targets start with the file name - allows creating level 1 tasks
;;(setq org-refile-use-outline-path (quote file))
(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)

;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes 'confirm)

(add-hook 'org-agenda-mode-hook 'hl-line-mode)

;;; Org clock

;; Save the running clock and all clock history when exiting Emacs, load it on startup
(after-load 'org
  (org-clock-persistence-insinuate))
(setq org-clock-persist t)
(setq org-clock-in-resume t)

;; Save clock data and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Save state changes in the LOGBOOK drawer
(setq org-log-into-drawer t)
;; Removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Show clock sums as hours and minutes, not "n days" etc.
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

;;; Show the clocked-in task - if any - in the header line
(defun sanityinc/show-org-clock-in-header-line ()
  (setq-default header-line-format '((" " org-mode-line-string " "))))

(defun sanityinc/hide-org-clock-from-header-line ()
  (setq-default header-line-format nil))

(add-hook 'org-clock-in-hook 'sanityinc/show-org-clock-in-header-line)
(add-hook 'org-clock-out-hook 'sanityinc/hide-org-clock-from-header-line)
(add-hook 'org-clock-cancel-hook 'sanityinc/hide-org-clock-from-header-line)

(after-load 'org-clock
  (define-key org-clock-mode-line-map [header-line mouse-2] 'org-clock-goto)
  (define-key org-clock-mode-line-map [header-line mouse-1] 'org-clock-menu))

;; notify clock in/out by org-clock-statusbar.app
(when (and *is-a-mac* (file-directory-p "/Applications/org-clock-statusbar.app"))
  (add-hook 'org-clock-in-hook
            (lambda () (call-process "/usr/bin/osascript" nil 0 nil "-e"
                                     (concat "tell application \"org-clock-statusbar\" to clock in \"" org-clock-current-task "\""))))
  (add-hook 'org-clock-out-hook
            (lambda () (call-process "/usr/bin/osascript" nil 0 nil "-e"
                                     "tell application \"org-clock-statusbar\" to clock out"))))

;; for headline font
;;(after-load 'cnfonts
;; (setq cnfonts-use-face-font-rescale t))

;;; Archiving
(setq org-archive-mark-done nil)
(setq org-archive-location "%s_archive::* Archive")

;; don't prompt to confirm everytime
(setq org-confirm-babel-evaluate nil)

;;; org-pomodoro
(require-package 'org-pomodoro)
(setq org-pomodoro-keep-killed-pomodoro-time t)
(after-load 'org-agenda
  (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro))

;; with fast selection keys
(setq org-tag-alist (quote ((:startgroup)
                            ("@office" . ?o)
                            ("@home" . ?H)
                            (:endgroup)
                            ("PERSONAL" . ?P)
                            ("WORK" . ?W)
                            ("NOTE" . ?n)
                            ("JOURNAL" . ?j)
                            ("CES" . ?e)
                            ("OKR" . ?k)
                            ("CANCELLED" . ?c)
                            ("FLAGGED" . ??))))

(after-load 'org
  (define-key org-mode-map (kbd "C-M-<up>") 'org-up-element)
  (when *is-a-mac*
    (define-key org-mode-map (kbd "M-h") nil)
    (define-key org-mode-map (kbd "C-c g") 'org-mac-grab-link)))

;; exporter settings.
;;(require 'ox-md)
;;(require 'ox-html)
;;(require 'ox-latex)
;;(require 'ox-ascii)

;; support ox-pandoc
;;(with-eval-after-load 'ox  (require 'ox-pandoc))
;; support to latex
;;(eval-after-load 'org '(require 'org-latex nil t))

;; support org-ref
(after-load 'org
  (require 'org-ref nil t))

;; Latex export with bibtex
(setq org-latex-pdf-process
      '("%latex -interaction nonstopmode -output-directory %o %f"
        "bibtex %b"
        ;;"latexmk -shell-escape -bibtex -pdf %f" ;; for biblatex.
        "%latex -interaction nonstopmode -output-directory %o %f"
        "%latex -interaction nonstopmode -output-directory %o %f"))

;; org babel language settings.
(after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   `((R            . t)
     (ditaa        . t)
     (dot          . t)
     (emacs-lisp   . t)
     (lisp         . t)
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

;; support export bibtex
(after-load 'org
  (require  'ox-bibtex)
  (require  'ox-bibtex-chinese)
  (ox-bibtex-chinese-enable))

(provide 'init-org)
;;; init-org.el ends here
