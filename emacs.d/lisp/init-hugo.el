;;; package --- init-hugo
;;; Commentary:
;;
;;; Code:

;;(use-package ox-hugo-auto-export) ;If you want the auto-exporting on file saves
(require-package 'ox-hugo)
(require-package 'org-ref)

(use-package ox-hugo
  :after ox)

;; (use-package org-ref-ox-hugo
;;   :straight (:host github :repo "jethrokuan/org-ref-ox-hugo" :branch "custom/overrides")
;;   :after org org-ref ox-hugo
;;   :config
;;   (add-to-list 'org-ref-formatted-citation-formats
;;                '("md"
;;                  ("article" . "${author}, *${title}*, ${journal}, *${volume}(${number})*, ${pages} (${year}). ${doi}")
;;                  ("inproceedings" . "${author}, *${title}*, In ${editor}, ${booktitle} (pp. ${pages}) (${year}). ${address}: ${publisher}.")
;;                  ("book" . "${author}, *${title}* (${year}), ${address}: ${publisher}.")
;;                  ("phdthesis" . "${author}, *${title}* (Doctoral dissertation) (${year}). ${school}, ${address}.")
;;                  ("inbook" . "${author}, *${title}*, In ${editor} (Eds.), ${booktitle} (pp. ${pages}) (${year}). ${address}: ${publisher}.")
;;                  ("incollection" . "${author}, *${title}*, In ${editor} (Eds.), ${booktitle} (pp. ${pages}) (${year}). ${address}: ${publisher}.")
;;                  ("proceedings" . "${editor} (Eds.), _${booktitle}_ (${year}). ${address}: ${publisher}.")
;;                  ("unpublished" . "${author}, *${title}* (${year}). Unpublished manuscript.")
;;                  ("misc" . "${author} (${year}). *${title}*. Retrieved from [${howpublished}](${howpublished}). ${note}.")
;;                  (nil . "${author}, *${title}* (${year})."))))

(provide 'init-hugo)
;;; init-hugo.el ends here
