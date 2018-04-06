;;; package --- init-keyset
;;; commentary:
;;; code:

(defun format-buffer ()
  "格式化"
  (interactive)
  ;; C-x h and C-M-\
  (indent-region (point-min) (point-max) nil)
  )

(defun key-set ()
  "设置快捷键"
  (interactive)
  ;; meta键调整
  (if (eq system-type 'darwin)
      (progn
        (setq mac-command-modifier 'alt)
        (setq mac-control-modifier 'control)
        (setq mac-option-modifier 'meta)))

  ;; 避免输入法切换冲突
  (global-unset-key (kbd "C-SPC"))
  ;; binding set-mark-command
  (global-set-key (kbd "C-x C-m") 'set-mark-command)
  
  ;; 快捷键设置
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (global-set-key (kbd "C-c C-e") 'hippie-expand)

  (global-set-key (kbd "M-g a") 'avy-goto-char)

  (global-set-key (kbd "C-c C-m") 'bookmark-set)
  (global-set-key (kbd "C-c C-v") 'er/expand-region)


  (global-set-key (kbd "C-c b m") 'bm-toggle)
  (global-set-key (kbd "C-c b l") 'bm-show-all)
  (global-set-key (kbd "C-c b n") 'bm-next)
  (global-set-key (kbd "C-c b p") 'bm-previous)
  (global-set-key (kbd "C-c b a") 'bm-bookmark-annotate)

  (global-set-key (kbd "C-c o") 'crux-open-with)

  ;; 代码补全
  (global-set-key (kbd "C-c m y") 'global-ycmd-mode)
  (global-set-key (kbd "C-c C-o") 'company-complete)

  ;; package
  (global-set-key (kbd "C-x p") 'package-list-packages)

  (global-set-key (kbd "C-c f t") 'neotree-toggle)
  (global-set-key (kbd "C-c s") 'eshell)
  (global-set-key (kbd "C-c f f") '(shell-command '"astyle --style=kr"))
  (global-set-key (kbd "C-c r") 'revert-buffer)
  (global-set-key (kbd "C-c m l") 'linum-mode)
  (global-set-key (kbd "C-c m w") 'whitespace-mode)
  (if (eq system-type 'darwin)
      (global-set-key (kbd "C-c d") 'dash-at-point)
    (global-set-key (kbd "C-c d") 'zeal-at-point))
  ;;(global-set-key (kbd "C-c b") 'refill-mode)
  (global-set-key (kbd "C-c C-l") 'toggle-truncate-lines)

  ;; ggtags-mode
  (global-set-key (kbd "C-c m g") 'ggtags-mode)
  ;; iedit mode
  (global-set-key (kbd "C-c m u") 'iedit-mode)

  ;; 行列高亮
  (global-set-key (kbd "C-c m h") 'crosshairs-mode)

  ;; aggressive-indent-mode
  (global-set-key (kbd "C-c m i") 'aggressive-indent-mode)

  (global-set-key (kbd "C-c m e") 'emmet-mode)
  (global-set-key (kbd "C-c m c") 'c++-mode)

  (global-set-key (kbd "C-x C-r") 'recentf-open-files)
  (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

  (if (eq system-type 'darwin)
      (global-set-key (kbd "C-c b m") 'browse-url-default-macosx-browser))
  (global-set-key (kbd "C-c b f") 'browse-url-firefox)
  (global-set-key (kbd "C-c b c") 'browse-url-chrome)

  (global-set-key (kbd "C-c f m") 'format-buffer)

  (global-set-key (kbd "C-c h") 'hack-emacs))

(key-set)

(provide 'init-keyset)

;;; init-keyset.el ends here
