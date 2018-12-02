(setq auto-mode-alist
	  ;; 将文件模式和文件后缀关联起来
	  (append '(("\\.py\\'" . python-mode)
				("\\.s?html?\\'" . html-helper-mode)
				("\\.asp\\'" . html-helper-mode)
				("\\.phtml\\'" . html-helper-mode)
				("\\.h\\'" . c++-mode)
				("\\.c\\'" . c++-mode)
				("\\.impl\\'" . c++-mode)
				("\\.inl\\'" . c++-mode)
				;; ("\\.txt\\'" . org-mode)
				("\\Makefile\\'" . makefile-mode)
				("\\.mak\\'" . makefile-mode)
				("\\.css\\'" . css-mode))
			  auto-mode-alist))

(provide 'file-mode)
