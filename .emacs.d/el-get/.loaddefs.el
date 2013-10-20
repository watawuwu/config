;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (apache-mode) "apache-mode/apache-mode" "../../../../.emacs.d/el-get/apache-mode/apache-mode.el"
;;;;;;  "9defd945a335d3128e5b89eeb83b815b")
;;; Generated autoloads from ../../../../.emacs.d/el-get/apache-mode/apache-mode.el

(autoload 'apache-mode "apache-mode/apache-mode" "\
Major mode for editing Apache configuration files.

\(fn)" t nil)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/el-get/apache-mode/apache-mode.el")
;;;;;;  (21091 38170 626835 0))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
