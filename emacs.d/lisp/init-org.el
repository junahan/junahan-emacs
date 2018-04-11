;;; package --- init-org
;;; Commentary:
;;
;; Configure org mode with features:
;; - refile support.
;; - Fast Capturing template for TODO and NOTE.
;; - Org babel languages support.
;; - Ipython babel support with ob-ipython package.
;; Lots of stuff from - https://github.com/purcell/emacs.d/blob/master/lisp/init-org.el
;;
;;; Code:

(when *is-a-mac*
  (require 'grab-mac-link))

(require 'org-cliplink)

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)

;; Various preferences
(setq org-log-done t
      org-edit-timestamp-down-means-later t
      org-archive-mark-done nil
      org-hide-emphasis-markers t
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8
      org-fast-tag-selection-single-key 'expert
      org-html-validation-link nil
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 80)

(global-visual-line-mode 1)

(setq org-src-fontify-natively t)
(setq org-support-shift-select t)

;; define the refile targets
(defvar org-agenda-dir "")
(setq-default org-agenda-dir "~/org")
(setq org-default-notes-file "~/org/refile.org")
(setq org-agenda-files (list org-agenda-dir))

;;; Capturing
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      `(("t" "todo" entry (file "")  ; "" => `org-default-notes-file'
         "* TODO %?\n SCHEDULED: %U\n" :clock-resume t)
        ("n" "note" entry (file "")
         "* %? :NOTE:\n%U\n%a\n" :clock-resume t)
        ))

;; for image-model
(eval-after-load 'image '(require 'image+))
;; auto adjust the image to fit the frame.
(eval-after-load 'image+ '(imagex-auto-adjust-mode 1))
(eval-after-load 'org '(require 'ox-md nil t))
(eval-after-load 'org '(require 'org-latex nil t))

(after-load 'org
  (define-key org-mode-map (kbd "C-M-<up>") 'org-up-element)
  (when *is-a-mac*
    (define-key org-mode-map (kbd "M-h") nil)
    ))

;; ipython code block in org.
;; (require 'ob-ipython)
;;; display/update images in the buffer after evaluate
;; (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

;; don't prompt to confirm everytime
(setq org-confirm-babel-evaluate nil)

(after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   `((R . t)
     (ditaa . t)
     (dot . t)
     (emacs-lisp . t)
     (gnuplot . t)
     (haskell . nil)
     (latex . t)
     (ledger . t)
     (ocaml . nil)
     (octave . t)
     (plantuml . t)
     (python . t)
     (ipython . t)
     (ruby . t)
     (screen . nil)
     (,(if (locate-library "ob-sh") 'sh 'shell) . t)
     (sql . nil)
     (sqlite . t)
     (ein . t))))

(provide 'init-org)
;;; init-org.el ends here
