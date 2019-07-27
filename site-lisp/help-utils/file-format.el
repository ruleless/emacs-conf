(defun untabify-file ()
  (interactive)
  (untabify (point-min) (point-max)))


;; (add-hook 'before-save-hook
;; 		  (lambda ()
;; 			(if (and
;; 				 (not (eq system-type 'windows-nt))
;; 				 (or (eq major-mode 'c++-mode)
;; 					 (or (eq major-mode 'lua-mode)
;; 						 (eq major-mode 'c-mode)))
;; 				 )
;; 				(progn
;; 				  (untabify (point-min) (point-max))
;; 				  (message "untabify"))
;; 			  )))


(defun dos-unix () (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(defun unix-dos () (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))


(provide 'file-format)
