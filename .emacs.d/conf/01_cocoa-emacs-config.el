;;;; ==========================================================================================================
;;;; cocoa-emacsの設定
;;;; ==========================================================================================================


(setq x-select-enable-clipboard t)

(setq default-input-method "MacOSX")

;; RGB用設定
(setq ns-use-srgb-colorspace t)

;; フォント設定
(when window-system
  (let* (
         (fontset-name "myfonts") ; フォントセットの名前
         (size 14)                ; ASCIIフォントのサイズ [9/10/12/14/15/17/19/20/...]
         (asciifont "Essential PragmataPro for Powerline")    ; ASCIIフォント
         (jpfont "Migu 2M")       ; 日本語フォント
         ;; (asciifont "Migu 2M")    ; ASCIIフォント
         ;; (jpfont "Migu 2M")       ; 日本語フォント
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
  (set-face-font 'default "fontset-myfonts"))


;; Mac OS X で ファイルシステムのフォーマットに HFS+ を利用している場合、ファイル名の取り扱いが、 Windows や Linux と異なります。
(when (require 'ucs-normalize)
     (setq file-name-coding-system 'utf-8-hfs)
     (setq locale-coding-system 'utf-8-hfs))

;; (require 'migemo)
(setq migemo-command "/usr/local/bin/cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(setq migemo-regex-dictionary nil)
(load-library "migemo")
(migemo-init)
;; これがないとincremental-searchで検索がスキップされる
(setq search-whitespace-regexp nil)

;; ブラウザをchromeに変更
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "open")

;; for ls --dired
 (when (require 'ls-lisp)
   (setq ls-lisp-use-insert-directory-program nil))

;; iTerm 連携
(defun show-in-iterm-for-mac()
  (interactive)
  (shell-command (concat "open -a iTerm " default-directory))
  )

(global-set-key (kbd "s-T") 'show-in-iterm-for-mac)
