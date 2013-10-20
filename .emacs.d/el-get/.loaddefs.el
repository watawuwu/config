;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (apache-mode) "apache-mode/apache-mode" "apache-mode/apache-mode.el"
;;;;;;  (21091 40198 0 0))
;;; Generated autoloads from apache-mode/apache-mode.el

(autoload 'apache-mode "apache-mode/apache-mode" "\
Major mode for editing Apache configuration files.

\(fn)" t nil)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

;;;***

;;;### (autoloads (confluence-search confluence-get-page) "confluence-el/confluence"
;;;;;;  "confluence-el/confluence.el" (21091 40216 0 0))
;;; Generated autoloads from confluence-el/confluence.el

(autoload 'confluence-get-page "confluence-el/confluence" "\
Loads a confluence page for the given SPACE-NAME and PAGE-NAME
into a buffer (if not already loaded) and switches to it.
Analogous to `find-file'.  Every time you navitage to a page with
this function (or M-. `confluence-get-page-at-point'), it is
saved off into a stack (`confluence-tag-stack') that you can then
pop back out of to return back through your navigation path (with
M-* `confluence-pop-tag-stack').

\(fn &optional PAGE-NAME SPACE-NAME ANCHOR-NAME)" t nil)

(autoload 'confluence-search "confluence-el/confluence" "\
Runs a confluence search for QUERY, optionally restricting the results to
the given SPACE-NAME.

\(fn &optional QUERY SPACE-NAME)" t nil)

;;;***

;;;### (autoloads (cycle-buffer-toggle-interesting cycle-buffer-backward-permissive
;;;;;;  cycle-buffer-permissive cycle-buffer-backward cycle-buffer)
;;;;;;  "cycle-buffer/cycle-buffer" "cycle-buffer/cycle-buffer.el"
;;;;;;  (21091 40231 0 0))
;;; Generated autoloads from cycle-buffer/cycle-buffer.el

(autoload 'cycle-buffer "cycle-buffer/cycle-buffer" "\
Switch to the next buffer on the buffer list without prompting.
Successive invocations select buffers further down on the buffer list.
A prefix argument specifies the DISTANCE to skip, negative moves back.

\(fn &optional DISTANCE PERMISSIVE)" t nil)

(autoload 'cycle-buffer-backward "cycle-buffer/cycle-buffer" "\
Switch to the previous buffer in the buffer list.

\(fn &optional DISTANCE)" t nil)

(autoload 'cycle-buffer-permissive "cycle-buffer/cycle-buffer" "\
Switch to the next buffer, allowing more buffers (*bufname* by default).

\(fn &optional DISTANCE)" t nil)

(autoload 'cycle-buffer-backward-permissive "cycle-buffer/cycle-buffer" "\
Switch to the previous buffer, allowing more buffers (*bufname* by default).

\(fn &optional DISTANCE)" t nil)

(autoload 'cycle-buffer-toggle-interesting "cycle-buffer/cycle-buffer" "\
Toggle the value of cycle-buffer-interesting for the current buffer.
With positive arg set it, with non-positive arg reset it. A buffer is only
considered by cycle-buffer when cycle-buffer-interesting is t.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (el-get-checksum el-get-make-recipes el-get-cd
;;;;;;  el-get-self-update el-get-update-all el-get-version) "el-get/el-get"
;;;;;;  "el-get/el-get.el" (21091 39929 0 0))
;;; Generated autoloads from el-get/el-get.el

(autoload 'el-get-version "el-get/el-get" "\
Message the current el-get version

\(fn)" t nil)

(autoload 'el-get-update-all "el-get/el-get" "\
Performs update of all installed packages.

\(fn &optional NO-PROMPT)" t nil)

(autoload 'el-get-self-update "el-get/el-get" "\
Update el-get itself.  The standard recipe takes care of reloading the code.

\(fn)" t nil)

(autoload 'el-get-cd "el-get/el-get" "\
Open dired in the package directory.

\(fn PACKAGE)" t nil)

(autoload 'el-get-make-recipes "el-get/el-get" "\
Loop over `el-get-sources' and write a recipe file for each
entry which is not a symbol and is not already a known recipe.

\(fn &optional DIR)" t nil)

(autoload 'el-get-checksum "el-get/el-get" "\
Compute the checksum of the given package, and put it in the kill-ring

\(fn PACKAGE &optional PACKAGE-STATUS-ALIST)" t nil)

;;;***

;;;### (autoloads (el-get-list-packages) "el-get/el-get-list-packages"
;;;;;;  "el-get/el-get-list-packages.el" (21091 39929 0 0))
;;; Generated autoloads from el-get/el-get-list-packages.el

(autoload 'el-get-list-packages "el-get/el-get-list-packages" "\
Display a list of packages.

\(fn)" t nil)

;;;***

;;;### (autoloads (php-mode php-extra-constants php) "php-mode/php-mode"
;;;;;;  "php-mode/php-mode.el" (21091 40483 0 0))
;;; Generated autoloads from php-mode/php-mode.el

(let ((loads (get 'php 'custom-loads))) (if (member '"php-mode/php-mode" loads) nil (put 'php 'custom-loads (cons '"php-mode/php-mode" loads))))

(defvar php-extra-constants 'nil "\
A list of additional strings to treat as PHP constants.")

(custom-autoload 'php-extra-constants "php-mode/php-mode" t)

(add-to-list 'interpreter-mode-alist (cons "php" 'php-mode))

(autoload 'php-mode "php-mode/php-mode" "\
Major mode for editing PHP code.

\\{php-mode-map}

\(fn)" t nil)

(dolist (pattern '("\\.php[s345t]?\\'" "\\.phtml\\'" "Amkfile" "\\.amk$")) (add-to-list 'auto-mode-alist `(,pattern . php-mode)))

;;;***

;;;### (autoloads (popwin:messages popwin:find-file-tail popwin:find-file
;;;;;;  popwin:popup-buffer-tail popwin:one-window popwin:universal-display
;;;;;;  popwin:pop-to-buffer popwin:display-buffer popwin:popup-buffer)
;;;;;;  "popwin/popwin" "popwin/popwin.el" (21091 40118 0 0))
;;; Generated autoloads from popwin/popwin.el

(autoload 'popwin:popup-buffer "popwin/popwin" "\
Show BUFFER in a popup window and return the popup window. If
NOSELECT is non-nil, the popup window will not be selected. If
STICK is non-nil, the popup window will be stuck. If TAIL is
non-nil, the popup window will show the last contents. Calling
`popwin:popup-buffer' during `popwin:popup-buffer' is allowed. In
that case, the buffer of the popup window will be replaced with
BUFFER.

\(fn BUFFER &key (width popwin:popup-window-width) (height popwin:popup-window-height) (position popwin:popup-window-position) NOSELECT DEDICATED STICK TAIL)" t nil)

(autoload 'popwin:display-buffer "popwin/popwin" "\
Display BUFFER-OR-NAME, if possible, in a popup window, or as
usual. This function can be used as a value of
`display-buffer-function'.

\(fn BUFFER-OR-NAME &optional NOT-THIS-WINDOW)" t nil)

(autoload 'popwin:pop-to-buffer "popwin/popwin" "\
Same as `pop-to-buffer' except that this function will use
`popwin:display-buffer-1' instead of `display-buffer'.

\(fn BUFFER &optional OTHER-WINDOW NORECORD)" t nil)

(autoload 'popwin:universal-display "popwin/popwin" "\
Call the following command interactively with letting
`popwin:special-display-config' be
`popwin:universal-display-config'. This wil be useful when
displaying buffers in popup windows temporarily.

\(fn)" t nil)

(autoload 'popwin:one-window "popwin/popwin" "\
Delete other window than the popup window. C-g restores the
original window configuration.

\(fn)" t nil)

(autoload 'popwin:popup-buffer-tail "popwin/popwin" "\
Same as `popwin:popup-buffer' except that the buffer will be
`recenter'ed at the bottom.

\(fn &rest SAME-AS-POPWIN:POPUP-BUFFER)" t nil)

(autoload 'popwin:find-file "popwin/popwin" "\
Edit file FILENAME with popup window by `popwin:popup-buffer'.

\(fn FILENAME &optional WILDCARDS)" t nil)

(autoload 'popwin:find-file-tail "popwin/popwin" "\
Edit file FILENAME with popup window by
`popwin:popup-buffer-tail'.

\(fn FILE &optional WILDCARD)" t nil)

(autoload 'popwin:messages "popwin/popwin" "\
Display *Messages* buffer in a popup window.

\(fn)" t nil)

;;;***

;;;### (autoloads (scala-mode) "scala-mode/scala-mode" "scala-mode/scala-mode.el"
;;;;;;  (21091 40252 0 0))
;;; Generated autoloads from scala-mode/scala-mode.el

(autoload 'scala-mode "scala-mode/scala-mode" "\
Major mode for editing Scala code.
When started, run `scala-mode-hook'.
\\{scala-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (scala-quit-interpreter scala-load-file scala-eval-buffer
;;;;;;  scala-eval-definition scala-eval-region scala-switch-to-interpreter
;;;;;;  scala-run-scala scala-interpreter-running-p-1) "scala-mode/scala-mode-inf"
;;;;;;  "scala-mode/scala-mode-inf.el" (21091 40252 0 0))
;;; Generated autoloads from scala-mode/scala-mode-inf.el

(autoload 'scala-interpreter-running-p-1 "scala-mode/scala-mode-inf" "\


\(fn)" nil nil)

(autoload 'scala-run-scala "scala-mode/scala-mode-inf" "\
Run a Scala interpreter in an Emacs buffer

\(fn CMD-LINE)" t nil)

(autoload 'scala-switch-to-interpreter "scala-mode/scala-mode-inf" "\
Switch to buffer containing the interpreter

\(fn)" t nil)

(autoload 'scala-eval-region "scala-mode/scala-mode-inf" "\
Send current region to Scala interpreter.

\(fn START END)" t nil)

(autoload 'scala-eval-definition "scala-mode/scala-mode-inf" "\
Send the current 'definition' to the Scala interpreter.
This function's idea of a definition is the block of text ending
in the current line (or the first non-empty line going
backwards), and begins in the first line that is not empty and
does not start with whitespace or '{'.

For example:

println( \"aja\")
println( \"hola\" )

if the cursor is somewhere in the second print statement, the
interpreter should output 'hola'.

In the following case, if the cursor is in the second line, then
the complete function definition will be send to the interpreter:

def foo =
  1 + 2

\(fn)" t nil)

(autoload 'scala-eval-buffer "scala-mode/scala-mode-inf" "\
Send whole buffer to Scala interpreter.

\(fn)" t nil)

(autoload 'scala-load-file "scala-mode/scala-mode-inf" "\
Load a file in the Scala interpreter.

\(fn FILE-NAME)" t nil)

(autoload 'scala-quit-interpreter "scala-mode/scala-mode-inf" "\
Quit Scala interpreter.

\(fn)" t nil)

;;;***

;;;### (autoloads (smooth-scroll-up smooth-scroll-down smooth-scroll-lines-from-window-bottom
;;;;;;  smooth-scroll-lines-from-window-top smooth-scroll-strict-margins
;;;;;;  smooth-scroll-margin) "smooth-scrolling/smooth-scrolling"
;;;;;;  "smooth-scrolling/smooth-scrolling.el" (21091 40522 0 0))
;;; Generated autoloads from smooth-scrolling/smooth-scrolling.el

(defvar smooth-scroll-margin 10 "\
Number of lines of visible margin at the top and bottom of a window.
If the point is within these margins, then scrolling will occur
smoothly for `previous-line' at the top of the window, and for
`next-line' at the bottom.

This is very similar in its goal to `scroll-margin'.  However, it
is implemented by activating `smooth-scroll-down' and
`smooth-scroll-up' advise via `defadvice' for `previous-line' and
`next-line' respectively.  As a result it avoids problems
afflicting `scroll-margin', such as a sudden jump and unexpected
highlighting of a region when the mouse is clicked in the margin.

Scrolling only occurs when the point is closer to the window
boundary it is heading for (top or bottom) than the middle of the
window.  This is to intelligently handle the case where the
margins cover the whole buffer (e.g. `smooth-scroll-margin' set
to 5 and `window-height' returning 10 or less).

See also `smooth-scroll-strict-margins'.")

(custom-autoload 'smooth-scroll-margin "smooth-scrolling/smooth-scrolling" t)

(defvar smooth-scroll-strict-margins t "\
If true, the advice code supporting `smooth-scroll-margin'
will use `count-screen-lines' to determine the number of
*visible* lines between the point and the window top/bottom,
rather than `count-lines' which obtains the number of actual
newlines.  This is because there might be extra newlines hidden
by a mode such as folding-mode, outline-mode, org-mode etc., or
fewer due to very long lines being displayed wrapped when
`truncate-lines' is nil.

However, using `count-screen-lines' can supposedly cause
performance issues in buffers with extremely long lines.  Setting
`cache-long-line-scans' may be able to address this;
alternatively you can set this variable to nil so that the advice
code uses `count-lines', and put up with the fact that sometimes
the point will be allowed to stray into the margin.")

(custom-autoload 'smooth-scroll-strict-margins "smooth-scrolling/smooth-scrolling" t)

(autoload 'smooth-scroll-lines-from-window-top "smooth-scrolling/smooth-scrolling" "\
Work out, using the function indicated by
`smooth-scroll-strict-margins', what the current screen line is,
relative to the top of the window.  Counting starts with 1 referring
to the top line in the window.

\(fn)" t nil)

(autoload 'smooth-scroll-lines-from-window-bottom "smooth-scrolling/smooth-scrolling" "\
Work out, using the function indicated by
`smooth-scroll-strict-margins', how many screen lines there are
between the point and the bottom of the window.  Counting starts
with 1 referring to the bottom line in the window.

\(fn)" t nil)

(autoload 'smooth-scroll-down "smooth-scrolling/smooth-scrolling" "\
Scroll down smoothly if cursor is within `smooth-scroll-margin'
lines of the top of the window.

\(fn)" nil nil)

(autoload 'smooth-scroll-up "smooth-scrolling/smooth-scrolling" "\
Scroll up smoothly if cursor is within `smooth-scroll-margin'
lines of the bottom of the window.

\(fn)" nil nil)

(defadvice previous-line (after smooth-scroll-down (&optional arg try-vscroll) activate) (smooth-scroll-down))

(defadvice next-line (after smooth-scroll-up (&optional arg try-vscroll) activate) (smooth-scroll-up))

(defadvice isearch-repeat (after isearch-smooth-scroll (direction) activate) (if (eq direction 'forward) (smooth-scroll-up) (smooth-scroll-down)))

(setq scroll-margin 0)

(setq redisplay-dont-pause t)

;;;***

;;;### (autoloads (tree-minor-mode) "tree-mode/tree-mode" "tree-mode/tree-mode.el"
;;;;;;  (21091 40550 0 0))
;;; Generated autoloads from tree-mode/tree-mode.el

(autoload 'tree-minor-mode "tree-mode/tree-mode" "\
More keybindings for tree-widget.

\\{tree-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (global-undo-tree-mode undo-tree-mode) "undo-tree/undo-tree"
;;;;;;  "undo-tree/undo-tree.el" (21091 40574 0 0))
;;; Generated autoloads from undo-tree/undo-tree.el

(autoload 'undo-tree-mode "undo-tree/undo-tree" "\
Toggle undo-tree mode.
With no argument, this command toggles the mode.
A positive prefix argument turns the mode on.
A negative prefix argument turns it off.

Undo-tree-mode replaces Emacs' standard undo feature with a more
powerful yet easier to use version, that treats the undo history
as what it is: a tree.

The following keys are available in `undo-tree-mode':

  \\{undo-tree-map}

Within the undo-tree visualizer, the following keys are available:

  \\{undo-tree-visualizer-mode-map}

\(fn &optional ARG)" t nil)

(defvar global-undo-tree-mode nil "\
Non-nil if Global-Undo-Tree mode is enabled.
See the command `global-undo-tree-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-undo-tree-mode'.")

(custom-autoload 'global-undo-tree-mode "undo-tree/undo-tree" nil)

(autoload 'global-undo-tree-mode "undo-tree/undo-tree" "\
Toggle Undo-Tree mode in all buffers.
With prefix ARG, enable Global-Undo-Tree mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Undo-Tree mode is enabled in all buffers where
`turn-on-undo-tree-mode' would do it.
See `undo-tree-mode' for more information on Undo-Tree mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (yaml-mode yaml) "yaml-mode/yaml-mode" "yaml-mode/yaml-mode.el"
;;;;;;  (21091 40608 0 0))
;;; Generated autoloads from yaml-mode/yaml-mode.el

(let ((loads (get 'yaml 'custom-loads))) (if (member '"yaml-mode/yaml-mode" loads) nil (put 'yaml 'custom-loads (cons '"yaml-mode/yaml-mode" loads))))

(autoload 'yaml-mode "yaml-mode/yaml-mode" "\
Simple mode to edit YAML.

\\{yaml-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))

;;;***

;;;### (autoloads (yas-global-mode yas-minor-mode) "yasnippet/yasnippet"
;;;;;;  "yasnippet/yasnippet.el" (21091 40626 0 0))
;;; Generated autoloads from yasnippet/yasnippet.el

(autoload 'yas-minor-mode "yasnippet/yasnippet" "\
Toggle YASnippet mode.

When YASnippet mode is enabled, `yas-expand', normally bound to
the TAB key, expands snippets of code depending on the major
mode.

With no argument, this command toggles the mode.
positive prefix argument turns on the mode.
Negative prefix argument turns off the mode.

Key bindings:
\\{yas-minor-mode-map}

\(fn &optional ARG)" t nil)

(defvar yas-global-mode nil "\
Non-nil if Yas-Global mode is enabled.
See the command `yas-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `yas-global-mode'.")

(custom-autoload 'yas-global-mode "yasnippet/yasnippet" nil)

(autoload 'yas-global-mode "yasnippet/yasnippet" "\
Toggle Yas minor mode in all buffers.
With prefix ARG, enable Yas-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Yas minor mode is enabled in all buffers where
`yas-minor-mode-on' would do it.
See `yas-minor-mode' for more information on Yas minor mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("confluence-el/confluence-edit.el" "confluence-el/confluence-xml-edit.el"
;;;;;;  "confluence-el/xml-rpc.el" "el-get/el-get-autoloads.el" "el-get/el-get-build.el"
;;;;;;  "el-get/el-get-byte-compile.el" "el-get/el-get-core.el" "el-get/el-get-custom.el"
;;;;;;  "el-get/el-get-dependencies.el" "el-get/el-get-install.el"
;;;;;;  "el-get/el-get-methods.el" "el-get/el-get-notify.el" "el-get/el-get-recipes.el"
;;;;;;  "el-get/el-get-status.el" "ensime/src/main/elisp/auto-complete.el"
;;;;;;  "ensime/src/main/elisp/ensime-auto-complete.el" "ensime/src/main/elisp/ensime-builder.el"
;;;;;;  "ensime/src/main/elisp/ensime-comint-utils.el" "ensime/src/main/elisp/ensime-config.el"
;;;;;;  "ensime/src/main/elisp/ensime-debug.el" "ensime/src/main/elisp/ensime-doc.el"
;;;;;;  "ensime/src/main/elisp/ensime-inf.el" "ensime/src/main/elisp/ensime-refactor.el"
;;;;;;  "ensime/src/main/elisp/ensime-sbt.el" "ensime/src/main/elisp/ensime-scalex.el"
;;;;;;  "ensime/src/main/elisp/ensime-search.el" "ensime/src/main/elisp/ensime-semantic-highlight.el"
;;;;;;  "ensime/src/main/elisp/ensime-test.el" "ensime/src/main/elisp/ensime-ui.el"
;;;;;;  "ensime/src/main/elisp/ensime-undo.el" "ensime/src/main/elisp/ensime.el"
;;;;;;  "ensime/src/main/elisp/fuzzy.el" "ensime/src/main/elisp/popup.el"
;;;;;;  "flyphpcs/flyphpcs.el" "fold-dwim-org/fold-dwim-org.el" "ibus/ibus.el"
;;;;;;  "jira/jira.el" "judge-indent/judge-indent.el" "org-jira/org-jira.el"
;;;;;;  "php-completion/php-completion.el" "php-doc/php-doc.el" "php-mode/php-mode-test.el"
;;;;;;  "redo+/redo+.el" "scala-mode/scala-mode-auto.el" "scala-mode/scala-mode-constants.el"
;;;;;;  "scala-mode/scala-mode-feature-electric.el" "scala-mode/scala-mode-feature-speedbar.el"
;;;;;;  "scala-mode/scala-mode-feature-tags.el" "scala-mode/scala-mode-feature.el"
;;;;;;  "scala-mode/scala-mode-fontlock.el" "scala-mode/scala-mode-indent.el"
;;;;;;  "scala-mode/scala-mode-lib.el" "scala-mode/scala-mode-navigation.el"
;;;;;;  "scala-mode/scala-mode-ui.el" "scala-mode/scala-mode-variables.el"
;;;;;;  "smooth-scroll/smooth-scroll.el" "sticky/sticky.el" "wgrep/wgrep.el"
;;;;;;  "xml-rpc/xml-rpc.el" "yasnippet/yasnippet-debug.el" "yasnippet/yasnippet-tests.el")
;;;;;;  (21091 40626 624103 0))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
