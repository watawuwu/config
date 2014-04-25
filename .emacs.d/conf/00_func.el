(defun my-change-indent (arg)
  "インデントを変更する
    C-uをつけて実行すると'2' そのまま実行すると'4' "
  (interactive "p")

  (case arg
    (4  (setq c-basic-offset 2))
    (t  (setq c-basic-offset 4))))


(defun align-to-equals (begin end)
  "Align region to equal signs"
  (interactive "r")
  (align-regexp begin end
                (rx (group (zero-or-more (syntax whitespace))) "=") 1 1 ))
