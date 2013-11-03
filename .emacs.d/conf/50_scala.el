;; scala-mode

(when (require 'scala-mode2 nil t)
;;  (require 'scala-mode-feature-electric nil t)
  (require 'ensime nil t)

  (defun my-scala-switch-to-interpreter ()
    (interactive)
    (setq my-scala-switch-to-interpreter (current-buffer))
    (unless (scala-interpreter-running-p-1)
      (scala-run-scala "scala"))
    (scala-switch-to-interpreter))

  (defun my-scala-back-to-editing-buffer ()
    (interactive)
    (switch-to-buffer my-scala-current-buffer))

  (defun my-scala-newline(arg)
    (interactive "p")
    (cond ((scala-in-multi-line-comment-p)
           (scala-newline))
          ((char-equal ?\} (following-char))
           (let (killed)
             (newline-and-indent)
             (newline-and-indent)
             (forward-char)
             (setq killed (not (my-end-of-line-p)))
             (if killed (kill-line))
             (previous-line)
             (indent-for-tab-command)
             (if killed (yank))))
          (t
           (newline-and-indent))))

  (setq scala-mode-feature:electric-expand-delimiters-list '(?\{))

  (defadvice scala-block-indentation (around improve-indentation-after-brace activate)
    (if (eq (char-before) ?\{)
        (setq ad-return-value (+ (current-indentation) scala-mode-indent:step))
      ad-do-it))

  (add-hook 'scala-mode-hook
            (lambda ()
;;              (local-set-key (kbd "C-m") 'my-scala-newline)
              (local-set-key (kbd "C-c C-a") 'align-current)
;;              (define-key scala-mode-map (kbd "C-c C-z") 'my-scala-switch-to-interpreter)
;;              (define-key scala-mode-inf-map (kbd "C-c C-z") 'my-scala-back-to-editing-buffer)
;;              (local-set-key (kbd "C-M-j") 'join-line)
;;              (local-set-key (kbd "<backtab>") 'scala-indent:indent-with-reluctant-strategy)
;;              (scala-electric-mode t)
;;              (flex-autopair-mode t)
              ))

  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
  )
