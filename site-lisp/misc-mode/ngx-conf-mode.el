(defun ngx-conf-mode-setting ()
  (interactive)
  (setq tab-width 4
		c-basic-offset 4
		;; this will make sure spaces are used instead of tabs
		indent-tabs-mode nil))

(add-hook 'conf-mode-hook 'ngx-conf-mode-setting)


(provide 'ngx-conf-mode)
