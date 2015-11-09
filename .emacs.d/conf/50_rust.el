;; rustモード
(when (require 'rust-mode nil t)
  (eval-after-load "rust-mode" '(require 'company))
  (eval-after-load "rust-mode" '(require 'racer))

  (custom-set-variables
   '(racer-cmd (expand-file-name "~/opt/bin/racer"))
   ;; https://github.com/brson/multirust/issues/77
   '(racer-rust-src-path (expand-file-name "~/.multirust/toolchains/1.4.0/src"))
   '(rust-indent-offset 2))

  ;; Load rust-mode when you open `.rs` files
  (add-to-list 'auto-mode-alist '("\\.rs$" . rust-mode))

  ;; Setting up configurations when you load rust-mode
  (add-hook 'rust-mode-hook
            '(lambda ()
               (racer-mode)
               (eldoc-mode)
               (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))


  (add-hook 'racer-mode-hook
            '(lambda ()
               (company-mode)
               (local-set-key (kbd "M-.") #'racer-find-definition))))
