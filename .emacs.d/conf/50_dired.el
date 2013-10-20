;;;; ==========================================================================================================
;;;; dired-mode
;;;; ==========================================================================================================

;;; diredを便利にする
(when (require 'dired-x nil t))

(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; diredでフラグが付けられたファイルを拡張子に関連付けられたアプリケーションを開く
(defun dired-open-files ()
  "Open files using Mac OS X open command or Linux xdg-open command"
  (interactive)
  (dolist (file-name (dired-get-marked-files t current-prefix-arg))
    (if (file-exists-p file-name)
        (cond ((eq system-type 'darwin)
               (call-process "/usr/bin/open" nil 0 nil file-name))
              ((eq system-type 'gnu/linux)
               (call-process "/usr/bin/xdg-open" nil 0 nil file-name))))))

;; diredでカーソル下のファイルを拡張子に関連付けられたアプリケーションを開く
(defun dired-open-file ()
  "Open files using Mac OS X open command or Linux xdg-open command"
  (interactive)
  (let ((file-name (dired-get-file-for-visit)))
    (if (file-exists-p file-name)
        (cond ((eq system-type 'darwin)
               (call-process "/usr/bin/open" nil 0 nil file-name))
              ((eq system-type 'gnu/linux)
               (call-process "/usr/bin/xdg-open" nil 0 nil file-name))))))

;; diredのキーバインド
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "o") 'dired-open-file)
            (define-key dired-mode-map (kbd "C-c o") 'dired-open-files)
            (define-key dired-mode-map (kbd "C-t c") 'elscreen-create)
            ))

;; diredの表示設定
(setq dired-listing-switches "-aogh")

;; anything in dired
(defun my/anything-dired ()
  (interactive)
  (let ((curbuf (current-buffer)))
    (if (anything-other-buffer
         '(anything-c-source-files-in-current-dir+)
         " *anything-dired*")
        (kill-buffer curbuf))))
(define-key dired-mode-map (kbd "p") 'my/anything-dired)

; フォルダ移動時にバッファを生成しない
(defun my/dired-advertised-find-file ()
  (interactive)
  (let ((kill-target (current-buffer))
        (check-file (dired-get-filename)))
    (funcall 'dired-find-file)
    (if (file-directory-p check-file)
        (kill-buffer kill-target))))

(defun my/dired-up-directory (&optional other-window)
  "Run dired on parent directory of current directory.
Find the parent directory either in this buffer or another buffer.
Creates a buffer if necessary."
  (interactive "P")
  (let* ((dir (dired-current-directory))
         (up (file-name-directory (directory-file-name dir))))
    (or (dired-goto-file (directory-file-name dir))
        ;; Only try dired-goto-subdir if buffer has more than one dir.
        (and (cdr dired-subdir-alist)
             (dired-goto-subdir up))
        (progn
          (if other-window
              (dired-other-window up)
            (progn
              (kill-buffer (current-buffer))
              (dired up))
            (dired-goto-file dir))))))

(define-key dired-mode-map "\C-m" 'my/dired-advertised-find-file)
(define-key dired-mode-map "\C-h" 'my/dired-up-directory)

;;ファイル作成
(defun my/dired-create-file (file-name)
  (interactive "F Create file: ")
  (write-region "" nil file-name nil nil nil)
  (revert-buffer nil)
  (find-file file-name))
(define-key dired-mode-map "\C-i" 'my/dired-create-file)


