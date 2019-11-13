;;; init-mu4e.el --- Email -*- lexical-binding: t -*-
;;; Commentary:
;; Lots of from - https://emacs.stackexchange.com/questions/12927/reading-and-writing-email-with-emacs/12932#12932
;;
;;; Code:

;; replace with your config
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")

(require 'mu4e)

;; use mu4e as MUA in emacs
(setq mail-user-agent 'mu4e-user-agent)

;; 默认邮箱
(setq user-mail-address "tiedang.yang@hotmail.com")

;; 默认用户名
(setq user-full-name "Tiedang Yang")

;; 邮箱地址列表
(setq mu4e-user-mail-address-list (list "tiedang.yang@hotmail.com"
                                        "tiedang.yang@foxmail.com"
                                        "yang.tiedang@cesgroup.com.cn"))

;; 配置 offlineimap 收取邮件
;; 每 5 分钟同步自动同步邮件，设置以秒为单位
(setq
 mu4e-get-mail-command "offlineimap"   ;; sync all accounts
 mu4e-update-interval 300)             ;; 300 to update every 5 minutes

;; 回复邮件插入邮件引用信息
(setq message-citation-line-function 'message-insert-formatted-citation-line)
(setq message-citation-line-format "On %a, %b %d %Y, %f wrote:\n")

;; 启用 inline iamge 显示并定义显示图片最大宽度
(setq
 mu4e-view-show-images t
 mu4e-view-image-max-width 800)

;; 如果 imagemagick 可用，则使用它处理图像。
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; 配置使用 w3m 处理 html mail，使用下来有些慢，更换为 shr
;;(setq mu4e-html2text-command "w3m -dump -T text/html")

;; 使用 shr 渲染当前 buffer
(require 'shr)
(defun shr-render-current-buffer ()
  "Render the selected region."
  (shr-render-region (point-min) (point-max)))
(setq mu4e-html2text-command 'shr-render-current-buffer)

;; 自动包含邮件签名
(setq mu4e-compose-signature-auto-include t)

;; 禁止回复给自己
(setq mu4e-compose-dont-reply-to-self t)

;; This enables unicode chars to be used for things like flags in the message index screens.
;; I've disabled it because the font I am using doesn't support this very well. With this
;; disabled, regular ascii characters are used instead.
;;(setq mu4e-use-fancy-chars t)

;; This enabled the thread like viewing of email similar to gmail's UI.
(setq mu4e-headers-include-related t)

;; This prevents saving the email to the Sent folder.
(setq mu4e-sent-messages-behavior 'delete)

;; This allows me to use 'helm' to select mailboxes
(setq mu4e-completing-read-function 'completing-read)

;; Why would I want to leave my message open after I've sent it?
(setq message-kill-buffer-on-exit t)

;; Don't ask to quit...
(setq mu4e-confirm-quit nil)

;; mu4e sets up visual-line-mode and also fill (M-q) to do the right thing
;; each paragraph is a single long line; at sending, emacs will add the
;; special line continuation characters.
(setq mu4e-compose-format-flowed t)

;; every new email composition gets its own frame! (window)
(setq mu4e-compose-in-new-frame t)

;; give me ISO(ish) format date-time stamps in the header list
;;(setq mu4e-headers-date-format "%Y-%m-%d %H:%M")

;; show full addresses in view message (instead of just names)
;; toggle per name with M-RET
(setq mu4e-view-show-addresses t)

;; Sometimes html email is just not readable in a text based client, this lets me open the
;; email in my browser.
(add-to-list 'mu4e-view-actions '("View in browser" . mu4e-action-view-in-browser) t)

;; Spell checking ftw.
(add-hook 'mu4e-compose-mode-hook 'flyspell-mode)

;; static folders
(setq mu4e-maildir       "~/Maildir"   ;; top-level Maildir
      mu4e-sent-folder   "/sent"       ;; folder for sent messages
      mu4e-drafts-folder "/drafts"     ;; unfinished messages
      mu4e-trash-folder  "/trash"      ;; trashed messages
      mu4e-refile-folder "/archive")   ;; refile messages

;; setup bookmarks
;; you can quickly switch to search unread messages -- press ``bu''
(setq mu4e-bookmarks
      '( ("flag:unread AND NOT flag:trashed"                          "Unread messages"                              ?u)
         ("date:today..now"                                           "Today's messages"                             ?t)
         ("date:7d..now"                                              "Last 7 days"                                  ?w)
         ("date:1d..now AND NOT list:emacs-orgmode.gnu.org"           "Last 1 days"                                  ?o)
         ("date:1d..now AND list:emacs-orgmode.gnu.org"               "Last 1 days (org mode)"                       ?m)
         ("maildir:/drafts"                                           "drafts"                                       ?d)
         ("flag:flagged AND NOT flag:trashed"                         "flagged"                                      ?f)
         ("mime:image/*"                                              "Messages with images"                         ?p)))

;; setup some handy shortcuts
;; you can quickly switch to your mailbox -- press ``j{x}''
;; then, when you want archive some messages, move them to
;; the 'All Mail' folder by pressing ``ma''.
(setq mu4e-maildir-shortcuts
      '( ("/yanghotmail/Inbox" . ?y)
         ("/cesgroup/INBOX"    . ?c)
         ("/archive"           . ?a)))

;; Show mu4e maildirs summary in mu4e-main-view
;; (require 'mu4e-maildirs-extension)
;; (mu4e-maildirs-extension)

;; not using smtp-async yet
;; 配置默认 smtp 服务以使用 smtpmail mode 发送 Email
;; SMTP 服务需要认证，我们采用 ~/.authinfo.gpg 的方式提供认证信息。
;; 有关 SMTP 认证, 参阅 https://www.emacswiki.org/emacs/SmtpAuth
(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server  "smtp.office365.com"
      smtpmail-smtp-service 587
      ;;smtpmail-starttls-credentials '(("smtp.office365.com" 587 nil nil))
      smtpmail-starttls-credentials "~/.authinfo.gpg"
      smtpmail-stream-type  'starttls)

;; Use the correct account context when sending mail based on the from header.
;; (setq message-sendmail-envelope-from 'header)

;; This is a helper to help determine which account context I am in based
;; on the folder in my maildir the email (eg. ~/Maildir/yanghotmail) is located in.
(defun mu4e-message-maildir-matches (msg rx)
  (when rx
    (if (listp rx)
        ;; If rx is a list, try each one for a match
        (or (mu4e-message-maildir-matches msg (car rx))
            (mu4e-message-maildir-matches msg (cdr rx)))
      ;; Not a list, check rx
      (string-match rx (mu4e-message-field msg :maildir)))))

;; ;; Choose account label to feed msmtp -a option based on From header
;; ;; in Message buffer; This function must be added to
;; ;; message-send-mail-hook for on-the-fly change of From address before
;; ;; sending message since message-send-mail-hook is processed right
;; ;; before sending message.
;; (defun choose-msmtp-account ()
;;   (if (message-mail-p)
;;       (save-excursion
;;         (let*
;;             ((from (save-restriction
;;                      (message-narrow-to-headers)
;;                      (message-fetch-field "from")))
;;              (account
;;               (cond
;;                ((string-match "tiedang.yang@hotmail.com" from) "yanghotmail")
;;                ((string-match "yang.tiedang@cesgroup.com.cn" from) "cesgroup"))))
;;           (setq message-sendmail-extra-arguments (list '"-a" account))))))

;; ;; Configure sending mail.
;; (setq message-send-mail-function 'message-send-mail-with-sendmail
;;       sendmail-program "/usr/local/bin/msmtp"
;;       user-full-name "Tiedang Yang")

;; ;; Use the correct account context when sending mail based on the from header.
;; (setq message-sendmail-envelope-from 'header)
;; (add-hook 'message-send-mail-hook 'choose-msmtp-account)

;; setup different contexts
(setq mu4e-contexts
      `( ,(make-mu4e-context
           :name "yanghotmail"
           :enter-func (lambda () (mu4e-message "Switch to the yanghotmail context"))
           :match-func (lambda (msg)
                         (when msg
                           (mu4e-message-maildir-matches msg "^/yanghotmail")))
           :leave-func (lambda () (mu4e-clear-caches))
           :vars '((user-mail-address            . "tiedang.yang@hotmail.com")
                   (user-full-name               . "Tiedang Yang")
                   (smtpmail-default-smtp-server . "smtp.office365.com")
                   (smtpmail-smtp-server         . "smtp.office365.com")
                   (smtpmail-smtp-service        . 587)
                   (smtpmail-stream-type         . starttls)
                   (mu4e-compose-signature       .
                                                 (concat
                                                  "Junahan Yang\n"
                                                  "https://www.junahan.com\n"))
                   ;;(mu4e-sent-folder      . "/yanghotmail/Sent")
                   ;;(mu4e-drafts-folder    . "/yanghotmail/Drafts")
                   ;;(mu4e-trash-folder     . "/yanghotmail/Junk")
                   ;;(mu4e-refile-folder    . "/yanghotmail/Archive")
                   ))
         ,(make-mu4e-context
           :name "fyangfoxmail"
           :enter-func (lambda () (mu4e-message "Switch to the cesgroup context"))
           :match-func (lambda (msg)
                         (when msg
                           (mu4e-message-maildir-matches msg "^/yangfoxmail")))
           :leave-func (lambda () (mu4e-clear-caches))
           :vars '((user-mail-address            . "tiedang.yang@foxmail.com")
                   (user-full-name               . "Yang Tiedang")
                   (smtpmail-default-smtp-server . "smtp.qq.com")
                   (smtpmail-smtp-server         . "smtp.qq.com")
                   (smtpmail-smtp-service        . 465)
                   (smtpmail-stream-type         . ssl)
                   (mu4e-compose-signature       .
                                                 (concat
                                                  "Junahan Yang\n"
                                                  "https://www.junahan.com\n"))
                   ;;(mu4e-sent-folder      . "/yangfoxmail/已发送")
                   ;;(mu4e-drafts-folder    . "/yangfoxmail/草稿")
                   ;;(mu4e-trash-folder     . "/yangfoxmail/垃圾邮件")
                   ;;(mu4e-refile-folder    . "/yangfoxmail/Archive")
                   ))
         ,(make-mu4e-context
           :name "cesgroup"
           :enter-func (lambda () (mu4e-message "Switch to the cesgroup context"))
           :match-func (lambda (msg)
                         (when msg
                           (mu4e-message-maildir-matches msg "^/cesgroup")))
           :leave-func (lambda () (mu4e-clear-caches))
           :vars '((user-mail-address            . "yang.tiedang@cesgroup.com.cn")
                   (user-full-name               . "Yang Tiedang")
                   (smtpmail-default-smtp-server . "smtp.qiye.aliyun.com")
                   (smtpmail-smtp-server         . "smtp.qiye.aliyun.com")
                   (smtpmail-smtp-service        . 465)
                   (smtpmail-stream-type         . ssl)
                   (mu4e-compose-signature       .
                                                 (concat
                                                  "Tiedang Yang\n"))
                   ;;(mu4e-sent-folder      . "/cesgroup/已发送")
                   ;;(mu4e-drafts-folder    . "/cesgroup/草稿")
                   ;;(mu4e-trash-folder     . "/cesgroup/垃圾邮件")
                   ;;(mu4e-refile-folder    . "/cesgroup/Archive")
                   ))))

;; set `mu4e-context-policy` and `mu4e-compose-policy` to tweak when mu4e should
;; guess or ask the correct context, e.g.

;; start with the first (default) context;
;; default is to ask-if-none (ask when there's no context yet, and none match)
(setq mu4e-context-policy 'pick-first)

;; compose with the current context is no context matches;
;; default is to ask
(setq mu4e-compose-context-policy nil)

;; ;; 配置查询片段以定义 mu 过滤查询
;; (require 'mu4e-query-fragments)
;; (setq mu4e-query-fragments-list
;;       '(("%junk" . "maildir:/Junk OR subject:SPAM")
;;         ("%hidden" . "flag:trashed OR %junk")))
;; (setq mu4e-query-fragments-append "AND NOT %hidden")

;;; Org mode compatibility
;; Use `org-store-link' to store links, and `org-insert-link' to paste them
(require 'org-mu4e)
;;store link to message if in header view, not to header query
(setq org-mu4e-link-query-in-headers-mode nil)

;; Choose the style you prefer for desktop notifications
;; If you are on Linux you can use
;; 1. notifications - Emacs lisp implementation of the Desktop Notifications API
;; 2. libnotify     - Notifications using the `notify-send' program, requires `notify-send' to be in PATH
;;
;; On Mac OSX you can set style to
;; 1. notifier      - Notifications using the `terminal-notifier' program, requires `terminal-notifier' to be in PATH
;; 1. growl         - Notifications using the `growl' program, requires `growlnotify' to be in PATH
(require-package 'mu4e-alert)
(mu4e-alert-set-default-style 'notifier)
;;(add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
;; enable mode line display
(add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)

;; config helm-mu mode for search mails.
;; disalbe because it doen't support search by UTF8 String.
;; (require-package 'helm-mu)
;; (setq helm-mu-gnu-sed-program "gsed")
;; (define-key mu4e-main-mode-map "s" 'helm-mu)
;; (define-key mu4e-headers-mode-map "s" 'helm-mu)
;; (define-key mu4e-view-mode-map "s" 'helm-mu)

(provide 'init-mu4e)
;;; init-mu4e.el ends here
