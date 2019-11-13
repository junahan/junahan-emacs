;;; init-local.el --- Configure default locale -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; 通过 C-t 快捷键在当前窗口底部显示一个 terminal
(require-package 'shell-pop)
(use-package shell-pop
  :bind (("C-t" . shell-pop))
  :config
  ;;(setq shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
  (setq shell-pop-shell-type (quote ("terminal" "*terminal*" (lambda nil (term shell-pop-term-shell)))))
  (setq shell-pop-term-shell "/bin/bash")
  ;;(setq shell-pop-term-shell "/bin/eshell")
  ;; need to do this manually or not picked up by `shell-pop'
  (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type))

;; 设置 locale 环境
(setenv "LANG" "zh_CN.UTF-8")

;; 解决 terminal 乱码问题
;; refer to https://www.emacswiki.org/emacs/EmacsForMacOS#toc30
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(provide 'init-local)
;;; init-local.el ends here
