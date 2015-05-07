;;;; ==========================================================================================================
;;;; initialization
;;;; ==========================================================================================================



;; Warning restraint at the time of the compilation.
(setq byte-compile-warnings
      '(free-vars unresolved callargs redefine obsolete noruntime
                  cl-functions interactive-only make-local))

;; Before 23 version change the directory setting.
(when (> emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d"))

;; After 24 version removed in emacs 24.4, add it for now
;; bytecompileするとエラーになる
(defun ad-advised-definition-p (definition)
  "Return non-nil if DEFINITION was generated from advice information."
  (if (or (ad-lambda-p definition)
          (macrop definition)
          (ad-compiled-p definition))
      (let ((docstring (ad-docstring definition)))
        (and (stringp docstring)
             (get-text-property 0 'dynamic-docstring-function docstring)))))

(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.
   This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

;; elとelcの2つがあった場合、新しい方を読み込んでくれる
(setq load-prefer-newer t)

;;;; ==========================================================================================================
;;;; load-path
;;;; ==========================================================================================================
;; add load-path with a target directory recursively
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; add load-path directory
(add-to-load-path "el-get")
(add-to-load-path "ensime_2.10.0-0.9.8.9")

;;;; ==========================================================================================================
;;;; el-get
;;;; ==========================================================================================================

;; el-get directory
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
;; my recipes directory
(add-to-list 'el-get-recipe-path (concat user-emacs-directory "recipes"))

(el-get 'sync
        'cl-lib
        'apel
        'apache-mode
        'apples-mode
        'auto-async-byte-compile
        'auto-complete
        'auto-highlight-symbol
        'auto-save-buffers-enhanced
        'c-eldoc
        'color-moccur
        'confluence
        'ctags
        'cycle-buffer
        'css-mode
        'emacs-w3m
        'ensime
        'expand-region
        'flex-autopair
        'flyphpcs
        'fold-dwim-org
        'fold-dwim
        'fuzzy
        'goto-chg
        'helm
        'helm-ag
        'helm-descbinds
        'gtags
        'helm-gtags
        'helm-migemo
        'helm-ls-git
        'helm-orgcard
        'html-helper-mode
        'ibus
        'init-loader
        'js2-mode
        'judge-indent
        'lispxmp
        'magit
        'moccur-edit
        'open-junk-file
        'org-html5presentation
        'org-jira
        'org-mode
        'package
        'paredit
        'php-completion
        'php-doc
        'php-mode
        'perl-completion
        'pod-mode
        'point-undo
        'popup
        'popwin
        'powerline
        'recentf-ext
        'redo+
        'scala-mode
        'scala-mode2
        'sequential-command-config
        'shell-history
        'simplenote
        'smooth-scroll
        'smooth-scrolling
        'sr-speedbar
        'sticky
        'sudo-ext
        'summarye
        'tree-mode
        'undo-tree
        'undohist
        'wgrep
        'xml-rpc
        'yaml-mode
        'yasnippet
        'sequential-command
        'migemo
        'eldoc-extension
        'pod-mode
        'remember
        'elscreen
        'markdown-mode
        'ruby-mode
        'ruby-electric
        'ruby-block
        'web-mode
        'foreign-regexp
        'nginx-mode
        'pandoc-mode
        'nim-mode
        'rust-mode
        'dockerfile-mode
        'coffee-mode
        'haskell-mode)

;;;; ==========================================================================================================
;;;; other settings
;;;; ==========================================================================================================

(when (require 'init-loader nil t)
  ;; reading setting
  (init-loader-load "~/.emacs.d/conf"))
