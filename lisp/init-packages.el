(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("melpa" . "http://melpa.org/packages/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/"))
      package-archive-priorities '(("melpa-stable" . 1))) ;; the package manager


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;配置use-package包
(eval-when-compile
  (require 'use-package))



(provide 'init-packages)
