;;;; php-mode
;;;; ==========================================================================================================

(when (require 'php-mode nil t)
  ;; PEAR規約のインデント設定にする
  ;; (setq php-mode-force-pear t)
  ;;*.phpのファイルのときにphp-modeを自動起動する
  (add-to-list 'auto-mode-alist '
               ("\\.inc\\'\\|\\.ctp\\'\\|\\.phtml\\'" . php-mode))

  (when (require 'align nil t)
    (add-to-list 'align-rules-list
                 '(php-assignment
                   (regexp . "[^-=!^&*+<>/.| \t\n]\\(\\s-*[.-=!^&*+<>/|]*\\)=>?\\(\\s-*\\)\\([^= \t\n]\\|$\\)")
                   (justify .t)
                   (tab-stop . nil)
                   (modes . '(php-mode))))
    (add-to-list 'align-dq-string-modes 'php-mode)
    (add-to-list 'align-sq-string-modes 'php-mode)
    (add-to-list 'align-open-comment-modes 'php-mode)
    (setq align-region-separate (concat "\\(^\\s-*$\\)\\|"
                                        "\\([({}\\(/\*\\)]$\\)\\|"
                                        "\\(^\\s-*[)}\\(\*/\\)][,;]?$\\)\\|"
                                        "\\(^\\s-*\\(}\\|for\\|while\\|if\\|else\\|"
                                        "switch\\|case\\|break\\|continue\\|do\\)[ ;]\\)"
                                        )))

  ;; phpcs/Standards/ruleset.xmlを作成する
  ;;(require 'flyphpcs nil t)

  ;;(setq php-mode-speedbar-open t)

  ;; php-mode-hook
  (add-hook 'php-mode-hook
            (lambda ()

              ;; stickキー有効にするためセミコロンを無効化
              (add-hook 'c-mode-common-hook
                        '(lambda()
                           (local-unset-key ";")))

              (define-key c-mode-base-map (kbd "C-c C-a") 'align-current)
              (define-key c-mode-base-map (kbd "C-c C-s") 'helm-ag)

              ;; 開きカッコの前に空白を入れない
              (setq parens-require-spaces nil)

              ;; カッコ閉じ設定
              (when (require 'flex-autopair nil t)
                 (flex-autopair-mode t))

              ;; 関数の表示設定
              (setq fold-dwim-org/minor-mode t)

              (setq eldoc-mode nil)
              (setq undo-tree-mode nil)

              ;; (defun electric-pair ()
              ;;   "If at end of line, insert character pair without surrounding spaces.
              ;;      Otherwise, just insert the typed character."
              ;;   (interactive)
              ;;   (if (eolp) (let (parens-require-spaces) (insert-pair)) (self-insert-command 1)))


              ;; (define-key php-mode-map "(" 'insert-pair)
              ;; (define-key php-mode-map "\"" 'insert-pair)
              ;; (define-key php-mode-map "'" 'insert-pair)

              ;; (define-key php-mode-map "{" 'electric-pair)

              (define-key php-mode-map (kbd "C-.") (lambda () (interactive) (my-operate-buffer 2)))

              ))

  )
