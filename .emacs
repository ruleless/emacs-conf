;; self imformation
(setq user-full-name "ruleless")

;; server mode
(require 'server)
(when (and (= emacs-major-version 23)
           (= emacs-minor-version 1)
           (equal window-system 'w32))
  (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
                                        ; ~/.emacs.d/server is unsafe"
                                        ; on windows.
(server-start)

;; 使用函数list-packages安装插件
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

(package-initialize)

;;; python 开发环境
;; (elpy-enable)

;; set load directory
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; 加载自定义设置
(require 'init-all)

;; 变量定义
(setq temp "~/.emacs.d/plugins/yasnippet/snippets")
(setq mytemp "~/.emacs.d/snippets")
(setq ssl "/home/liuy/proj/openssl")
(setq demo "/home/liuy/proj/programming/openssl/demo")
