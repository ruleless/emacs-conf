;; go-mode confiuration

(add-to-list 'load-path "~/.emacs.d/site-lisp/go-mode/go-mode.el-1.5.0/")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(add-hook 'go-mode-hook
          (lambda ()
            (interactive)
            (setq tab-width 4
                  c-basic-offset 4
                  ;; this will make sure spaces are used instead of tabs
                  indent-tabs-mode t)
            ))


(provide 'go-mode-conf)
