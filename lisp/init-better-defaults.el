(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)


;;关闭启动画面
(setq inhibit-startup-message t)

;;显示列号
(setq column-number-mode t)

;;高亮当前行
(global-hl-line-mode 1)

;; 括号匹配时显示另一个括号而不是跳到另一个括号
(show-paren-mode t)

(setq show-paren-style 'parentheses)

(setq frame-title-format "%b %I") ;显示文件名和大小

;;让Emacs可以直接打开、显示图片
(auto-image-file-mode t)

;;以Y/N代表yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;不生成名为#filename#的临时文件
(setq auto-save-default nil) 

;;支持和外部程序的拷贝
(setq x-select-enable-clipboard t)

;;打开语法高亮
(global-font-lock-mode t)

;;mini-buffer的高度
(setq max-mini-window-height 0.5)


;;记住最近打开的文件列表
(require 'recentf)
(setq recentf-max-saved-items 256
      recentf-max-menu-items 16)
(recentf-mode 1)
;;自动打开上次编辑的文件
(desktop-save-mode 1)
;; 记住上次光标位置
(if (version< emacs-version "25.0")
    (progn
      (require 'saveplace)
      (setq-default save-place t))
  (save-place-mode 1))

;; UTF-8
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(provide 'init-better-defaults)
