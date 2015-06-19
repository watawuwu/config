;;;; ==========================================================================================================
;;;; elisp-mode
;;;; ==========================================================================================================

;; 式の評価結果を注釈するための設定
(when (autoload-if-found 'lispxmp "lispxmp")
  ;; emacs-lisp-modeでC-c C-dを押すと注釈される
  (define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp))

;; 括弧の対応を保持して編集する設定
(when (autoload-if-found 'paredit "paredit")
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
  ;;(add-hook 'lisp-interaction-mode-hook 'eable-paredit-mode)
  (add-hook 'lisp-mode-hook 'enable-paredit-mode)
  (add-hook 'ielm-mode-hook 'enable-paredit-mode)
  (global-set-key "\C-\M-g" 'paredit-backward))

;; Use Emacs23's eldoc
(when (autoload-if-found 'eldoc "eldoc")
  (autoload-if-found 'eldoc-extension "eldoc-extension")
  (setq eldoc-idle-delay 0)
  (setq eldoc-echo-area-use-multiline-p t)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
  (setq eldoc-idle-delay 0.2)        ; すぐ表示したい
  (setq eldoc-minor-mode-sring nil)  ; モードラインにEldocと表示しない
  ;; 釣り合いの取れる括弧をハイライトする
  (show-paren-mode 1))
