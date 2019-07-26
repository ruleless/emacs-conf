(add-hook 'sh-mode-hook
          (lambda ()
            (interactive)
            (setq tab-width 4
                  c-basic-offset 4
                  ;; this will make sure spaces are used instead of tabs
                  indent-tabs-mode nil)
            ))


(provide 'shell-mode-conf)
