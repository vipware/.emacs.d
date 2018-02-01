
;;补全相关的配置
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

(provide 'init-complate)
