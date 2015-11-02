;;;; ==========================================================================================================
;;;; Configure cocoa-emacs
;;;; ==========================================================================================================

(setq x-select-enable-clipboard t)

(setq default-input-method "MacOSX")

;; ¥ to \
(define-key global-map [165] [92])

;; When you move the cursor to the mini- buffer , it becomes automatically English mode
(mac-auto-ascii-mode 1)
(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)

;; for RGB
(setq ns-use-srgb-colorspace t)

;; font configure
(when window-system
  (let* (
         (fontset-name "myfonts")
         (size 17)
         (asciifont "Essential PragmataPro for Powerline")
         (jpfont "Migu 2M")
         (font (format "%s-%d:weight=normal:slant=normal" asciifont size))
         (fontspec (font-spec :family asciifont))
         (jp-fontspec (font-spec :family jpfont))
         (fsn (create-fontset-from-ascii-font font nil fontset-name))
         )
    (set-fontset-font fsn 'japanese-jisx0213.2004-1 jp-fontspec)
    (set-fontset-font fsn 'japanese-jisx0213-2 jp-fontspec)
    (set-fontset-font fsn 'katakana-jisx0201 jp-fontspec)
    (set-fontset-font fsn '(#x0080 . #x024F) fontspec)
    (set-fontset-font fsn '(#x0370 . #x03FF) fontspec)
    )

  (add-to-list 'default-frame-alist '(font . "fontset-myfonts"))

  (dolist (elt '(("^-apple-hiragino.*" . 1.2)
                 (".*osaka-bold.*" . 1.2)
                 (".*osaka-medium.*" . 1.2)
                 (".*courier-bold-.*-mac-roman" . 1.0)
                 (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
                 (".*monaco-bold-.*-mac-roman" . 0.9)))
    (add-to-list 'face-font-rescale-alist elt))

  (set-face-font 'default "fontset-myfonts"))


;; If you are using the HFS + to the format of the file system in Mac OS X, the handling of the file name is different from the Windows and Linux.
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

;; Search is skipped in the incremental-search and this is not
(setq search-whitespace-regexp nil)

;; Change the browser chrome
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "open")

;; for ls --dired
(when (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))
