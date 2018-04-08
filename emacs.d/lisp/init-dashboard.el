;;; pacakage -- init-dashboard
;;; commentary:
;;; code:

(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-setup-startup-banner 1)

(setq dashboard-items '((recents . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)))
(page-break-lines-mode)

(provide 'init-dashboard)
;;; init-dashboard.el ends here
