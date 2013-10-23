;; color-themeより前だとカラーリングがおかしくなる

;; vim-powerlineの様なインターフェイス
(when (require 'powerline nil t)
  (setq powerline-arrow-shape 'arrow)   ;; the default
  (setq powerline-arrow-shape 'curve)   ;; give your mode-line curves
  (setq powerline-arrow-shape 'arrow14) ;; best for small fonts
  (setq powerline-color1 "grey22")
  (setq powerline-color2 "grey60")
  (custom-set-faces
   '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
   '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))
  (powerline-default-theme))
