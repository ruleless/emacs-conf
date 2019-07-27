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
;; (require 'package)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/"))
(setq package-check-signature nil)

(package-initialize)


(add-to-list 'load-path "~/.emacs.d/custom")
(require 'my-settings)


(add-to-list 'load-path "~/.emacs.d/site-lisp")
(require 'init)


(setq vc-handled-backends ())
