(require 'openssl-rw)

(add-hook 'find-file-hook 
		  (lambda ()
			(if (string= "private" (file-name-extension (buffer-file-name)))
				(openssl-find-file (buffer-file-name)))))

(provide 'init-encrypt)
