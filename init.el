;;; init.el --- Loads configuration in config.org
;;

(package-initialize)

(require 'org-dotemacs)
(setq org-dotemacs-default-file "~/.emacs.d/config.org")
(org-dotemacs-load-default)

; adding to org-mode-hook does not work anymore in org-dotemacs :(
(defun mfl/org-hook ()
  (interactive)
  (local-unset-key [(meta down)])
  (local-unset-key [(meta up)])
  (local-unset-key [(shift ctrl up)])
  (local-unset-key [(shift ctrl down)])
  (local-unset-key [(shift return)])
  (local-unset-key [(control left)])
  (local-unset-key [(control right)])
  (local-unset-key [(control shift left)])
  (local-unset-key [(control shift right)])
  (local-set-key [(super return)] 'org-table-copy-down)
  (local-set-key [(super up)] 'org-backward-heading-same-level)
  (local-set-key [(super down)] 'org-forward-heading-same-level)
  (local-set-key (kbd "RET") 'org-return-indent)
  (local-set-key [(shift meta up)] 'org-metaup)
  (local-set-key [(shift meta down)] 'org-metadown)
  )
(add-hook 'org-mode-hook 'mfl/org-hook)

(defun mfl/babel-template-hook ()
  (interactive)
  (add-to-list 'org-structure-template-alist
	       '("r" . "src R"))
  (add-to-list 'org-structure-template-alist
	       '("la" . "src latex"))
  (add-to-list 'org-structure-template-alist
	       '("el" . "src emacs-lisp"))
  )
(add-hook 'org-mode-hook 'mfl/babel-template-hook)

(require 'org-tempo)
