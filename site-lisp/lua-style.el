(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; LuaµÄÕÛµþ½Å±¾
(defvar ywb-lua-sexp-alist '(("function" . "end")
							 ("local function" . "end")
                             ("do" . "end")))

(defun ywb-lua-forward-sexp (&optional arg)
  "Forward to block end"
  (save-match-data
    (when (looking-at (concat "^\\(\\s-*\\)\\(" (mapconcat 'car
                                                           ywb-lua-sexp-alist
                                                           "\\|") "\\)"))
      (re-search-forward (concat "^" (match-string 1)
                                 (assoc-default (match-string 2) ywb-lua-sexp-alist))
                         nil t arg))))

(add-to-list 'hs-special-modes-alist
             `(lua-mode ,(concat "^\\s-*\\(?:" (mapconcat 'car ywb-lua-sexp-alist "\\|") "\\)")
						,(concat "^\\s-*\\(?:" (mapconcat 'cdr ywb-lua-sexp-alist "\\|") "\\)")
						"--"
						ywb-lua-forward-sexp))

;; ÅäÖÃLuaµÄTab¼ü
(setq lua-indent-level 4)
(defun my-lua-setup ()
  (setq indent-tabs-mode nil))
(add-hook 'lua-mode-hook 'my-lua-setup)

(provide 'lua-style)
