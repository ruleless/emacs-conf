(require 'cc-mode)


(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-common-hook 'google-set-c-style)


(defun cpp-tab-conf ()
  (interactive)
  (setq tab-width 4
		c-basic-offset 4
		;; this will make sure spaces are used instead of tabs
		indent-tabs-mode nil))

(add-hook 'c-mode-common-hook 'cpp-tab-conf)
(add-hook 'c++-mode-common-hook 'cpp-tab-conf)


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


(provide 'cpp-mode-conf)
