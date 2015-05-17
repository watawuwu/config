(when (require 'yasnippet nil t)

  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets"                  ;; personal snippets
          "~/.emacs.d/el-get/yasnippet/snippets" ;; personal snippets
          ))

  (custom-set-variables '(yas-trigger-key "TAB"))

  (yas-global-mode 1))
