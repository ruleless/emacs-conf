;;;; 编辑器设置
;; 设置背景色和字体色
;; (set-foreground-color "white")
;; (set-background-color "black")
;; (set-face-foreground 'secondary-selection"skyblue")
;; (set-face-background 'secondary-selection"darkblue")
;; (set-foreground-color "grey")
;; (set-background-color "black")
;; (global-font-lock-mode t)

;; 关闭烦人的出错时的提示声
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线
;; (mouse-avoidance-mode 'animate)

;; 滚动页面时比较舒服，不要整页的滚动
(setq scroll-step 1
	  scroll-margin 1
	  scroll-conservatively 10000)

;; 光标不闪
(blink-cursor-mode nil)

;; 光标显示为一竖线
;; (setq-default cursor-type 'bar)

;; 在模式栏中显示行号列号
(column-number-mode t)
(line-number-mode t)

;; 显示匹配括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 菜单栏、工具栏
;; (tool-bar-mode nil)
(menu-bar-mode nil)

;; 高亮当前行
(require 'hl-line)
(global-hl-line-mode t)

;; 滚动条在右侧
;; (set-scroll-bar-mode 'right)
;; (scroll-bar-mode nil)

;; 在标题栏显示buffer的名字
(setq frame-title-format "%b@emacs")

;; display time
(display-time-mode t)

;; 设置备份策略
(setq make-backup-files t) ; 启用备份功能
(setq vc-make-backup-files t) ; 使用版本控制系统的时候也启用备份功能
(setq version-control t) ; 启用版本控制，即可以备份多次
(setq kept-old-versions 2) ; 备份最原始的版本两次，即第一次编辑前的文档，和第二次编辑前的文档
(setq kept-new-versions 6) ; 备份最新的版本6次，理解同上
(setq delete-old-versions t) ; 删掉不属于以上3中版本的版本
(setq backup-directory-alist '(("." . "~/.saves"))) ; 设置备份文件的路径到~/.saves中
(setq backup-by-copying t) ; 备份设置方法，直接拷贝

;; 设置备份条件
(setq backup-enable-predicate 'ecm-backup-enable-predicate)

;; 关闭匹配下列目录或文件的备份功能
(defun ecm-backup-enable-predicate (filename)
  (and (not (string= "/tmp/" (substring filename 0 5)))
       (not (string-match "semanticdb" filename))))

;; 关闭自动保存模式
(setq auto-save-mode nil)

;; 不生成 #filename# 临时文件
(setq auto-save-default nil)

;; 可以递归的使用 minibuffer
;;(setq enable-recursive-minibuffers t)
(setq max-mini-window-height 1)

;; 在行首 C-k 时，同时删除该行
(setq-default kill-whole-line t)

;; 删除匹配括号间内容
(defun kill-match-paren (arg)
  (interactive "p")
  (cond ((looking-at "[([{]") (kill-sexp 1) (backward-char))
		((looking-at "[])}]") (forward-char) (backward-kill-sexp 1))
		(t (self-insert-command (or arg 1)))))

;; 删除一行
(defun zl-delete-line nil
  "delete the whole line"
  (interactive)
  (beginning-of-line) ;; 光标移动到行首
  (push-mark) ;; 做个标记
  (beginning-of-line 2) ;; 移动到下一行行首
  (kill-region (point) (mark))) ;; 光标和标记之间的删掉

;; 复制一行或者多行
;; C-c C-w 复制整行, 而"C-u 5 C-c w"复制 5 行
(defun copy-lines(&optional arg)
  (interactive "p")
  (save-excursion
    (beginning-of-line)
    (set-mark (point))
    (next-line arg)
    (kill-ring-save (mark) (point))))

;; 自动的在文件末增加一新行
;; (setq require-final-newline t)

;; 当光标在行尾上下移动的时候，始终保持在行尾。
(setq track-eol t)

;; 当浏览 man page 时，直接跳转到 man buffer。
(setq Man-notify-method 'pushy)

;; 当使用 M-x COMMAND 后，过 1 秒钟显示该 COMMAND 绑定的键
(setq suggest-key-bindings 1)

;; html-helper-mode
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))

;; 关闭启动画面
(custom-set-variables '(inhibit-startup-screen t))

(setq inferior-lisp-program "/usr/bin/clisp")
(setq inferior-lisp-program "/usr/local/bin/clisp")

(add-to-list 'default-frame-alist '(width .70))
(add-to-list 'default-frame-alist '(height. 27))

(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(require 'linum)
(setq linum-format "%3d ")
(add-hook 'find-file-hooks (lambda ()(linum-mode 1)))
(setq frame-title-format"Kids@%b")
(setq standard-indent 4)

(custom-set-variables
 '(inhibit-startup-screen t))
(custom-set-faces)

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;; 设置kill-ring-max为200
(setq kill-ring-max 200)

;; 删除行尾空白
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
;; (add-hook 'before-save-hook
;; 		  (lambda ()
;; 			(if (or (eq major-mode 'lua-mode) (eq major-mode 'c++-mode))
;; 				(message "save file without delete trailing whitespace")
;; 			  (delete-trailing-whitespace))))

;; Tab键
(setq default-tab-width 4)
(setq tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40
						44 48 52 56 60 64 68 72 76 80 84 88 92 96))

;; 格式化整个文件函数
(defun indent-whole ()
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))

;; 代码折叠
(add-hook 'lua-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)

(provide 'edit-style)
