(setq org-directory "~")
(setq org-todo-keywords
	  '((sequence "TODO(t)" "PROCESSING(p!)" "|" "DONE(d!)")))

(setq org-log-done 'time)

(setq org-src-fontify-natively t)

;; key binding
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; capture
;; (setq org-directory "~")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-capture-templates
	  '(("t" "Todo" entry (file+headline (concat org-directory "/gtd.org") "Tasks")
		 "* TODO %?\n %i")
		("c" "capture" entry (file+headline (concat org-directory "/capture.org") "capture")
		 "* %?")
		("j" "Journal" entry (file+datetree (concat org-directory "/journal.org"))
		 "* %?\nInput： %U\n  %i")))

;; refile
(defun km/org-refile-to-other-file (file &optional maxlevel)
  "Refile with `org-refile-targets' set to FILE.
A numeric prefix can be given to set MAXLEVEL (defaults to 2)."
  (interactive "fFile: \nP")
  (let* ((maxlevel (prefix-numeric-value (or maxlevel 2)))
         (file (substring-no-properties file))
         (org-refile-targets `((,file :maxlevel . ,maxlevel))))
    (org-refile)))

(defun km/org-refile-to-other-buffer (buffer &optional maxlevel)
  "Refile with `org-refile-targets' set to BUFFER file name.
A numeric prefix can be given to set MAXLEVEL (defaults to 2)."
  (interactive (list (km/get-org-file-buffer) current-prefix-arg))
  (let ((buffer-file (buffer-file-name buffer)))
    (km/org-refile-to-other-file buffer-file maxlevel)))

(defun km/get-org-file-buffer ()
  (get-buffer
   (org-icompleting-read "Buffer: " (mapcar 'buffer-name
                                            (org-buffer-list 'files)))))

(defun km/org-set-refiling-buffer (&optional maxlevel)
  "Choose buffer to set as sole target in `org-refile-targets'.
If `org-refile-targets' is already a local variable, restore the
global value. A numeric prefix can be given to set
MAXLEVEL (defaults to 2)."
  (interactive "P")
  (if (local-variable-p 'org-refile-targets)
      (kill-local-variable 'org-refile-targets)
    (let ((buffer-file (substring-no-properties
                        (buffer-file-name (km/get-org-file-buffer))))
          (maxlevel (prefix-numeric-value (or maxlevel 2))))
      (set (make-local-variable 'org-refile-targets)
           `((,buffer-file :maxlevel . ,maxlevel))))))


(provide 'org-style)
