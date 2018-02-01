;;; init --- Summary
;;; Commentary


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

(add-to-list 'load-path "~/.emacs.d/lisp/")


(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)



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




