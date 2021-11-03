;;Package setup
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	'("melpa" . "http://melpa.org/packages/") t)
(defvar local-pckges '(yasnippet-snippets ))

(defun not-install-pckges(packages)
	(delq nil
		(mapcar (lambda (p) (if (package-installed-p p nil) nil p)) packages)))


;;GETTING YASNIPPET
(require 'yasnippet)
(yas-global-mode +1)