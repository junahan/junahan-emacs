;;; package --- init-cpp
;;; commentary:
;;; code:

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode
;; “user”: When you want to define your own style
(setq c-default-style "linux") ;; set style to "linux"

(add-hook 'c-mode-hook 'c++-mode)

(add-hook 'c++-mode-hook
          (lambda ()
            (setq flycheck-clang-language-standard "c++11")))

;; c/c++ comapny backend
;; consider the performance reason, remove company-semantic
;; from company-backends.
(add-hook 'c++-mode-hook
          (lambda()
            (setq (make-local-variable 'company-backends)
                  '(company-gtags
                    company-yasnippet
                    company-keywords
                    company-files
                    company-eclim
                    company-abbrev
                    company-dabbrev))))

;; company-c-headers
(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers))

(provide 'init-cpp)
;;; init-cpp.el ends here
