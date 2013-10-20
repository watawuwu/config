;;;; ==========================================================================================================
;;;; linux(ubuntu)の設定
;;;; ==========================================================================================================

;; フォント設定
(when window-system
  (let* (
         (fontset-name "myfonts") ; フォントセットの名前
         (size 10)                ; ASCIIフォントのサイズ [9/10/12/14/15/17/19/20/...]
         (asciifont "Migu 2M")    ; ASCIIフォント
         (jpfont "Migu 2M")       ; 日本語フォント
;;         (asciifont "komatuna")    ; ASCIIフォント
;;         (jpfont "komatuna")       ; 日本語フォント
;;         (asciifont "monapo")    ; ASCIIフォント
;;         (jpfont "monapo")       ; 日本語フォント

         (font (format "%s-%d:weight=normal:slant=normal" asciifont size))
         (fontspec (font-spec :family asciifont))
         (jp-fontspec (font-spec :family jpfont))
         (fsn (create-fontset-from-ascii-font font nil fontset-name))
         )
    (set-fontset-font fsn 'japanese-jisx0213.2004-1 jp-fontspec)
    (set-fontset-font fsn 'japanese-jisx0213-2 jp-fontspec)
    (set-fontset-font fsn 'katakana-jisx0201 jp-fontspec) ; 半角カナ
    (set-fontset-font fsn '(#x0080 . #x024F) fontspec)    ; 分音符付きラテン
    (set-fontset-font fsn '(#x0370 . #x03FF) fontspec)    ; ギリシャ文字
    )

  ;; デフォルトのフレームパラメータでフォントセットを指定


  (add-to-list 'default-frame-alist '(font . "fontset-myfonts"))

  ;; フォントサイズの比を設定
  (dolist (elt '(("^-apple-hiragino.*" . 1.2)
                 (".*osaka-bold.*" . 1.2)
                 (".*osaka-medium.*" . 1.2)
                 (".*courier-bold-.*-mac-roman" . 1.0)
                 (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
                 (".*monaco-bold-.*-mac-roman" . 0.9)))
    (add-to-list 'face-font-rescale-alist elt))

  ;; デフォルトフェイスにフォントセットを設定
  ;; (これは起動時に default-frame-alist に従ったフレームが作成されない現象への対処)
  (set-face-font 'default "fontset-myfonts")
  )


;; Migemoが必要
;; C/Migemoがあれば優先して使う
(when (and (require 'migemo nil t)
           (or (executable-find "migemo")
               (executable-find "cmigemo")))
  ;; C/Migemoがある場合
  (when (executable-find "cmigemo")
    ;; コマンド定義
    (setq migemo-command "cmigemo")
    (setq migemo-options '("-q" "--emacs"))
    ;; 辞書指定
    (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
    (setq migemo-coding-system 'utf-8-unix)
    (setq migemo-user-dictionary nil)
    (setq migemo-regex-dictionary nil))

  ;; 初期化しておく
  (migemo-init))

;; ibus-modeの設定
(when (require 'ibus nil t)
  ;; Turn on ibus-mode automatically after loading .emacs
  (add-hook 'after-init-hook 'ibus-mode-on)
  ;; Use C-SPC for Set Mark command
  (ibus-define-common-key ?\C-\s nil)
  ;; Use C-/ for Undo command
  (ibus-define-common-key ?\C-/ nil)
  ;; Change cursor color depending on IBus status
  (setq ibus-cursor-color '("limegreen" "white" "blue"))
  (global-set-key (kbd "S-SPC") 'ibus-toggle)
  (define-key global-map "\C-\\" nil)

  (ibus-define-common-key ?\C-\s nil)

  (setq ibus-prediction-window-position t)


  (ibus-define-common-key (kbd "<f7>") nil)
  (ibus-define-common-key (kbd "<f8>") nil)

  ;; 候補ウインドウを左へ57ピクセルずらして表示
  (setq ibus-candidate-window-h-offset 3)
  ;; 予測ウインドウを左へ50ピクセルずらして表示
  (setq ibus-prediction-window-h-offset 3)


  ;; どこかで日本語の設定に変更されるので最後に初期化する
  ;; これがないとdiredで日本語が使えない
  (set-locale-environment nil))


;; (when (require 'mozc nil t)
;;   (set-language-environment "Japanese")
;;   (setq default-input-method "japanese-mozc")
;;   (setq mozc-candidate-style 'overlay)
;; (global-set-key (kbd "S-SPC") 'toggle-input-method))



;; ブラウザをchromeに変更
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program
      (if (file-exists-p "/usr/bin/chromium-browser")
          "/usr/bin/chromium-browser" "/usr/bin/firefox"))
