(when (autoload-if-found 'csharp-mode "csharp-mode")

  ;; Cモード共通フック
  (add-hook 'csharp-mode-hook
            '(lambda()
               (setq comment-column 40)
               (setq c-basic-offset 4)
               (font-lock-add-magic-number)
               ;; オフセットの調整
               (c-set-offset 'substatement-open 0)
               (c-set-offset 'case-label '+)
               (c-set-offset 'arglist-intro '+)
               (c-set-offset 'arglist-close 0)
               )
            )
  )
