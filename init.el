;;; init --- Summary
;;; Commentary

;;使用emacs的package管理功能
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("melpa" . "http://melpa.org/packages/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/"))
      package-archive-priorities '(("melpa-stable" . 1))) ;; the package manager

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))

;;配置use-package包
(eval-when-compile
  (require 'use-package))

(add-to-list 'exec-path "/usr/local/bin")

;; smooth scrolling
(use-package smooth-scroll
  :if (display-graphic-p)
  :diminish smooth-scroll-mode
  :config
  (setq smooth-scroll/vscroll-step-size 8)
  (smooth-scroll-mode))

(use-package spacemacs-theme
  :ensure t
  :init
  (progn
    (load-theme 'spacemacs-dark t)
    ;; (load-theme 'wheatgrass t)
    ;; Exploits a bug to get a better modeline
    ))

(use-package company
  :ensure t
  :bind (("C-c /". company-complete))
  :diminish company-mode
  :commands company-mode
  :init
  (setq
   company-idle-delay 0
   company-minimum-prefix-length 4)
  :config
  ;; disables TAB in company-mode, freeing it for yasnippet
  (global-company-mode)
  (define-key company-active-map [tab] nil)
  (define-key company-active-map (kbd "TAB") nil))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))



(use-package company-quickhelp
  :init
  (add-hook 'company-mode #'company-quickhelp-mode))

(use-package org-bullets
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package markdown-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  :config
  (add-hook 'markdown-mode-hook (lambda ()
				  (set-fill-column 72))))
  
(use-package google-this
  :ensure t)

(use-package flycheck
  :ensure t
  :config
  (progn
    (setq flycheck-check-syntax-automatically '(mode-enabled save))
    (define-key flycheck-mode-map (kbd "C-c f l") #'flycheck-list-errors)
    (define-key flycheck-mode-map (kbd "C-c f n") #'flycheck-next-error)
    (define-key flycheck-mode-map (kbd "C-c f p") #'flycheck-previous-error)))


;; flyspell - use aspell instead of ispell
(use-package flyspell
  :ensure t
  :commands (flyspell-mode flyspell-prog-mode)
  :config (setq ispell-program-name (executable-find "aspell")
                ispell-extra-args '("--sug-mode=ultra")))

;; emms
(use-package emms
  :ensure t
  :config
  (progn
    (emms-standard)
    (emms-default-players)
    (setq emms-playlist-buffer-name "Music-EMMS")
    (setq emms-source-file-default-directory "~/Music/")))


;;Projectile related config
(use-package projectile
  :ensure t
  :diminish projectile-mode "p"
  :init
  (progn
    (projectile-global-mode))
  :config
  (progn
    (setq projectile-enable-caching t)))


(use-package alert
  :commands (alert)
  :init
  (setq alert-default-style 'notifications))

;;power-line
(use-package powerline
  :config
  (powerline-default-theme)
  (display-time-mode t))


(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

;; popwin
(use-package popwin
  :config (popwin-mode))

;; CMakef
(use-package cmake-mode
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))

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
    (projectile spacemacs-theme zenburn-theme molokai-theme flycheck company-quickhelp powerline alert rainbow-mode vue-mode lispy markdown-mode magit company use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
