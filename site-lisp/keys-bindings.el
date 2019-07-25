;;;; 全局快捷键
;; F1：列举我的书签
;; (global-set-key (kbd "<f1>") 'list-bookmarks)

;; Ctrl+F1：设置我的书签
;; (global-set-key [C-f1] 'bookmark-set)

;; F2:保存buffer
;; (global-set-key (kbd "<f2>") 'save-buffer)

;; Ctrl+F2：保存当前桌面
;; (global-set-key [C-f2] 'desktop-save)

;; F3:跳转到寄存器保存的位子
;; (global-set-key (kbd "<f3>") 'jump-to-register)
(global-set-key (kbd "<f3>") 'list-matching-lines)
(global-set-key "\C-xg" 'moccur-grep)
(global-set-key "\C-x\C-g" 'moccur-grep-find)

;; Ctrl+F3:记录当前光标位子到寄存器
;; (global-set-key [C-f3] 'point-to-register)

;; F4:激活speedbar
;; (global-set-key [(f4)] 'speedbar-get-focus)

;; F5:最大化当前buffer:
;; (global-set-key [(f5)] 'delete-other-windows)

;; F6:关闭buffer
;; (global-set-key [(f6)] 'kill-buffer-and-window)

;; 编译和调试
(setq gdb-many-windows t)
(global-set-key [f4] 'gdb-many-windows)
(global-set-key [C-f4] 'gdb-many-windows)
(global-set-key [f5] 'gdb)
(global-set-key [C-f5] 'gud-run)
(global-set-key [S-f5] 'gud-cont)
(global-set-key [f7] 'compile)
(global-set-key [f8] 'gud-print)
(global-set-key [C-f8] 'gud-pstar)
(global-set-key [f9] 'gud-break)
(global-set-key [C-f9] 'gud-remove)
(global-set-key [f10] 'gud-next)
(global-set-key [C-f10] 'gud-until)
(global-set-key [S-f10] 'gud-jump)
(global-set-key [f11] 'gud-step)
(global-set-key [C-f11] 'gud-finish)
;; (global-set-key [f7] 'compile)
;; (global-set-key [C-f7] 'gdb)
;; (setq-default compile-command "make")
;; (global-set-key [C-f8] 'previous-error)
;; (global-set-key [f8] 'next-error)

;; F9:格式化代码
;; (global-set-key [f9] 'c-indent-line-or-region)
;; (global-set-key [f9] 'indent-whole)

;; F10:注释 / 取消注释
(global-set-key (kbd "C-c C-k") 'comment-or-uncomment-region)

;; Ctrl+F11:复制区域到寄存器
;; (global-set-key [C-f11] 'copy-to-register)
;; F11:粘贴寄存器内容
;; (global-set-key [(f11)] 'insert-register)

;; 定义F12键为激活ecb
;; (global-set-key [f12] 'ecb-activate)
;; 定义Ctrl+F12为停止ecb
;; (global-set-key [C-f12] 'ecb-deactivate)
(global-set-key [f12] 'hs-toggle-hiding)

;; (global-set-key [(control tab)] 'other-window);切换窗口
;; (global-set-key (kbd "C-z") 'undo);撤消
;; (global-set-key (kbd "C-a") 'mark-whole-buffer);全选
;; (global-set-key [(meta g)] 'goto-line);跳到某行
;; (global-set-key (kbd "C-/") 'hs-toggle-hiding)

;; 打开ibuffer
;; (global-set-key (kbd "C-x b") 'ibuffer)
;; 打开browse-kill-ring
;; (global-set-key (kbd "C-x v") 'browse-kill-ring)

;; C-x c 复制整行, 而"C-u 5 C-x c"复制 5 行
;; (global-set-key (kbd "C-x c") 'copy-lines) ; 复制一行或者多行
;; (global-set-key (kbd "C-x d") 'zl-delete-line) ; 删除一行
;; (global-set-key (kbd "C-x a") 'kill-match-paren) ; 删除匹配括号间内容

;; (global-set-key [(meta left)]  'tabbar-backward) ; 切换前一个tab
;; (global-set-key [(meta right)] 'tabbar-forward) ; 切换下一个tab
;; (global-set-key [(meta up)] 'tabbar-backward-group)
;; (global-set-key [(meta down)] 'tabbar-forward-group)

;; Tab补全或缩进
;; (global-set-key [(tab)] 'my-indent-or-complete)

(global-set-key (kbd "C-j") 'newline-and-indent)


(provide 'keys-bindings)
