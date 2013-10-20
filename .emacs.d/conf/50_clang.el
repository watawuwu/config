;;;; ==========================================================================================================
;;;; c-mode cc-mode objc-mode
;;;; ==========================================================================================================

;; (add-hook 'c-mode-common-hook
;;       '(lambda()
;;          (local-unset-key "#")
;;          (local-unset-key "(")
;;          (local-unset-key ")")
;;          (local-unset-key "*")
;;          (local-unset-key ",")
;;          (local-unset-key "/")
;;          (local-unset-key ":")
;;          (local-unset-key "<")
;;          (local-unset-key ">")
;;          (local-unset-key "{")
;;          (local-unset-key "}")
;;          (local-unset-key ";")
;;          (local-set-key "\t" '(lambda() (interactive)(insert "\t")))  ;; just a tab
;;          (setq tab-width 4)  ;; show a tab with 4 char width
;;          ;;(local-set-key "\t" '(lambda() (interactive)(insert "    ")))  ;; a 4 space tab if you like
;;          (local-set-key "\d" 'delete-backward-char)  ;; the normal backspace
;;          ))

;; (add-hook 'c-mode-hook
;;           '(lambda ()
;;              (c-toggle-electric-state -1)))

;; C-c c で compile コマンドを呼び出す
(define-key mode-specific-map "c" 'compile)
;;(load "c-eldoc")
(setq c-eldoc-cpp-command "/usr/bin/cpp ")
(setq c-eldoc-includes "`pkg-config gtk+-2.0 --cflags` -I./ -I../ ")
(load "c-eldoc")
;; C設定
(add-hook 'c-mode-common-hook
          '(lambda ()
             (c-set-style "ellemtel")
             (setq tab-width 4)
             (setq c-basic-offset tab-width)
             (c-toggle-hungry-state 1)
             ;; センテンスの終了である ';' を入力したら、自動改行+インデント
;;             (c-toggle-auto-hungry-state 1)
             (set (make-local-variable 'eldoc-idle-delay) 0.20)
             ;; gtagsの設定
             (gtags-mode 1)
             (gtags-make-complete-list)
             (c-turn-on-eldoc-mode)
             )
          )



;; Objective-cの設定
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@implementation" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@interface" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@protocol" . objc-mode))

;; 探すパスは ffap-c-path で設定する
;; (setq ffap-c-path
;;     '("/usr/include" "/usr/local/include"))
;; 新規ファイルの場合には確認する
;;(setq ffap-newfile-prompt t)
;; ffap-kpathsea-expand-path で展開するパスの深さ
(setq ffap-kpathsea-depth 5)

(setq ff-other-file-alist
     '(("\\.mm?$" (".h"))
       ("\\.cc$"  (".hh" ".h"))
       ("\\.hh$"  (".cc" ".C"))

       ("\\.c$"   (".h"))
       ("\\.h$"   (".c" ".cc" ".C" ".CC" ".cxx" ".cpp" ".m" ".mm"))

       ("\\.C$"   (".H"  ".hh" ".h"))
       ("\\.H$"   (".C"  ".CC"))

       ("\\.CC$"  (".HH" ".H"  ".hh" ".h"))
       ("\\.HH$"  (".CC"))

       ("\\.cxx$" (".hh" ".h"))
       ("\\.cpp$" (".hpp" ".hh" ".h"))

       ("\\.hpp$" (".cpp" ".c"))))
(add-hook 'objc-mode-hook
          (lambda ()
           (define-key c-mode-base-map (kbd "C-c o") 'ff-find-other-file)
           ;; 拡張子 m と h に対して flymake を有効にする設定 flymake-mode t の前に書く必要があります
           (push '("\\.m$" flymake-objc-init) flymake-allowed-file-name-masks)
           (push '("\\.h$" flymake-objc-init) flymake-allowed-file-name-masks)
           ;; 存在するファイルかつ書き込み可能ファイル時のみ flymake-mode を有効にします
           (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
               (flymake-mode t))
           ))
