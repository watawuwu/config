;;;; ==========================================================================================================
;;;; html-helper-mode
;;;; ==========================================================================================================


(when (require 'web-mode)

  ;; 適用する拡張子
  (add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
;;  (add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
;;  (add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))

  ;; インデント数
  (defun web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-html-offset   2)
    (setq web-mode-css-offset    2)
    (setq web-mode-script-offset 2)
    (setq web-mode-php-offset    2)
    (setq web-mode-java-offset   2)
    (setq web-mode-asp-offset    2))
  (add-hook 'web-mode-hook 'web-mode-hook))

;; (autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;; (setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
;; (add-hook 'html-mode-hook '(lambda ()
;;                              (setq c-basic-offset 4)
;;                              (setq c-tab-width 4)
;;                              (setq c-argdecl-indent 0)
;;                              (setq c-auto-newline nil)
;;                              (setq c-continued-statement-offset 0)
;;                              (setq c-indent-level 4)
;;                              (setq c-label-offset -4)
;;                              (setq c-tab-always-indent nil)
;;                              (setq indent-tabs-mode nil)
;;                              (setq tab-width 4)
;;                              (setq-default tab-width 4)
;;                              ) t)
;; (add-hook 'html-helper-mode-hook '(lambda ()
;;                                     (setq c-basic-offset 4)
;;                                     (setq c-tab-width 4)
;;                                     (setq c-argdecl-indent 0)
;;                                     (setq c-auto-newline nil)
;;                                     (setq c-continued-statement-offset 0)
;;                                     (setq c-indent-level 4)
;;                                     (setq c-label-offset -4)
;;                                     (setq c-tab-always-indent nil)
;;                                     (setq indent-tabs-mode nil)
;;                                     (setq tab-width 4)
;;                                     (setq-default tab-width 4)
;;                                     ) t)
