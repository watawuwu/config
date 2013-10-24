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

;; Setting does not become effective
;; (when (require 'shellenv nil t)
;;   (custom-set-variables
;;    '(shellenv/shell 'bash))
;;   (shellenv/setpath))


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
        'apel
        'apache-mode
        'apples-mode
        'auto-async-byte-compile
        'auto-complete
        'auto-highlight-symbol
        'auto-save-buffers-enhanced
        'c-eldoc
        'cl-lib
        'color-moccur
        'confluence-el
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
        'jira
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
        'markdown-mode)

;;;; ==========================================================================================================
;;;; other settings
;;;; ==========================================================================================================

(when (require 'init-loader nil t)
  ;; reading setting
  (init-loader-load "~/.emacs.d/conf"))
