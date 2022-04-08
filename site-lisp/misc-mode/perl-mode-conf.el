;; Use cperl-mode instead of the default perl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))

(setq auto-mode-alist
      (append '(
                ("\\.t\\'" . cperl-mode)
                )
              auto-mode-alist))

(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(defun my-cperl-setting ()
  (setq tab-width 4
        c-basic-offset 4
        cperl-indent-level 4
        cperl-continued-statement-offset 0
        cperl-extra-newline-before-brace t
        cperl-indent-parens-as-block t
        cperl-close-paren-offset -4
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  (set-face-background 'cperl-array-face "wheat")
  (set-face-background 'cperl-hash-face "wheat")
  (setq font-lock-maximum-decoration 1))

(add-hook 'cperl-mode-hook 'my-cperl-setting)


(provide 'perl-mode-conf)
