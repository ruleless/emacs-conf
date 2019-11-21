;; TabNine configuration

(require 'company-tabnine)


;; (add-hook 'after-init-hook 'global-company-mode)
(add-hook 'lua-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)
(add-hook 'sh-mode-hook 'company-mode)
(add-hook 'makefile-mode-hook 'company-mode)
(add-hook 'js2-mode-hook 'company-mode)
(add-hook 'js-mode-hook 'company-mode)
(add-hook 'go-mode-hook 'company-mode)


(add-to-list 'company-backends #'company-tabnine)

;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

;; Use the tab-and-go frontend.
;; Allows TAB to select and complete at the same time.
(company-tng-configure-default)
(setq company-frontends
      '(company-tng-frontend
        company-pseudo-tooltip-frontend
        company-echo-metadata-frontend))


(provide 'company-tabnine-conf)
