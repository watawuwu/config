;; color-themeより前だとカラーリングがおかしくなる

;; vim-powerlineの様なインターフェイス
(when (require 'powerline nil t)
  (custom-set-faces
   '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
   '(mode-line-buffer-id ((t (:background "gray75" :foreground "dark cyan" :weight bold :height 1.0))))
   '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))
  (powerline-default-theme))
