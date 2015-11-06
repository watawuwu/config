(when (require 'company nil t)
  ;; ex (add-hook 'python-mode-hook 'company-mode)

  (custom-set-variables
   '(company-idle-delay 0)
   '(company-minimum-prefix-length 2)
   '(company-selection-wrap-around t)
   '(company-tooltip-align-annotations t))

  (define-key company-active-map (kbd "TAB") #'company-indent-or-complete-common)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-h") nil)

  (add-hook 'company-mode-hook
            '(lambda ())))
