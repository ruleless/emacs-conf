
;;;; 编码

;; 改变当前buffer的编码
;; `C-x <RET> f utf-8 <RET>' (set-buffer-file-coding-system)

;; 指定紧随其后的命令(如C-x C-f或C-x C-w等)所采用的编码
;; `C-x <RET> c utf-8 <RET>' (universal-coding-system-argument)

;; 用指定编码重读当前buffer(如果打开时用错了编码)
;; `C-x <RET> r utf-8 <RET>' (revert-buffer-with-coding-system)

;; 将以错误编码解码的选区以指定编码重新解码
;; M-x recode-region <RET> gbk <RET> utf-8 <RET>

;; 查看当前编码系统
;; M-x describe-coding-system <RET> 或 C-h C <RET>

;; 查看当前字符的编码信息
;; `C-u C-x ='
