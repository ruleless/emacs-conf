(require 'cpp-style)
(require 'lua-style)
(require 'js-style)
(require 'cmake-mode)

(require 'ac-config)
(require 'file-format)
(require 'fci-style)
(require 'markdown-style)
(require 'keys-bindings)
(require 'org-style)
(require 'codingsystem-conf)
(require 'switch-window)
(require 'window-style)
(require 'gtags-style)
(require 'edit-style)
(require 'file-mode)

(if (eq system-type 'windows-nt)
    (progn
      (require 'font-style)
      (message "align font setted!"))
  (message "align font note setted!"))

(add-to-list 'load-path "~/.emacs.d/site-lisp/solarized-theme")
(require 'init-solarized-theme)

(add-to-list 'load-path "~/.emacs.d/site-lisp/encrypt")
(require 'init-encrypt)

;; grep 设置(支持中文)
(require 'color-moccur)

;; 自动检测文本编码，以解决乱码问题
(require 'unicad)

(provide 'init-all)
