;;PACKAGE SETUP
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	'("melpa" . "https://melpa.org/packages/") t)
(defvar local-pckges '(yasnippet-snippets auto-complete use-package ))

(defun not-install-pckges(packages)
	(delq nil
		(mapcar (lambda (p) (if (package-installed-p p nil) nil p)) packages)))

(let ((need-installation (not-install-pckges local-pckges)))
  (when need-installation
    (progn
      (package-refresh-contents)
      (dolist (p need-installation)
	      (package-install p)))))

;;USE-PACKAGE
(add-to-list 'load-path "~/.emacs.d/site-lisp/use-package")
(require 'use-package)
(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
	       "~/.emacs.d/site-lisp/use-package/"))
(use-package try :ensure t)
(use-package which-key :ensure t :config (which-key-mode))
	     
;;AUTO-COMPLETE
(require 'auto-complete-config)
(ac-config-default)

;;GETTING YASNIPPET
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
