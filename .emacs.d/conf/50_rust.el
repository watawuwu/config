;; rustモード
(when (require 'rust-mode nil t)
  (add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))

  (eval-after-load "rust-mode"
  '(setq-default rust-format-on-save t))

  (eval-after-load "rust-mode" '(require 'company))
  (eval-after-load "rust-mode" '(require 'racer))

  '(rust-indent-offset 4)

  ;; Load rust-mode when you open `.rs` files
  (add-to-list 'auto-mode-alist '("\\.rs$" . rust-mode))

  ;; Setting up configurations when you load rust-mode
  (add-hook 'rust-mode-hook
            '(lambda ()
               (racer-mode)
               (flycheck-rust-setup)
               (define-key rust-mode-map (kbd "C-c C-f") #'rustfmt-format-buffer)
               ))

  (add-hook 'racer-mode-hook #'eldoc-mode)

  (add-hook 'racer-mode-hook
            '(lambda ()
               (company-mode)
               (local-set-key (kbd "M-.") #'racer-find-definition))))
