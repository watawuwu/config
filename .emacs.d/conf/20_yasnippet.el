(when (require 'yasnippet nil t)

  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets" ;; personal snippets
          yas-installed-snippets-dir ;; package に最初から含まれるスニペット
          ))

  (set-default 'yas/dont-activate
               #'(lambda ()
                   (or
                    (minibufferp)
                    (eq major-mode 'term-mode))))

  ;; 0.8から明示的に指定しないとだめ？かも
  (custom-set-variables '(yas-trigger-key "TAB"))

  (yas-global-mode 1)

  ;; auto-complete のため alias が必要
  ;; cf. https://github.com/capitaomorte/yasnippet/issues/311
  (defalias 'yas/get-snippet-tables 'yas--get-snippet-tables)
  (defalias 'yas/table-hash 'yas--table-Hash)
  )
