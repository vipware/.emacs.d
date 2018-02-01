(setq-default cursor-type 'bar)

;; smooth scrolling
(use-package smooth-scroll
  :if (display-graphic-p)
  :diminish smooth-scroll-mode
  :config
  (setq smooth-scroll/vscroll-step-size 8)
  (smooth-scroll-mode))

;;power-line
(use-package powerline
  :config
  (powerline-default-theme)
  (display-time-mode t))


(provide 'init-ui)
