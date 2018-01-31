;;使用emacs的package管理功能
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ("melpa" . "http://elpa.emacs-china.org/melpa/")
			   ("melpa" . "http://melpa.milkbox.net/packages/"))))

;; 加载cl库 - 一个CommonLisp扩展库
(require 'cl)

;; Add Packages
(defvar my/packages '(
            ;;packages
            ;;for example I want to install company, then simply add it to the list
            company


           ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
    (loop for pkg in my/packages
      when (not (package-installed-p pkg)) do (return nil)
      finally (return t)))

(unless (my/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg my/packages)
      (when (not (package-installed-p pkg))
    (package-install pkg))))



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


;;{{-- speedbar.elc  
(require 'speedbar)  
(speedbar-change-initial-expansion-list "quick buffers")  
(setq speedbar-use-images nil)

;;Fonts
;;(when (eq system-type 'darwin)
  ;; default Latin font (e.g. Consolas)
;;  (set-face-attribute 'default nil :family "Consolas")
;;  (set-face-attribute 'default nil :height 130)
;;  (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding")))


;; 根据url地址特征设置浏览器
(setq
 browse-url-browser-function
 '(
  ("wikipedia\\.org" . browse-url-firefox)
  ("github" . browse-url-chromium)
  ("thefreedictionary\\.com" . eww-browse-url)
  ("." . browse-url-default-browser)
  ))



;; 检查操作系统类型
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (message "Microsoft Windows")))
 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (message "Mac OS X")))
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (message "Linux"))))
