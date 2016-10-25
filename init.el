;;; init.el --- Loads configuration in config.org
;;

(package-initialize)

(require 'org-dotemacs)
(setq org-dotemacs-default-file "~/.emacs.d/config.org")
(org-dotemacs-load-default)
