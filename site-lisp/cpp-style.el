(require 'cc-mode)

;; À¨ºÅÆ¥Åä
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '((?\(? _")")
							   (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe))

(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(setq skeleton-pair t)
;;(setq skeleton-pair-on-word t)

;; \"µÈ·ûºÅµÄ×Ô¶¯ÓÒÆ¥Åä
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\`") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "<") 'skeleton-pair-insert-maybe)

;; offset customizations not in my-c-style
(setq c-offsets-alist '((member-init-intro . ++)))

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-common-hook 'google-set-c-style)

(provide 'cpp-style)
