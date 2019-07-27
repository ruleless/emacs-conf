;; Setting English Font
(set-face-attribute
 'default nil :font "Consolas 11")

;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "Microsoft Yahei" :size 16)))


(if (eq system-type 'windows-nt)
    (setq default-buffer-file-coding-system 'chinese-gbk)
  ;; (setq default-buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

(if (eq system-type 'windows-nt)
    (prefer-coding-system 'utf-8)
  ;; (prefer-coding-system 'utf-8)
  (prefer-coding-system 'utf-8))


(provide 'font-conf)
