(add-to-list 'load-path "~/.emacs.d/elpa/js2-mode")
(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(defun js-code-style ()
  (interactive)
  (setq js-indent-level 1)
  (setq js2-basic-offset 2)
  (setq tab-width 2
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil))

(add-hook 'js2-mode-hook 'js-code-style)

(provide 'js-conf)
