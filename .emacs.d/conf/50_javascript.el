;;;; ==========================================================================================================
;;;; js2-mode
;;;; ==========================================================================================================

(when (autoload-if-found 'js2-mode "js2-mode")
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
  (setq-default js2-basic-offset 2)
  (setq js-indent-level 2)


  ;; jqueryなど
  (eval-after-load 'js2-mode
    '(progn
       (require 'js2-imenu-extras)
       (js2-imenu-extras-setup)))

  (add-hook 'js2-mode-hook
            '(lambda ()
               (define-key js2-mode-map (kbd "C-m") 'newline-and-indent)
               (setq js2-basic-offset 2
                    indent-tabs-mode nil)
               ;; sequential-command-configを有効にするため削除
               (define-key js2-mode-map (kbd "C-a") nil)
               (define-key js2-mode-map (kbd "C-e") nil))))

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))
