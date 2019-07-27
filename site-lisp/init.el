;; color theme settting
(add-to-list 'custom-theme-load-path "~/.emacs.d/site-lisp/themes")
(load-theme 'wilson t)
;; (load-theme 'dorsey t)
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/solarized-theme")
;; (require 'init-solarized-theme)
;; (require 'theme-conf)


(add-to-list 'load-path "~/.emacs.d/site-lisp/shell-mode")
(require 'shell-mode-conf)

(add-to-list 'load-path "~/.emacs.d/site-lisp/elisp-mode")
(require 'elisp-mode-conf)

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


;; auto complete settting
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete")
;; (require 'ac-config)
(add-to-list 'load-path "~/.emacs.d/site-lisp/company-tabnine")
(require 'company-tabnine-conf)


(require 'file-format)
(require 'fci-style)
(require 'keys-bindings)
(require 'codingsystem-conf)
(require 'switch-window)
(require 'window-style)
(require 'edit-style)
(require 'file-mode)


(if (eq system-type 'windows-nt)
    (progn
      (require 'font-style)
      (message "align font setted!"))
  (message "align font note setted!"))


(add-to-list 'load-path "~/.emacs.d/site-lisp/encrypt")
(require 'init-encrypt)


;; grep 设置(支持中文)
(require 'color-moccur)


;; 自动检测文本编码，以解决乱码问题
(require 'unicad)


(provide 'init)
