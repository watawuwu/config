(when (autoload-if-found 'ruby-mode "ruby-mode")

  (when  (require 'ruby-block)
    (ruby-block-mode t)
    (setq ruby-block-highlight-toggle 'overlay)
    (setq ruby-block-highlight-toggle t))

  (when (autoload-if-found 'ruby-electric "ruby-electric")
    (add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
    (setq ruby-electric-expand-delimiters-list nil))

  (add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

  (add-hook 'ruby-mode-hook
            '(lambda ()
               (setq tab-width 2)
               (setq ruby-indent-level tab-width)
               (setq ruby-deep-indent-paren-style nil))))
