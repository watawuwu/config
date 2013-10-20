(progn
  (autoload 'cycle-buffer "cycle-buffer" "Cycle forward." t)
  (autoload 'cycle-buffer-backward "cycle-buffer" "Cycle backward." t)
  (autoload 'cycle-buffer-permissive "cycle-buffer" "Cycle forward allowing *buffers*." t)
  (autoload 'cycle-buffer-backward-permissive "cycle-buffer" "Cycle backward allowing *buffers*." t)
  (autoload 'cycle-buffer-toggle-interesting "cycle-buffer" "Toggle if this buffer will be considered." t)
  (eval-after-autoload-if-found
   '(cycle-buffer cycle-buffer-backward) "cycle-buffer" nil t nil
   '((setq cycle-buffer-allow-visible t)
     (setq cycle-buffer-show-length 12)
     (setq cycle-buffer-show-format '(" <(%s)>" . " %s"))))
  (global-set-key (kbd "C-,") 'cycle-buffer)
  (global-set-key (kbd "C-.") 'cycle-buffer-backward)
  )
