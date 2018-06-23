(require 'fill-column-indicator)

(setq fci-rule-column 80)
(setq fci-rule-color "light green")

(add-hook 'org-mode-hook 'fci-mode)
(add-hook 'markdown-mode-hook 'fci-mode)

;; (define-globalized-minor-mode global-fci-mode fci-mode
;;   (lambda () (fci-mode 1)))
;; (global-fci-mode t)

(provide 'fci-style)
