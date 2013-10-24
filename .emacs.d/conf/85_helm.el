(when (require 'helm-config nil t)

  (when (require 'helm-orgcard nil t))
  (when (require 'helm-migemo nil t))
  (when (require 'helm-ls-git nil t))
  (when (require 'helm-descbinds nil t))

  ;; Enable helm-gtags-mode
  (when (require 'helm-gtags nil t)

    ;; customize
    (setq helm-gtags-path-style 'relative)
    (setq helm-gtags-ignore-case t)
    (setq helm-gtags-read-only t)
    (setq helm-gtags-auto-update t)

    ;; key bindings
    (add-hook 'helm-gtags-mode-hook
              '(lambda ()
                 (local-set-key (kbd "M-.") 'helm-gtags-find-tag)
                 (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
                 (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
                 (local-set-key (kbd "M-g M-p") 'helm-gtags-parse-file)
                 (local-set-key (kbd "M-,") 'helm-gtags-pop-stack)))

    ;; Enable helm-gtags-mode
    (add-hook 'php-mode-hook 'helm-gtags-mode))

  (when (require 'helm-ag nil t)
    (setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
    (setq helm-ag-command-option "--all-text")
    (setq helm-ag-thing-at-point 'symbol)
    (setq helm-ag-source-type 'file-line)
    (global-set-key (kbd "C-c C-s") 'helm-ag))

  ;; 既存コマンドの置き換え
  (helm-mode 1)
  (define-key global-map [remap find-file] 'helm-find-files)
  (define-key global-map [remap occur] 'helm-occur)
  (define-key global-map [remap list-buffers] 'helm-buffers-list)
  (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
  (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point)


  ;; ファイル一覧でパスを表示する
  (setq helm-ff-transformer-show-only-basename nil)

  (defun helm-filelist+ ()
    "Preconfigured `helm' to open files/buffers/bookmarks instantly.
    This is a replacement for `helm-for-files'.
    See `helm-c-filelist-file-name' docstring for usage."
    (interactive)
    (helm-other-buffer
     '(helm-c-source-buffers-list
       helm-c-source-recentf
       helm-c-source-file-cache
       helm-c-source-files-in-current-dir
       helm-source-ctags
       ;;       helm-c-source-git-project-for
       helm-c-source-findutils)
     "*helm file list*"))

  ;; キーバインドの変更
  ;;(global-set-key (kbd "C-:") 'helm-for-files)
  ;;(global-set-key (kbd "M-x") 'helm-command+)
  (global-set-key (kbd "C-:") 'helm-filelist+)
  (global-set-key (kbd "C-;") 'helm-ls-git-ls)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x C-r") 'helm-recentf)
  (global-set-key (kbd "C-M-z") 'helm-resume)
  (global-set-key (kbd "M-?") 'helm-descbinds)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)
  (global-set-key (kbd "M-s") 'helm-occur)
  (global-set-key (kbd "C-<tab>") 'helm-elscreen)

  (eval-after-load "helm"
    '(define-key helm-map (kbd "C-h") 'delete-backward-char))

  (custom-set-faces
   '(helm-candidate-number ((t (:background "wheat4" :foreground "black"))))
   '(helm-selection ((t (:background "gray10" :foreground "gray75" :underline nil))))
   '(helm-source-header ((t (:background "RosyBrown3" :foreground "gray25" :box (:line-width 1 :color "grey75" :style pressed-button) :weight bold :height 1.0 :width expanded :family "Sans Serif"))))
   '(helm-visible-mark ((t (:background "gray10" :foreground "gray86"))))
   '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
   '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

  )
