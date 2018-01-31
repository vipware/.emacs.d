(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)



(setq inhibit-startup-message t) ;关闭启动画面

(setq column-number-mode t) ;显示列号
;;; 括号匹配时显示另一个括号而不是跳到另一个括号

(show-paren-mode t)
(setq show-paren-style 'parentheses)
(setq frame-title-format "%b %I") ;显示文件名和大小

(auto-image-file-mode t) ;让Emacs可以直接打开、显示图片
(fset 'yes-or-no-p 'y-or-n-p) ;以Y/N代表yes/no
(setq auto-save-default nil) ;不生成名为#filename#的临时文件
(setq x-select-enable-clipboard t) ;支持和外部程序的拷贝
(global-font-lock-mode t) ;打开语法高亮
