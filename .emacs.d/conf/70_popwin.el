(when (require 'popwin nil t)
  (setq split-width-threshold nil)
  (setq pop-up-windows nil)
  (setq display-buffer-function 'popwin:display-buffer)
  (setq popwin:popup-window-height 20)
  (setq popwin:close-popup-window-timer-interval 0.05)

  ;; helm
  (push '("helm" :regexp t)  popwin:special-display-config)

  ;; org-mode
  (push '(" *Agenda Commands*")  popwin:special-display-config)
  (push '("*Org Agenda*")  popwin:special-display-config)
  (push '("*Org Select*")  popwin:special-display-config)

  ;; moccur
  (push '("*Moccur*")  popwin:special-display-config)

  ;; M-!
  (push "*Shell Command Output*" popwin:special-display-config)

  ;; org-src
  (push '("*Org Src" :regexp t) popwin:special-display-config)

  ;; simplenote
  ;;(push '("simple" :regexp t) popwin:special-display-config)
  (push '("*Simplenote") popwin:special-display-config)

  ;; M-x compile
  ;;(push '(compilation-mode :noselect t) popwin:special-display-config)
  (push '(" *auto-async-byte-compile*" :position bottom :noselect t) popwin:special-display-config)

  ;; undo-tree
  (push '(" *undo-tree*" :width 0.3 :position right) popwin:special-display-config)

  ;; M-x dired-jump-other-window
  (push '(dired-mode :position top) popwin:special-display-config))

