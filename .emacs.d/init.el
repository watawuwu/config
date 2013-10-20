;;;; ==========================================================================================================
;;;; load-pathの設定
;;;; ==========================================================================================================

;; コンパイル時の警告の抑制
(setq byte-compile-warnings
      '(free-vars unresolved callargs redefine obsolete noruntime
                  cl-functions interactive-only make-local))

;; 23以前はディレクトを設定。
(when (> emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d"))

;; 対象ディレクトリを再帰的にload-pathを追加する関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; ロードパスの設定
(add-to-load-path "elisp" "el-get" "private")

;; 結局きかねー
;; (when (require 'shellenv nil t)
;;   (custom-set-variables
;;    '(shellenv/shell 'bash))
;;   (shellenv/setpath))

;;;; ==========================================================================================================
;;;; 環境ごとに設定読込
;;;; ==========================================================================================================

(when (require 'init-loader nil t)
  ;; 読込先ディレクトリ
  (init-loader-load "~/.emacs.d/conf"))
