(when (require 'ruby-mode nil t )
  (when  (require 'ruby-block nil t)
    (ruby-block-mode t)
    (setq ruby-block-highlight-toggle 'overlay)
    (setq ruby-block-highlight-toggle t))

  (when (require 'ruby-electric nil t)
    (add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
    (setq ruby-electric-expand-delimiters-list nil))

  (autoload 'ruby-mode "ruby-mode"
    "Mode for editing ruby source files" t)
  (add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

  (add-hook 'ruby-mode-hook
            '(lambda ()
               (setq tab-width 2)
               (setq ruby-indent-level tab-width)
               (setq ruby-deep-indent-paren-style nil)))
  )
