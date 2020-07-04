(add-to-list 'load-path "~/.emacs.d/site-lisp/3rd")

(require 'theme-conf)

(add-to-list 'load-path "~/.emacs.d/site-lisp/font-conf")
(if (eq system-type 'windows-nt)
    (progn
      (require 'font-conf)
      (message "align font setted!"))
  (message "align font not setted!"))


(add-to-list 'load-path "~/.emacs.d/site-lisp/shell-mode")
(require 'shell-mode-conf)

(add-to-list 'load-path "~/.emacs.d/site-lisp/elisp-mode")
(require 'elisp-mode-conf)

(add-to-list 'load-path "~/.emacs.d/site-lisp/go-mode")
(require 'go-mode-conf)

(add-to-list 'load-path "~/.emacs.d/site-lisp/makefile-mode")
(require 'makefile-mode-conf)

(add-to-list 'load-path "~/.emacs.d/site-lisp/cpp-mode")
(require 'cpp-mode-conf)
(require 'gtags-conf)
(require 'cmake-mode)

(add-to-list 'load-path "~/.emacs.d/site-lisp/lua-mode")
(require 'lua-mode-conf)

(add-to-list 'load-path "~/.emacs.d/site-lisp/js-mode")
(require 'js-mode-conf)

(add-to-list 'load-path "~/.emacs.d/site-lisp/misc-mode")
(require 'ngx-conf-mode)
(require 'markdown-mode-conf)
(require 'org-mode-conf)
(require 'perl-mode-conf)

(add-to-list 'load-path "~/.emacs.d/site-lisp/fci-mode")
(require 'fci-mode-conf)


;; auto complete settting
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete")
;; (require 'ac-config)
(add-to-list 'load-path "~/.emacs.d/site-lisp/company-mode")
(require 'company-mode-conf)

;; yasnippet
(require 'yasnippet-conf)


(add-to-list 'load-path "~/.emacs.d/site-lisp/help-utils")
(require 'file-format)


(add-to-list 'load-path "~/.emacs.d/site-lisp/switch-window")
(require 'switch-window-conf)


(add-to-list 'load-path "~/.emacs.d/site-lisp/encrypt")
(require 'init-encrypt)


;; grep 设置(支持中文)
(require 'color-moccur)

;; 自动检测文本编码，以解决乱码问题
(require 'unicad)


(require 'keys-bindings)
(require 'file-extension)
(require 'edit-style)


(provide 'init)
