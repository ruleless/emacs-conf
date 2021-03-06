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
  (setq indent-tabs-mode nil))

(defun n-cperl-mode-hook ()
  (setq cperl-indent-level 4)
  (setq cperl-continued-statement-offset 0)
  (setq cperl-extra-newline-before-brace t)
  (set-face-background 'cperl-array-face "wheat")
  (set-face-background 'cperl-hash-face "wheat")
  )

(add-hook 'cperl-mode-hook 'my-cperl-setting)
(add-hook 'cperl-mode-hook 'n-cperl-mode-hook t)


(provide 'perl-mode-conf)
