;;;; ==========================================================================================================
;;;; org-mode
;;;; ==========================================================================================================


;; 見出しのキーバインド設定
(when (require 'org)

  (defun org-insert-example-block ()
    (interactive)
    (org-indent-line)
    (insert "#+BEGIN_SRC ")
    (save-excursion
      (org-return)
      (insert "#+END_SRC")
      (org-indent-line)))

  ;; exampleテンプレを挿入
  (define-key org-mode-map (kbd "C-c e") 'org-insert-example-block)

  (defun org-insert-upheading (arg)
    "1レベル上の見出しを入力する。"
    (interactive "P")
    (org-insert-heading-dwin arg)
    (cond ((org-on-heading-p) (org-do-promote))
          ((org-at-item-p) (org-indent-item -1))))

  (defun org-insert-heading-dwin (arg)
    "現在と同じレベルの見出しを入力する。
    C-uをつけると1レベル上、C-u C-uをつけると1レベル下の見出しを入力する"
    (interactive "p")

    (case arg
      (4  (org-insert-subheading nil))
      (16 (org-insert-upheading nil))
      (t  (org-insert-heading nil))))

  ;;(define-key org-mode-map (kbd "C-m") 'org-return-indent)
  (define-key org-mode-map (kbd "C-m") 'org-insert-heading-dwin)
  (define-key org-mode-map (kbd "C-j") 'org-return)

  ;; (define-key org-mode-map (kbd "C-,") (lambda () (interactive) (my-operate-buffer 1)))

  ;; メモを格納するorgファイルの設定
  (setq org-directory "~/dropbox/memo")
  (setq org-default-notes-file (expand-file-name "misc.org" org-directory))

  ;; 予定表に使うorgファイルのリスト
  (setq org-agenda-files (list org-directory))
  (global-set-key (kbd "C-c a") 'org-agenda)


  ;; テンプレートの設定
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "todo.org" "Tasks")
           "* TODO %?\n %i\n %a")
          ("c" "Misc" entry (file+datetree "misc.org")
           "* %?\nEntered on %U\n %i\n %a")))

  ;; テンプレートの選択
  (setq org-use-fast-todo-selection t)
  (setq org-todo-keywords
        '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "CONFIRM(m)"  "|" "DONE(x)" "CANCEL(c)")
          (sequence "APPT(a)" "|" "DONE(x)" "CANCEL(c)")))

  ;; 予定表に使うorgファイルのリスト
  (setq org-agenda-files (list org-directory))

  ;; 表作成をorg-mode以外で使用する
  (add-hook 'text-mode 'turn-on-orgtbl)

  ;; @todo あとでフックをまとめる
  (add-hook 'org-mode-hook
            (lambda ()
              ;; ここに設定を追加していく
              (setq tab-width 2)
              (setq c-basic-offset 2)
              (setq org-edit-src-content-indentation 2)
              ;;              (org-indent-mode nil)
              ))

  ;; yasnippetが優先されるように変換ｐ
  (add-hook 'org-mode-hook
            (let ((original-command (lookup-key org-mode-map [tab])))
              `(lambda ()
                 (setq yas/fallback-behavior
                       '(apply ,original-command))

                 (local-set-key [tab] 'yas/expand))))

  ;; html変換時にアンパサンドを正しく変換
  (add-hook 'org-export-html-final-hook
            '(lambda () (perform-replace "@&#x40;&amp;" "&" nil nil nil)))

  ;; HTML5で出力
  (require 'org-html5presentation nil t)


  ;; 別のファイルにメモを取る
  (defvar org-new-file-name nil)

  (defun org-new-file-get-name ()
    (set (make-local-variable 'org-new-file-name)
         (read-string "New file name: "
                      (or org-new-file-name
                          (file-name-nondirectory
                           (buffer-file-name))))))

  (defun org-remember-new-file ()
    (interactive)
    (let* ((prefix (org-new-file-get-name))
           (org-capture-templates
            `(("New file" ?n "* %(identity prefix)%?\n   \n   %a\n   %t"
               ,(concat org-new-file-name ".el")  nil))))
      (org-capture)))
  )
