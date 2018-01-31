;;使用emacs的package管理功能
(require 'package)

(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 
 package-archive-priorities '(("melpa-stable" . 1))) ;; the package manager

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))

;;配置use-package包
(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'exec-path "/usr/local/bin")

(use-package company
  :ensure t
  :bind (("C-c /". company-complete))
  :diminish company-mode
  :commands company-mode
  :init
  (setq
   company-dabbrev-ignore-case nil
   company-dabbrev-code-ignore-case nil
   company-dabbrev-downcase nil
   company-idle-delay 0
   company-minimum-prefix-length 4)
  :config
  ;; disables TAB in company-mode, freeing it for yasnippet
  (global-company-mode)
  (define-key company-active-map [tab] nil)
  (define-key company-active-map (kbd "TAB") nil))

(use-package rainbow-mode)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package vue-mode)
(use-package vue-html-mode)

(use-package markdown-mode
  :ensure t)

(use-package lispy
  :config
  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)())))

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rainbow-mode vue-mode lispy markdown-mode magit company use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
