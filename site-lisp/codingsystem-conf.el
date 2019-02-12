(if (eq system-type 'windows-nt)
	(setq default-buffer-file-coding-system 'chinese-gbk)
  ;; (setq default-buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

(if (eq system-type 'windows-nt)
	(prefer-coding-system 'utf-8)
  ;; (prefer-coding-system 'utf-8)
  (prefer-coding-system 'utf-8))

(provide 'codingsystem-conf)
