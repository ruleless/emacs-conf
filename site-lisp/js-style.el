(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(defun js-style ()
  (interactive)  
  (setq tab-width 2
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil
		js-indent-level 2
		js2-basic-offset 2))

(add-hook 'js2-mode-hook 'js-style)

(provide 'js-style)
