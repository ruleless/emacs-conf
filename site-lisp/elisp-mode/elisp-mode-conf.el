(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (interactive)
            (setq tab-width 2
                  c-basic-offset 2
                  ;; this will make sure spaces are used instead of tabs
                  indent-tabs-mode nil)
            ))


(provide 'elisp-mode-conf)
