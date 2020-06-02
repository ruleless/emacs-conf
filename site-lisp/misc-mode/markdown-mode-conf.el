(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)


(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(add-hook 'markdown-mode-hook
          (lambda ()
            (interactive)
            (setq tab-width 4
                  c-basic-offset 4
                  ;; this will make sure spaces are used instead of tabs
                  indent-tabs-mode nil)
            ))


(provide 'markdown-mode-conf)
