(defun window-toggle-division ()
  "ウィンドウ 2 分割時に、縦分割<->横分割"
  (interactive)
  (unless (= (count-windows 1) 2)
    (error "ウィンドウが 2 分割されていません。"))
  (let (before-height (other-buf (window-buffer (next-window))))
    (setq before-height (window-height))
    (delete-other-windows)

    (if (= (window-height) before-height)
        (split-window-vertically)
      (split-window-horizontally)
      )

    (switch-to-buffer-other-window other-buf)
    (other-window -1)))


(defun all-revert-buffer ()
  (interactive)
  (dolist (buf (buffer-list))
    (if (not (buffer-file-name buf))    ;visitしているfileに限定
        nil
      (switch-to-buffer buf)
      (revert-buffer t t))))


;;elisp触ってるとchompが欲しいけど無い、みたいな状況に出会います。
;;そこで以下の関数をユーティリティとして定義しておくと良いと思います。
;;今回の手直しではこれを使ってるので、適当にどこかで定義しておいてください。
(defun chomp (str)
  (replace-regexp-in-string "[\n\r]+$" "" str))

;; 現在のバッファでアクティブなマイナーモードを表示
(defun which-active-modes ()
  "Give a message of which minor modes are enabled in the current buffer."
  (interactiveq)
  (let ((active-modes))
    (mapc (lambda (mode) (condition-case nil
                             (if (and (symbolp mode) (symbol-value mode))
                                 (add-to-list 'active-modes mode))
                           (error nil) ))
          minor-mode-list)
    (message "Active modes are %s" active-modes)))

;; ロードしていたら実行
(defun eval-after-autoload-if-found (functions file &optional docstring interactive type after-body)
  "Set up autoload and eval-after-load for FUNCTIONS iff. FILE has found."
  (when (locate-library file)
    (mapc (lambda (func)
            (autoload func file docstring interactive type))
          (if (listp functions)
              functions
            (list functions)))
    (when after-body
      (eval-after-load file `(progn ,@after-body)))
    t))
