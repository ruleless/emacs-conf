(defun other-window-switch (&optional n)
  "switch window in a easy way."
  (interactive "p")
  (other-window (or n 1)))
(defun other-window-backward ()
  "previous window"
  (interactive)
  (other-window-switch -1))
(defun other-window-forward ()
  "next window"
  (interactive)
  (other-window-switch 1))

(global-set-key "\C-x\C-p" 'other-window-backward)
(global-set-key "\C-x\C-n" 'other-window-forward)

(provide 'window-style)
