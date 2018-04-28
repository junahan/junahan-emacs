;;; package --- init-cpp
;;; commentary:
;;; code:

(require-package 'company-c-headers)

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

(add-hook 'c++-mode-hook
          (lambda ()
            (setq flycheck-clang-language-standard "c++11")))

;; add company-c-header to company-backends
;; (require 'company-c-headers)
(after-load 'company
  (add-hook 'c-mode-common-hook
            (lambda () (sanityinc/local-push-company-backend 'company-c-headers))))

;;  (add-hook 'c++-mode-hook
;;  (lambda () (sanityinc/local-push-company-backend 'company-c-headers))))

(provide 'init-cpp)
;;; init-cpp.el ends here
