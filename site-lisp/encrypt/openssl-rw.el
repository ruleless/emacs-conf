;;; -*- MODE: emacs-lisp; tab-width: 4 -*-
;;; openssl-rw encrypts and decrypts files with openssld
;;; (c) 2012, 2013 Adolfo Villafiorita <adolfo.villafiorita@me.com>
;;;
;;; This code is NOT part of GNU Emacs and is distributed under the conditions
;;; of the MIT License
;;;
;;; The MIT License
;;;
;;; Permission is hereby granted, free of charge, to any person obtaining a
;;; copy of this software and associated documentation files (the "Software"),
;;; to deal in the Software without restriction, including without limitation
;;; the rights to use, copy, modify, merge, publish, distribute, sublicense,
;;; and/or sell copies of the Software, and to permit persons to whom the
;;; Software is furnished to do so, subject to the following conditions:
;;;
;;; The above copyright notice and this permission notice shall be included in
;;; all copies or substantial portions of the Software.
;;;
;;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
;;; THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
;;; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
;;; DEALINGS IN THE SOFTWARE.
;;;
;;;
;;; Add to your .emacs file:
;;;
;;; (add-to-list 'load-path "<DIR WHERE TODOTXT-MODE LIVES>")
;;; (require 'openssl-rw)
;;;
;;; Usage instructions:
;;;
;;;   M-x openssl-write-file on a buffer you want to encrypt
;;;   M-x openssl-find-file  on an encrypted file
;;;
;;; Notice that openssl-find-file adds a hook so that the file is encrypted
;;; when you save the file. (Do M-x undo to undo the encryption.)
;;;
;;; To automatically decrypt a file with find-file put the following code in
;;; your .emacs file.  It binds the decryption function to files with the
;;; ".enc" suffix:
;;;
;;; (add-hook 'find-file-hook
;;;          (lambda ()
;;;            (if (string= "enc" (file-name-extension (buffer-file-name)))
;;;                (openssl-decrypt-and-hook-current-buffer))))
;;;
;;; Alternatively you can try:
;;;
;;;  M-x find-file
;;;  M-x openssl-decrypt-and-hook-current-buffer
;;;

(defun openssl-write-file (filename)
  "Encrypt the current buffer and save it to disk."
  (interactive "FWrite encrypted file: ")
  (let ( (password (read-passwd "Enter Password: " t)) )
    (openssl-encrypt-current-buffer password)
    (let ((coding-system-for-write 'binary))
      (write-file filename))))

(defun openssl-find-file (filename)
  "Find and decrypt a file."
  (interactive "fFind encrypted file: ")
  (let (;;(coding-system-for-read 'binary)
		(coding-system-for-read 'utf-8))
    (find-file filename)
    (openssl-decrypt-and-hook-current-buffer)))

(defun openssl-decrypt-and-hook-current-buffer ()
  "Decrypt the current buffer and set hooks to encrypt on save."
  (interactive)
  (let ( (password (read-passwd "Enter password: ")) )
    (openssl-decrypt-current-buffer password)
    (auto-save-mode nil)
    ; bind write-contents-functions so that we encrypt before saving
    (setq write-contents-functions
          `((lambda ()
			  (openssl-encrypt-current-buffer ,password)
			  (message "write contents")
			  nil)))
    (set-buffer-modified-p nil)))

(defun openssl-decrypt-current-buffer (password)
  "Low level routine for decrypting the current buffer."
  (if (> (point-max) (point-min))
	  (progn		
		(call-process-region (point-min) (point-max)
							 "openssl" t (current-buffer) nil
							 "enc" "-aes-256-ecb" "-base64" "-d" "-pass" (concat "pass:" password)))))

(defun openssl-encrypt-current-buffer (password)
  "Low level routine for encrypting the current buffer."
  (call-process-region (point-min) (point-max)
                       "openssl" t (current-buffer) nil
					   "enc" "-aes-256-ecb" "-base64" "-pass" (concat "pass:" password)))

(provide 'openssl-rw)
