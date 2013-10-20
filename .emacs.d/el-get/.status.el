((apache-mode status "installed" recipe
              (:name apache-mode :description "Major mode for editing Apache configuration files" :type github :pkgname "emacsmirror/apache-mode"))
 (confluence-el status "installed" recipe
                (:name confluence-el :type svn :website "http://code.google.com/p/confluence-el" :description "Atlassian has a wiki called Confluence. This extension allows you to interact with Confluence from Emacs." :url "http://confluence-el.googlecode.com/svn/trunk/" :autoloads t))
 (cycle-buffer status "installed" recipe
               (:name cycle-buffer :auto-generated t :type emacswiki :description "select buffer by cycling through" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/cycle-buffer.el"))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "4.stable" :pkgname "dimitri/el-get" :features el-get :info "." :load "el-get.el"))
 (ensime status "installed" recipe
         (:name ensime :description "ENhanced Scala Interaction Mode for Emacs" :type github :pkgname "aemoncannon/ensime" :build
                ("sbt update stage")
                :depends scala-mode :features ensime :load-path
                ("./src/main/elisp")
                :post-init
                (progn
                  (require 'ensime)
                  (require 'scala-mode-auto)
                  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook))))
 (flyphpcs status "installed" recipe
           (:name flyphpcs :auto-generated t :type emacswiki :description "Flymake for PHP via PHP-CodeSniffer" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/flyphpcs.el"))
 (fold-dwim-org status "installed" recipe
                (:name fold-dwim-org :auto-generated t :type emacswiki :description "Fold DWIM bound to org key-strokes." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/fold-dwim-org.el"))
 (ibus status "installed" recipe
       (:name ibus :description "IBus client for GNU Emacs" :website "https://launchpad.net/ibus.el" :type http-tar :options
              ("xzf")
              :url "http://launchpad.net/ibus.el/0.3/0.3.2/+download/ibus-el-0.3.2.tar.gz" :post-init
              (add-hook 'after-init-hook 'ibus-mode-on)
              :features "ibus"))
 (jira status "installed" recipe
       (:name jira :auto-generated t :type emacswiki :description "Connect to JIRA issue tracking software" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/jira.el"))
 (judge-indent status "installed" recipe
               (:name judge-indent :auto-generated t :type emacswiki :description "judge indent and tab widths" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/judge-indent.el"))
 (magit status "required" recipe nil)
 (org-jira status "installed" recipe
           (:name org-jira :auto-generated t :type emacswiki :description "add a jira:ticket protocol to org." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/org-jira.el"))
 (php-completion status "installed" recipe
                 (:name php-completion :auto-generated t :type emacswiki :description "complete everything PHP with Anything.el" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/php-completion.el"))
 (php-doc status "installed" recipe
          (:name php-doc :auto-generated t :type emacswiki :description "Php document helper" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/php-doc.el"))
 (php-mode status "installed" recipe
           (:name php-mode :description "A PHP mode for GNU Emacs " :type github :pkgname ejmr/php-mode :website "https://github.com/ejmr/php-mode"))
 (popwin status "installed" recipe
         (:name popwin :description "Popup Window Manager." :website "https://github.com/m2ym/popwin-el" :type github :pkgname "m2ym/popwin-el"))
 (redo+ status "installed" recipe
        (:name redo+ :auto-generated t :type emacswiki :description "Redo/undo system for Emacs" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/redo+.el"))
 (scala-mode status "installed" recipe
             (:name scala-mode :description "Major mode for editing Scala code." :type svn :url "http://lampsvn.epfl.ch/svn-repos/scala/scala-tool-support/trunk/src/emacs/" :build
                    ("make")
                    :load-path
                    (".")
                    :features scala-mode-auto))
 (smooth-scroll status "installed" recipe
                (:name smooth-scroll :description "Minor mode for smooth scrolling." :type emacswiki :features smooth-scroll))
 (smooth-scrolling status "installed" recipe
                   (:name smooth-scrolling :description "Make emacs scroll smoothly, keeping the point away from the top and bottom of the current buffer's window in order to keep lines of context around the point visible as much as possible, whilst avoiding sudden scroll jumps which are visually confusing." :type http :url "http://adamspiers.org/computing/elisp/smooth-scrolling.el" :features smooth-scrolling))
 (sticky status "installed" recipe
         (:name sticky :auto-generated t :type emacswiki :description "Sticky key for capital letters" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/sticky.el"))
 (tree-mode status "installed" recipe
            (:name tree-mode :auto-generated t :type emacswiki :description "A mode to manage tree widgets" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/tree-mode.el"))
 (undo-tree status "installed" recipe
            (:name undo-tree :description "Treat undo history as a tree" :type git :url "http://www.dr-qubit.org/git/undo-tree.git" :prepare
                   (progn
                     (autoload 'undo-tree-mode "undo-tree.el" "Undo tree mode; see undo-tree.el for details" t)
                     (autoload 'global-undo-tree-mode "undo-tree.el" "Global undo tree mode" t))))
 (wgrep status "installed" recipe
        (:name wgrep :auto-generated t :type emacswiki :description "Writable grep buffer and apply the changes to files" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/wgrep.el"))
 (xml-rpc status "installed" recipe
          (:name xml-rpc :auto-generated t :type emacswiki :description "An elisp implementation of clientside XML-RPC" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/xml-rpc.el"))
 (yaml-mode status "installed" recipe
            (:name yaml-mode :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode" :prepare
                   (progn
                     (autoload 'yaml-mode "yaml-mode" nil t)
                     (add-to-list 'auto-mode-alist
                                  '("\\.ya?ml\\'" . yaml-mode)))))
 (yasnippet status "installed" recipe
            (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :features "yasnippet" :pre-init
                   (unless
                       (or
                        (boundp 'yas/snippet-dirs)
                        (get 'yas/snippet-dirs 'customized-value))
                     (setq yas/snippet-dirs
                           (list
                            (concat el-get-dir
                                    (file-name-as-directory "yasnippet")
                                    "snippets"))))
                   :post-init
                   (put 'yas/snippet-dirs 'standard-value
                        (list
                         (list 'quote
                               (list
                                (concat el-get-dir
                                        (file-name-as-directory "yasnippet")
                                        "snippets")))))
                   :compile nil :submodule nil)))
