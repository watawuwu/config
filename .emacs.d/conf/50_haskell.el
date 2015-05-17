;; Haskell-mode
(when (require 'haskell-mode nil t)
  ;; indent の有効.
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
  (add-hook 'haskell-mode-hook 'font-lock-mode)
  (add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
  (add-hook 'haskell-mode-hook 'haskell-indentation-mode)
  (add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
  (add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))
  (setq haskell-program-name "/usr/local/bin/ghci")
  (defadvice inferior-haskell-load-file (after change-focus-after-load)
    "Change focus to GHCi window after C-c C-l command"
    (other-window 1))
  (ad-activate 'inferior-haskell-load-file)

  (add-hook 'haskell-mode-hook (lambda () (flymake-mode)))
  )

