;;;; ==========================================================================================================
;;;; 表示設定
;;;; ==========================================================================================================

;; Please set your themes directory to 'custom-theme-load-path
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/el-get/replace-colorthemes"))

(load-theme 'billw t t)
(enable-theme 'billw)

(when window-system
  ;; スクリーン設定
  ;; 場所により競合する可能性あり
  (progn (setq elscreen-prefix-key (kbd "C-t"))
         (when (require 'elscreen nil t)
           '(elscreen-tab-background-face     ((t (:background "#111111"))))
           '(elscreen-tab-current-screen-face ((t (:foreground "#F8F8F2" :background "gray30" :weight bold))))
           '(elscreen-tab-other-screen-face   ((t (:foreground "gray90" :background "gray30"))))
           (setq elscreen-tab-display-kill-screen nil)
           (setq elscreen-tab-display-control nil)
           ;; (setq elscreen-display-tab nil)
           )
         (elscreen-start)
         )

  ;; ツールバーを消す
  (tool-bar-mode -1)

  ;; メニューバーを消す
  (menu-bar-mode -1)

  ;; スクロールバーを消す
  (scroll-bar-mode -1)
  )

;; 改行コードを表示
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; 起動時のメッセージを非表示
(setq inhibit-startup-message t)

;; "yes or no"を"y or n"に
(fset 'yes-or-no-p 'y-or-n-p)

;; 現在行にをつける
;; 重いらしいので一旦コメントアウト
;;(global-hl-line-mode t)

;; 対応する括弧を強調する
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)

;; 選択領域の色
(set-face-background 'region "#555")

;; 行番号・桁番号を表示する
(line-number-mode 1)
(column-number-mode 1)

;; リージョンに色をつける
(transient-mark-mode 1)

;;タブ幅を 4 に設定
;; (setq-default tab-width 4)
;; (setq tab-width 4)
;;タブ幅の倍数を設定
;; (setq tab-stop-list
;;      '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
(defun set-aurora-tab-width (num &optional local redraw)
  "タブ幅をセットします。タブ5とかタブ20も設定できたりします。
localが non-nilの場合は、カレントバッファでのみ有効になります。
redrawが non-nilの場合は、Windowを再描画します。"
  (interactive "nTab Width: ")
  (when local
    (make-local-variable 'tab-width)
    (make-local-variable 'tab-stop-list))
  (setq tab-width num)
  (setq tab-stop-list ())
  (while (<= num 256)
    (setq tab-stop-list `(,@tab-stop-list ,num))
    (setq num (+ num tab-width)))
  (when redraw (redraw-display)) tab-width)

(set-aurora-tab-width (setq default-tab-width (setq-default tab-width 4)))


;;タブではなくスペースを使う
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)
(setq indent-tabs-mode t)

;; 初期URL、ファイルパスを現在開いているパスにする
(ffap-bindings)

;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

;;;; ==========================================================================================================
;;;; 文字コード設定
;;;; ==========================================================================================================

;; 日本語の設定
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)


;; ;;;; ==========================================================================================================
;; ;;;; 一般設定
;; ;;;; ==========================================================================================================

;; Emacs でビープ音を出さなくする設定
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; マウスで選択するとコピーする Emacs 24 ではデフォルトが nil
(setq mouse-drag-copy-region t)

;; 履歴
(progn
  ;; 最近のファイルを1000個保存する
  (setq recentf-max-saved-items 1000)
  ;; 最近使ったファイルに加えないファイルを正規表現で指定する
  (setq recentf-exclude '("/TAGS$" "/var/tmp/"))
  ;; 履歴の保存数を増やす
  (setq history-length 1000)
  ;; 履歴を次回Emacs起動時にも保存する
  (savehist-mode 1)
  ;; ファイル内のカーソルの位置を記憶する
  (setq-default save-place t))

;; Emacs終了コマンド
(defalias 'exit 'save-buffers-kill-emacs)

;; still has clients; kill it? (yes or no)と聞かれないように
(remove-hook
 'kill-buffer-query-functions
 'server-kill-buffer-query-function)

;; 終了時にオートセーブファイルを削除
(setq delete-auto-save-files t)

;; バックアップファイルを作らない
(setq backup-inhibited t)
(setq make-backup-files nil)

;; file名の補完で大文字小文字を区別しない
(setq completion-ignore-case t)

;; バッファ自動再読み込み
(global-auto-revert-mode t)

;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; 部分一致の補完機能を使う
;; p-bでprint-bufferとか
(setq partial-completion-mode t)

;; 補完可能なものを随時表示
(icomplete-mode 1)

;; ファイルの先頭に#!.*が存在すると実行権を追加して保存する
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; elファイルの方が新しければelcよりも優先して読み込む
(setq load-prefer-newer t)

;;;; ==========================================================================================================
;;;; キーバインド
;;;; ==========================================================================================================


(defun insert-current-time()
  (interactive)
  (insert (format-time-string "%Y-%m-%dT%H:%M:%S" (current-time))))

(global-set-key (kbd "C-c t")    'insert-current-time)

(defun insert-current-date()
  (interactive)
  (insert (format-time-string "%Y-%m-%d" (current-time))))

(global-set-key (kbd "C-c .")    'insert-current-date)

;; バックスペース
;;(keyboard-translate ?\C-h ?\C-?)
(global-set-key (kbd "C-h")     'delete-backward-char)

;; IMEの切り替え
(global-set-key (kbd "S-<SPC>") 'toggle-input-method)

;; 行頭まで削除
(global-set-key (kbd "M-k")     '(lambda () (interactive) (kill-line 0)))

;; バッファを削除
(global-set-key (kbd "C-x C-c") (lambda() (interactive)(kill-buffer (buffer-name))))
;; バックスラッシュ
(global-set-key (kbd "M-|")     "\\")

;; 行の折り返し
(global-set-key (kbd "C-c C-l") 'toggle-truncate-lines)

;; 通常マウス？
(progn
  (global-set-key [C-mouse-5]
                  '(lambda ()(interactive)(text-scale-increase -1)))
  (global-set-key [C-mouse-4]
                  '(lambda ()(interactive)(text-scale-increase 1)))
  (global-set-key [C-mouse-3]
                  '(lambda ()(interactive)(text-scale-increase 0))))
;; MAC？
(progn
  (global-set-key [C-wheel-down]
                  '(lambda ()(interactive)(text-scale-increase -1)))
  (global-set-key [C-wheel-up]
                  '(lambda ()(interactive)(text-scale-increase 1))))

;; suspend frameを削除
(global-set-key (kbd "C-z") nil)

;; 5行上下移動
(global-set-key (kbd "M-n") '(lambda ()(interactive)(forward-line 5)))
(global-set-key (kbd "M-p") '(lambda ()(interactive)(forward-line -5)))

;; backward-kill-wordだとヤンクしてしまうので単なる単語削除を定義後バインド
(progn
  (defun delete-word (arg)
    "Delete characters forward until encountering the end of a word.
    With argument, do this that many times."
    (interactive "p")
    (delete-region (point) (progn (forward-word arg) (point))))

  (defun backward-delete-word (arg)
    "Delete characters backward until encountering the end of a word.
    With argument, do this that many times."
    (interactive "p")
    (delete-word (- arg)))

  (global-set-key (kbd "M-h") 'backward-delete-word))


;; インクリメンタルサーチ中に文字を削除
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)

;; ミニバッファで単語削除
(define-key minibuffer-local-completion-map (kbd "C-w") 'backward-kill-word)

;; shell コマンドを呼び出す
(define-key mode-specific-map (kbd "C-z") 'shell-command)

;; C-mをオートインデント改行
(global-set-key (kbd "C-m") 'newline-and-indent)

;; C-jを改行に変更
(global-set-key (kbd "C-j") 'newline)

;; find-functionをキー割り当てする
;; ?C-x Vをfind-variableに割り当て。
;; ?C-x Kをfind-function-on-keyに割り当て。
(find-function-setup-keys)

;;;; ==========================================================================================================
;;;; Elisp設定
;;;; ==========================================================================================================

;; 同じファイルを開いている場合にディレクトリ名を追加
(when (require 'uniquify nil t)
  (setq uniquify-buffer-name-style 'forward))

;; ファイルを自動保存
(when (require 'auto-save-buffers-enhanced)
  (setq auto-save-buffers-enhanced-interval 0.3)
  (auto-save-buffers-enhanced t))

;; 履歴にディレクトリを含める
(require 'recentf-ext nil t)

;; Emacs内のシェルコマンド実行履歴を保存
(require 'shell-history nil t )

;; 最後の変更箇所にジャンプ
(when (require 'goto-chg nil t)
  (global-set-key (kbd "<f8>") 'goto-last-change)
  (global-set-key (kbd "s-<f8>") 'goto-last-change-reverse))

;; オートコンプリート
(when (require 'auto-complete-config nil t)
  ;; ディレクトリ設定
  (setq ac-dictionary-directories "ac-dict")
  ;; 補完メニュー表示時に特別なキーマップ（ac-menu-map）を有効にするかどうか
  (ac-config-default)
  (setq ac-use-menu-map t)
  ;; デフォルトで設定済み
  (define-key ac-completing-map (kbd "C-n") 'ac-next)
  (define-key ac-completing-map (kbd "C-p") 'ac-previous)
  (global-auto-complete-mode t)
  )

;; 使い捨てファイルの設定
(when (require 'open-junk-file nil t)
  (setq open-junk-file-format "~/work/emacs_work/.junk/%Y-%m-%d-%H%M%S.")
  (setq open-junk-file-find-file-function (quote find-file-at-point))
  ;; C-x C-zで試行錯誤ファイルを開く
  (global-set-key (kbd "C-x C-z") 'open-junk-file))

;; 同じコマンドを連続実行した際の振る舞いを変更する
;; C-aの連打でバッファ先頭へ
;; C-eの連打でバッファ末尾へ
;; 大文字、小文字変換
;; M-uとM-lとM-cが現在位置の単語の変換からポイント直前の単語を変換するようになる
;; (when (require 'sequential-command-config nil t)
;;   (sequential-command-setup-keys))

;; カーソル位置を戻す
(when (require 'point-undo nil t)
  (global-set-key (kbd "C-9") 'point-undo)
  (global-set-key (kbd "S-<f9>") 'point-redo))

;; バッファのサマリーを表示する
(when (require 'summarye nil t))

;; emacsからsudo操作
;; (when (require 'sudo-ext)

;;   ;; 自分以外のユーザのファイルを開いたら、sudoするか聞いてくる
;;   (defun file-other-p (filename)
;;     "Return t if file FILENAME created by others."
;;     (if (file-exists-p filename)
;;         (/= (user-real-uid) (nth 2 (file-attributes filename))) t))

;;   (defun file-username (filename)
;;     "Return File Owner."
;;     (if (file-exists-p filename)
;;         (user-full-name (nth 2 (file-attributes filename)))
;;       (user-full-name (nth 2 (file-attributes (file-name-directory filename))))))

;;   (defun th-rename-tramp-buffer ()
;;     (when (file-remote-p (buffer-file-name))
;;       (rename-buffer
;;        (format "%s:%s"
;;                (file-remote-p (buffer-file-name) 'method)
;;                (buffer-name)))))

;;   (add-hook 'find-file-hook
;;             'th-rename-tramp-buffer)

;;   (defadvice find-file (around th-find-file activate)
;;     "Open FILENAME using tramp's sudo method if it's read-only."
;;     (if (and (file-other-p (ad-get-arg 0))
;;              (not (file-writable-p (ad-get-arg 0)))
;;              (y-or-n-p (concat "File "
;;                                (ad-get-arg 0) " is "
;;                                (if (file-exists-p (ad-get-arg 0)) "read-only." "newer file.")
;;                                "  Open it as "
;;                                (file-username (ad-get-arg 0)) "? ")))
;;         (th-find-file-sudo (ad-get-arg 0))
;;       ad-do-it))

;;   (defun th-find-file-sudo (file)
;;     "Opens FILE with root privileges."
;;     (interactive "F")
;;     (set-buffer (find-file (concat "/sudo:" (file-username file) "@" (system-name) ":" file)))))

;; バッファ内を複数検索する
(when (require 'color-moccur nil t)
  ;; 検索結果を直接編集する
  (require 'moccur-edit nil t)
  ;; スペースで区切られた複数の単語にマッチする
  (setq moccur-split-word t)
  ;; moccurでmigemoを使う
  (setq moccur-use-migemo t)
  ;; ディレクトリ検索時の除外
  (setq dmoccur-exclusion-mask "")
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$"))

;; シンプルノート
(when (require 'simplenote nil t)
  (require 'simplenote-config nil t)
  (simplenote-setup)

  ;; セーブと同時にSyncする関数
  (defun simplenote-sync-after-save ()
    "If there is the buffer on simplenote-directory, sync the buffer to simplenote."
    (interactive)
    (when (string-match simplenote-directory default-directory)
      (simplenote-sync-notes)
      ;; only when create new note.
      (let (simplenote-new-note-dir)
        (setq simplenote-new-note-dir (concat (file-name-as-directory simplenote-directory) "new"))
        (when (string-match simplenote-new-note-dir default-directory)
          (kill-buffer (get-buffer (current-buffer)))
          (simplenote-browse)))))

  ;; (add-hook 'after-save-hook 'simplenote-sync-after-save)
  )

;; 自動で変数をハイライト
(when (require 'auto-highlight-symbol)
  ;; デフォルトは1秒
  (ahs-set-idle-interval 0.3)
  (global-auto-highlight-symbol-mode t))


(when (require 'ctags nil t)
  (setq tags-revert-without-query t)

  ;; ctag関数を上書きして、tagsとTAGSの両方を作成する
  (defun ctags ()
    ;;    (call-process-shell-command "ctags -e -R " nil "*Ctags*")
    (call-process-shell-command "ctags -R --fields=\"+afikKlmnsSzt\" " nil "*Ctags*"))

  ;; ctagsを呼び出すコマンドライン。パスが通っていればフルパスでなくても良い
  ;; etags互換タグを利用する場合はコメントを外す
  (setq ctags-command "ctags -e -R")
  ;; anything-exuberant-ctags.elを利用しない場合はコメントアウトする
  ;;  (setq ctags-command "ctags -R --fields=\"+afikKlmnsSzt\" ")

  (global-set-key (kbd "<f6>") 'ctags-create-or-update-tags-table)

  ;; 置き換えるetagsと置き換える anything-yaetagsを使う
  ;;(global-set-key (kbd "M-.")  'ctags-search)
  )

;; ブロックの折畳みと展開
(when (require 'fold-dwim nil t)
  (require 'fold-dwim-org nil t))

;; ファイルを開いたときにインデントにタブを使うか設定を自動的に変更してくれる
;;(require 'indent-tabs-maybe nil t)

;; インデントの自動判別
(when (require 'judge-indent nil t)
  (global-judge-indent-mode t)
  (setq judge-indent-major-modes
        '(c-mode c++-mode python-mode php-mode
                 nxml-mode html-helper-mode css-mode js2-mode
                 sh-mode)))

;; undohistの設定
(when (require 'undohist nil t)
  (undohist-initialize))

;;;; ===================================================================================================
;;;; mode設定
;;;; ===================================================================================================

;; 矩形選択モード
(when (cua-mode t)
  ;; 変なキーバインド禁止
  (setq cua-enable-cua-keys nil))

;; xml-mode
(add-hook 'nxml-mode-hook
          '(lambda ()
             (define-key nxml-mode-map (kbd "M-h") 'delete-backward-word)))

;; sh-mode
(add-hook 'sh-mode-hook
          '(lambda ()
             (define-key sh-mode-map (kbd "C-c C-l") 'toggle-truncate-lines)))


;; undo-treeモードの設定
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;; ブロックの折畳みと展開
(when (require 'fold-dwim nil t)
  (require 'fold-dwim-org nil t))

;; yamlモード
(when (autoload-if-found 'yaml-mode "yaml-mode")
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))

;; apples-mode
(when (autoload-if-found 'apples-mode "apples-mode")
  (add-to-list 'auto-mode-alist '("\\.\\(applescri\\|sc\\)pt\\'" . apples-mode)))

;; Nginx-mode
(when (require 'nginx-mode nil t))

;; markdownモード
(when (autoload-if-found 'markdown-mode "markdown-mode")
  (add-hook 'markdown-mode-hook
            '(lambda ()
               (set-face-background 'trailing-whitespace "DarkGreen")
               (electric-indent-local-mode -1)))

  (add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown$" . gfm-mode)))

;; nimモード
(when (autoload-if-found 'nim-mode "nim-mode")
  (add-to-list 'auto-mode-alist '("\\.nim$" . nim-mode)))

;; coffeeモード
(when (autoload-if-found 'coffee-mode "coffee-mode")
  (defun coffee-custom ()
    "coffee-mode-hook"
    (set (make-local-variable 'tab-width) 2)
    (setq coffee-tab-width 2))

  (add-hook 'coffee-mode-hook
            '(lambda() (coffee-custom)))
  (add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode)))

;; tomlモード
(when (autoload-if-found 'toml-mode "toml-mode")
  (add-to-list 'auto-mode-alist '("\\.toml$" . toml-mode)))

;; plantumlモード
(when (autoload-if-found 'plantuml-mode "plantuml-mode")
  (add-to-list 'auto-mode-alist '("\\.puml$" . plantuml-mode)))

;; dash
(when (require 'dash-at-point nil t)
  (global-set-key (kbd "C-c d") 'dash-at-point)
  (global-set-key (kbd "C-c e") 'dash-at-point-with-docset))

(when (require 'visual-regexp-steroids nil t)
  (define-key global-map (kbd "C-c r") 'vr/replace)
  (define-key global-map (kbd "C-c q") 'vr/query-replace)
  ;; to use visual-regexp-steroids's isearch instead of the built-in regexp isearch, also include the following lines:
  (define-key esc-map (kbd "C-r") 'vr/isearch-backward) ;; C-M-r
  (define-key esc-map (kbd "C-s") 'vr/isearch-forward)  ;; C-M-s
  )

;; Markdown
;; npm install -g livedown
(when (require 'livedown nil t)
  (custom-set-variables
   '(livedown:autostart nil) ; automatically open preview when opening markdown files 
   '(livedown:open t)        ; automatically open the browser window
   '(livedown:port 1337))    ; port for livedown server
  )


;; ocamel-mode
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing OCaml code" t)
(autoload 'tuareg-run-ocaml "tuareg" "Run an inferior OCaml process." t)
(autoload 'ocamldebug "ocamldebug" "Run the OCaml debugger" t)

;; makefile-mode-hook
(add-hook 'makefile-mode-hook
          (function
           (lambda ()
             (fset 'makefile-warn-suspicious-lines 'ignore))))

;; lua-mode
(when (require 'lua-mode nil t)
  (autoload 'lua-mode "lua-mode" "Lua editing mode." t)
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
  (add-to-list 'interpreter-mode-alist '("lua" . lua-mode)))

(defun gker-setup-sh-mode ()
  "My own personal preferences for `sh-mode'.

This is a custom function that sets up the parameters I usually
prefer for `sh-mode'.  It is automatically added to
`sh-mode-hook', but is can also be called interactively."
  (interactive)
  (setq sh-basic-offset 2
        sh-indentation 2))
(add-hook 'sh-mode-hook 'gker-setup-sh-mode)

(when (require 'terraform-mode nil t))

;; server start
(when (server-start)
  (defun iconify-emacs-when-server-is-done ()
    (unless 'server-clients (iconify-frame))))
