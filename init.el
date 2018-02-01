;;; init --- Summary
;;; Commentary

;;使用emacs的package管理功能

(package-initialize)

(require 'package)


(add-to-list 'load-path "~/.emacs.d/lisp")
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

(require 'init-packages)
(require 'init-ui)
(require 'init-themes)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-complate)



(add-to-list 'exec-path "/usr/local/bin")

(use-package dash)
(use-package f)

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



(use-package alert
  :commands (alert)
  :init
  (setq alert-default-style 'notifications))



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


;; helm
(use-package helm
  :diminish helm-mode
  :config
  (require 'helm-config)
  (general-define-key
   :keymaps 'helm-map
   "C-c !" 'helm-toggle-suspend-update
   "<tab>" 'helm-execute-persistent-action
   "C-i" 'helm-execute-persistent-action
   "C-z" 'helm-select-action)
  (global-unset-key (kbd "C-x c"))
  (helm-mode))


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



