(setq auto-mode-alist
	  ;; ���ļ�ģʽ���ļ���׺��������
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
