;; go-mode confiuration

(add-to-list 'load-path "~/.emacs.d/site-lisp/3rd/go-mode.el-1.5.0/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/3rd/company-go")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; (add-to-list 'load-path (concat (file-name-as-directory (getenv "GOPATH")) "src/github.com/dougm/goflymake"))
;; (require 'go-flymake)

;; Use goimports instead of go-fmt for formatting with intelligent package addition/removal
(setq gofmt-command "goimports")

(add-hook 'go-mode-hook
          (lambda ()
            (local-set-key (kbd "M-.") 'godef-jump)
            (go-eldoc-setup)
            ;; (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4
                  c-basic-offset 4
                  ;; this will make sure spaces are used instead of tabs
                  indent-tabs-mode t)
            ))

(provide 'go-mode-conf)
