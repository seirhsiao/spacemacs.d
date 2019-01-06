
;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
    ;; Base distribution to use. This is a layer contained in the directory
    ;; `+distribution'. For now available distributions are `spacemacs-base'
    ;; or `spacemacs'. (default 'spacemacs)
    dotspacemacs-distribution 'spacemacs

    ;; Lazy installation of layers (i.e. layers are installed only when a file
    ;; with a supported type is opened). Possible values are `all', `unused'
    ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
    ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
    ;; lazy install any layer that support lazy installation even the layers
    ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
    ;; installation feature and you have to explicitly list a layer in the
    ;; variable `dotspacemacs-configuration-layers' to install it.
    ;; (default 'unused)
    dotspacemacs-enable-lazy-installation 'unused

    ;; If non-nil then Spacemacs will ask for confirmation before installing
    ;; a layer lazily. (default t)
    dotspacemacs-ask-for-lazy-installation t

    ;; If non-nil layers with lazy install support are lazy installed.
    ;; List of additional paths where to look for configuration layers.
    ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
    dotspacemacs-configuration-layer-path '() ;;'("~/.spacemacs.d/layers/")

    ;; List of configuration layers to load.
    dotspacemacs-configuration-layers
    '(
       ;; ----------------------------------------------------------------
       ;; Example of useful layers you may want to use right away.
       ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
       ;; `M-m f e R' (Emacs style) to install them.
       ;; ----------------------------------------------------------------

       ;; ------------------------ Completion ----------------------------
       ;; (helm :variables
       ;;       helm-enable-auto-resize t
       ;;       helm-no-header t
       ;;       helm-position 'top  ; top, bottom, left, right
       ;;       helm-use-fuzzy 'source
       ;;       spacemacs-helm-rg-max-column-number 1024
       ;;       helm-use-frame-when-more-than-two-windows nil)
       helm
       ;; auto-completion
       ;; Add tool tips to show doc string of functions
       ;; Show snippets in the autocompletion popup
       ;; Show suggestions by most commonly used
       ;; To have auto-completion on as soon as you start typing
       ;; (auto-completion :variables auto-completion-idle-delay nil)

       (auto-completion :variables
         auto-completion-return-key-behavior 'complete
         auto-completion-tab-key-behavior 'cycle
         auto-completion-complete-with-key-sequence nil
         auto-completion-complete-with-key-sequence-delay 0.1
         auto-completion-enable-help-tooltip t
         auto-completion-enable-sort-by-usage t
         auto-completion-show-snippets-in-popup t
         auto-completion-idle-delay 0.2
         auto-completion-private-snippets-directory "~/.spacemacs.d/snippets"
         :disabled-for org markdown git)
       ;;auto-completion-private-snippets-directory '("~/.snippets"
       ;;                                            "~/.spacemacs.d/snippets/snippets/external"
       ;;                                            "~/.spacemacs.d/snippets/snippets/personal")
       ;; ------------------------ Emacs -------- ------------------------
       ;;better-defaults
       (better-defaults :variables
         better-defaults-move-to-end-of-code-first t
         better-defaults-move-to-beginning-of-code-first t)

       ;; a filterable list of possible commands in the minibuffer
       ;; http://www.emacswiki.org/emacs/Smex
       smex
       ;;semantic
       ;;ibuffer
       ;;(ibuffer :variables
       ;; ibuffer-group-buffers-by 'projects)
       ;;org
       ;; Nyan cat tells you where you are in your file
       (colors :variables
         colors-enable-nyan-cat-progress-bar t)

       ;; brew install coreutils
       ;;(osx :variables
       ;; osx-use-option-as-meta nil
       ;; osx-dictionary-dictionary-choice "English"
       ;; osx-use-dictionary-app nil)
       ;; ------------------------ Source control ------------------------

       ;; Open Magit git client full screen (quit restores previous layout)
       ;; Add github support (using magithub)
       ;; Highlight working copy changes
       (git :variables
         git-magit-status-fullscreen t
         git-enable-github-support t
         git-gutter-use-fringe t
         magit-push-always-verify nil
         ;;magit-repository-directories '(("~/work/git/" . 2))
         magit-save-repository-buffers 'dontask
         magit-revert-buffers 'silent
         magit-refs-show-commit-count 'all
         magit-revision-show-gravatars nil)
       ;;github
       (version-control :variables
         version-control-diff-tool 'diff-hl
         version-control-global-margin t)

       ;; ------------------------- Face  ---------------------------------
       neotree
       (spacemacs-layouts :variables
         layouts-enable-autosave t
         layouts-autosave-delay 300)

       (shell :variables
         ;; shell-default-shell 'eshell
         shell-default-shell 'multi-term
         shell-default-height 30
         shell-default-position 'bottom
         shell-default-term-shell "/bin/zsh")
       ;; ------------------------- Checkers ---------------------------------
       (spell-checking :variables
         spell-checking-enable-by-default nil
         spell-checking-enable-auto-dictionary t
         enable-flyspell-auto-completion t)
       (syntax-checking :variables
         syntax-checking-enable-by-default t
         syntax-checking-enable-tooltips nil
         syntax-checking-use-original-bitmaps t)

       ;; ------------------------- Tools ---------------------------------


       ;; Add the Joker linter for real-time linting in Clojure
       ;; Requires local install of Joker tool
       ;; clojure-lint

       ;; Show commands as you type in a separate buffer
       command-log
       ;; mu4e
       ;; brew install mu --with-emacs
       ;; (mu4e :variables
       ;;              mu4e-installation-path "/usr/share/emacs/site-lisp")

       ;; ------------------------ Documents ------------------------------
       markdown
       ;; npm install -g vmd
       ;; (markdown :variables markdown-live-preview-engine 'vmd)
       (org :variables
         org-enable-github-support t
         org-enable-reveal-js-support t
         org-enable-org-journal-support t
         org-enable-hugo-support t
         org-projectile-file "~/work/TODOs.org"
         org-startup-folded nil
         org-want-todo-bindings t
         org-enable-bootstrap-support t)
       ;;(latex :variables
       ;;  latex-build-command "LaTeX" ;; ;; latexmk -pdf --synctex=1 -interaction=nonstopmode  -file-line-error  filename.tex
       ;;  latex-build-command "xelatex"
       ;;  latex-enable-auto-fill nil
       ;;  latex-enable-folding t

       ;; ------------------------ Languages ------------------------------
       ;; https://github.com/twocucao/spacemacs.d/blob/master/init.el
       (chinese
         :packages youdao-dictionary fcitx
         :variables
         chinese-enable-youdao-dict t
         chinese-enable-avy-pinyin nil
         chinese-enable-fcitx t
         chinese-pyim t
         chinese-default-input-method 'pinyin
         )

       ;; -------------------- Programming and markup languages -----------
       ;; For Spacemacs configuration files and packages
       emacs-lisp
       ;;common-lisp
       java
       (json :variables json-fmt-tool 'prettier)
       (javascript :variables
         node-add-modules-path t
         javascript-fmt-tool 'prettier
         javascript-backend 'tide ;;'lsp
         js2-basic-offset 2     ;; javascript indent
         js-indent-level  2     ;; json indent
         javascript-disable-tern-port-files t
         )
       (html :variables
         web-fmt-tool 'prettier
         css-indent-offset 2
         web-mode-markup-indent-offset 2 ;; web-mode, html tag in html file
         web-mode-css-indent-offset    2 ;; web-mode, css in html file
         web-mode-code-indent-offset   2 ;; web-mode, js code in html file
         web-mode-attr-indent-offset   2 ;; web-mode
         web-mode-sql-indent-offset    2 ;; web-mode
         web-mode-attr-value-indent-offset 2
         )
       sql
       yaml
       shell-scripts

      ;;(restclient :variables
      ;;          restclient-use-org t)

       ;; Enable clj-refactor tools
       ;;(clojure :variables
       ;;  clojure-enable-clj-refactor t)
       ;; To add the sayid debugger, include the following as a variable above
       ;; clojure-enable-sayid t
       (clojure :variables
         clojure-enable-fancify-symbols t
         clojure-enable-sayid t
         ;;clojure-indent-style :align-arguments
         clojure-align-forms-automatically t
         cider-dynamic-indentation t
         cider-overlays-use-font-lock nil
         cider-repl-use-clojure-font-lock t
         cider-font-lock-dynamically t
         ;;cider-font-lock-dynamically '(macro core function var)
         cider-font-lock-reader-conditionals t
         cider-auto-mode nil
         cider-repl-display-in-current-window nil
         nrepl-log-messages t
         cider-save-file-on-load t
         nrepl-hide-special-buffers nil
         cider-prefer-local-resources nil
         cider-prompt-for-symbol nil
         ;;cider-jack-in-dependencies t
         ;;cider-jack-in-lein-plugins t
         ;;cider-jack-in-nrepl-middlewares t
         ;;cider-jack-in-dependencies-exclusions t
         ;;cider-inject-dependencies-at-jack-in t
         ;;cider-jack-in-auto-inject-clojure t
         ;;cljr-inject-dependencies-at-jack-in nil
         ;;cider-special-mode-truncate-lines nil
         ;;cider-eldoc-display-for-symbol-at-point nil
         ;;eldoc-echo-area-use-multiline-p nil
         ;;cider-eldoc-display-context-dependent-info nil
         ;;cider-jdk-src-paths '("~/java/clojure-1.8.0-sources"
         ;;                   "~/java/openjvm-8-src")
         cider-eval-result-prefix ";; => "
         cider-comment-prefix  " \n;; => "
         clojure-align-binding-forms '("binding" "loop" "doseq" "for" "with-open" "with-local-vars" "with-redefs")
         clojure-enable-clj-refactor t)

       ;;(python :variables
       ;; python-indent-offset 4
       ;; python-backend 'lsp
       ;; python-sort-imports-on-save t
       ;; python-test-runner '(nose pytest)
       ;; python-enable-yapf-format-on-save t
       ;; python-fill-column 80
       ;; python-auto-set-local-pyenv-version 'on-visit
       ;; python-auto-set-local-pyvenv-virtualenv 'on-visit
       ;; )

       ;;(go :variables
       ;;   go-tab-width 2
       ;;   go-backend 'lsp
       ;;   go-use-gometalinter t
       ;;   go-use-golangci-lint t
       ;;   go-format-before-save t
       ;;   gofmt-command "goimports"
       ;;   go-use-gocheck-for-testing t
       ;;   go-use-test-args "-race -timeout 10s"
       ;;   godoc-at-point-function 'godoc-gogetdoc)

       ;; (haskell :variables
       ;;       haskell-enable-ghci-ng-support t
       ;;       haskell-enable-shm-support t
       ;;       haskell-enable-hindent-style "andrew-gibiansky")

       ;;(typescript :variables
       ;;         typescript-backend 'tide
       ;;           typescript-fmt-tool 'prettier
       ;;           typescript-indent-level 2)
       ;;(cmake :variables cmake-enable-cmake-ide-support t)
       ;;(c-c++ :variables
       ;;      c-c++-default-mode-for-headers 'c++-mode
       ;;      c-c++-enable-clang-support t
       ;;      c-c++-enable-clang-format-on-save t
       ;;      c-c++-enable-rtags-support t
       ;;      c-c++-enable-google-style t
       ;;      c-c++-enable-google-newline t
       ;;      c-c++-enable-c++11 t)

       ;;(ruby :variables ruby-version-manager 'chruby
       ;;                 ruby-version-manager `rvm)

       ;; (scala :variables
       ;;     scala-indent:use-javadoc-style t
       ;;     scala-enable-eldoc t
       ;;     scala-auto-insert-asterisk-in-comments t
       ;;     scala-use-unicode-arrows t
       ;;     scala-auto-start-ensime t)

       ;; racket
       ;; lua
       ;;(lsp :variables
       ;;    lsp-ui-sideline-enable nil
       ;;   lsp-ui-doc-include-signature t
       ;;   lsp-ui-remap-xref-keybindings t)
       ;; ------------------------ Vim -------------------------------------
       ;;vinegar
       ;;vim-empty-lines
       ;;unimpaired
       ;;evil-commentary
       ;;evil-cleverparens
       ;;evil-snipe

       ;; Enhances M-x to allow easier execution of commands. Provides
       ;; ------------------------ Others ----------------------------------
       ;; Include emojis into everything
       ;;emoji
       ;; ------------------------ Private ---------------------------------
       clojure-lint
       ;;hsiao
       ;; ------------------------------------------------------------------
       ;; ------------------------ Spacemacs Layers ------------------------

       ;;spacemacs-completion
       ;;spacemacs-editing
       ;;spacemacs-editing-visual
       ;;spacemacs-evil
       ;; spacemacs-language
       ;;(spacemacs-layouts :variables layouts-enable-autosave nil)
       ;;spacemacs-misc
       ;;spacemacs-modeline
                                        ;spacemacs-navigation
       ;;spacemacs-org
       ;;spacemacs-project
       ;;spacemacs-visual

       ;;(mu4e :variables
       ;;mu4e-installation-path "/usr/local/share/emacs/site-lisp/mu/mu4e"
       ;;mu4e-headers-date-format "%Y-%m-%d %H:%M"
       ;;mu4e-enable-mode-line t
       ;;mu4e-enable-notifications t
       ;;mu4e-enable-async-operations t
       ;;mu4e-use-maildirs-extension t
       ;;mu4e-spacemacs-layout-name "@Mu4e"
       ;;mu4e-spacemacs-layout-binding "m"
       ;;mu4e-spacemacs-kill-layout-on-exit t
       ;;mu4e-view-show-images t
       ;;mu4e-view-show-addresses t
       ;;mu4e-confirm-quit nil

       ;;org-mu4e-link-query-in-headers-mode nil

       ;;mu4e-headers-fields '((:human-date    . 16)
       ;;                      (:flags         . 5)
       ;;                      (:from-or-to    . 25)
       ;;                      (:subject       . nil))
       ;;mu4e-view-fields '(:from :to :cc :subject :flags :date :maildir :tags :attachments)
       ;;)
       ;; ------------------------ Theme ---------------------------------

       ;;(theming
       ;;   :variables
       ;;   theming-modifications `((doom-one
       ;;                        (linum-relative-current-face :underline nil)
       ;;                        (modeline-highlight :inherit nil)
       ;;                        (powerline-active2 :inherit powerline-active0)
       ;;                        (powerline-inactive2 :inherit powerline-inactive0)
       ;;                        (sp-show-pair-match-face :foreground "#86dc2f"))
       ;;                       (doom-one-light
       ;;                        (linum-relative-current-face :underline nil)
       ;;                        (modeline-highlight :inherit nil)
       ;;                        (powerline-active2 :inherit powerline-active0)
       ;;                        (powerline-inactive2 :inherit powerline-inactive0)
       ;;                        (sp-show-pair-match-face :background nil))
       ;;                       (spacemacs-dark
       ;;                        (linum-relative-current-face :bold nil
       ;;                                                     :underline nil))
       ;;                       (spacemacs-light
       ;;                        (linum-relative-current-face :bold nil
       ;;                                                     :underline nil))))

       )

    ;; List of additional packages that will be installed without being
    ;; wrapped in a layer. If you need some configuration for these
    ;; packages, then consider creating a layer. You can also put the
    ;; configuration in `dotspacemacs/user-config'.
    ;; To use a local version of a package, use the `:location' property:
    ;; '(your-package :location "~/path/to/your-package/")
    ;; Also include the dependencies as they will not be resolved automatically.
    dotspacemacs-additional-packages '(
                                        company
                                        youdao-dictionary
                                        ;; makes handling lisp expressions much, much easier
                                        ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
                                        paredit

                                        ;; key bindings and code colorization for Clojure
                                        ;; https://github.com/clojure-emacs/clojure-mode
                                        clojure-mode
                                        ;; Common linting tools includes
                                        ;; Flycheck checker for Clojure, using eastwood, core.typed and kibit via cider.
                                        flycheck-clojure
                                        ;; Integration with a Clojure REPL
                                        ;; https://github.com/clojure-emacs/cider
                                        cider
                                        clojure-cheatsheet
                                        helm-clojuredocs
                                        clojars
                                        helm-cider
                                        cider-hydra
                                        flycheck-joker
                                        clj-refactor
                                        ;; extra syntax highlighting for clojure
                                        clojure-mode-extra-font-locking



                                        ;; customizations/navigation.el line 23 for a description
                                        ;; of ido
                                        ido-completing-read+

                                        ;; git integration
                                        magit
                                        format-sql

                                        ;;multiple-cursors
                                        (multiple-cursors :location (recipe :fetcher github
                                                                          :repo "jacobono/multiple-cursors.el"
                                                                          :branch "evil-ways"))
                                        ;; https://github.com/jacktasia/dumb-jump
                                        dumb-jump

                                        window-numbering
                                        ;; misc package
                                        ;; deletes all the whitespace when you hit backspace or delete
                                        hungry-delete
                                        ;; flashes the cursor's line when you scroll
                                        beacon
                                        ;; expand the marked region in semantic increments (negative prefix to reduce region)
                                        expand-region
                                        undo-tree
                                        hydra
                                        ;; project navigation
                                        projectile

                                        ;; https://github.com/Fanael/rainbow-delimitersa
                                        ;; colorful parenthesis matching
                                        rainbow-delimiters

                                        ;; edit html tags like sexps
                                        tagedit

                                        ;; flycheck use for joker
                                        flycheck-joker

                                        ;;diredful         ;; 使得dired模式更好看
                                        ;;dired-icon       ;; dired图标

                                        highlight-symbol
                                        highlight-defined

                                        ;;https://github.com/hlissner/emacs-doom-themes
                                        ;;doom-themes
                                        ;;https://github.com/purcell/exec-path-from-shell
                                        exec-path-from-shell
                                        ;;https://editorconfig.org/
                                        ;;https://github.com/editorconfig/editorconfig
                                        editorconfig

                                        ;;https://github.com/wyuenho/move-dup
                                        ;;Emacs minor mode for Eclipse-like moving and duplications of lines
                                        ;; or selections with convenient key bindings
                                        move-dup
                                        ;;https://github.com/domtronn/all-the-icons.el
                                        all-the-icons
                                        ;;https://github.com/jtbm37/all-the-icons-dired
                                        all-the-icons-dired
                                        ;;https://github.com/tumashu/cnfonts
                                        cnfonts
                                        yasnippet-snippets
                                        ;;powerline
                                        ;;rainbow-mode
                                        ;;web-mode
                                        ;;conf-mode
                                        ;;conf-unix-mode
                                        ;;conf-space-mode
                                        ;;dockerfile-mode
                                        ;;editorconfig-conf-mode
                                        ;;evil-tutor-mode
                                        ;;json-mode
                                        gitconfig-mode
                                        gitignore-mode
                                        ;;nxml-mode
                                        ;;prog-mode
                                        ;;react-mode
                                        ;;snippet-mode
                                        ;;typescript-mode

                                        ;;v2ex-mode
                                        ;;nginx-mode
                                        ;;yaml-mode
                                        )

    ;; A list of packages that cannot be updated.
    dotspacemacs-frozen-packages '()

    ;; A list of packages that will not be installed and loaded.
    dotspacemacs-excluded-packages '()

    ;; Defines the behaviour of Spacemacs when installing packages.
    ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
    ;; `used-only' installs only explicitly used packages and deletes any unused
    ;; packages as well as their unused dependencies. `used-but-keep-unused'
    ;; installs only the used packages but won't delete unused ones. `all'
    ;; installs *all* packages supported by Spacemacs and never uninstalls them.
    ;; (default is `used-only')
    dotspacemacs-install-packages 'used-but-keep-unused
    dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
    ;; If non-nil then enable support for the portable dumper. You'll need
    ;; to compile Emacs 27 from source following the instructions in file
    ;; EXPERIMENTAL.org at to root of the git repository.
    ;; (default nil)
    dotspacemacs-enable-emacs-pdumper nil

    ;; File path pointing to emacs 27.1 executable compiled with support
    ;; for the portable dumper (this is currently the branch pdumper).
    ;; (default "emacs-27.0.50")
    dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

    ;; Name of the Spacemacs dump file. This is the file will be created by the
    ;; portable dumper in the cache directory under dumps sub-directory.
    ;; To load it when starting Emacs add the parameter `--dump-file'
    ;; when invoking Emacs 27.1 executable on the command line, for instance:
    ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
    ;; (default spacemacs.pdmp)
    dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

    ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
    ;; possible. Set it to nil if you have no way to use HTTPS in your
    ;; environment, otherwise it is strongly recommended to let it set to t.
    ;; This variable has no effect if Emacs is launched with the parameter
    ;; `--insecure' which forces the value of this variable to nil.
    ;; (default t)
    dotspacemacs-elpa-https t

    ;; Maximum allowed time in seconds to contact an ELPA repository.
    ;; (default 5)
    dotspacemacs-elpa-timeout 5

    ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
    ;; This is an advanced option and should not be changed unless you suspect
    ;; performance issues due to garbage collection operations.
    ;; (default '(100000000 0.1))
    dotspacemacs-gc-cons '(100000000 0.1)

    ;; If non-nil then Spacelpa repository is the primary source to install
    ;; a locked version of packages. If nil then Spacemacs will install the
    ;; latest version of packages from MELPA. (default nil)
    dotspacemacs-use-spacelpa nil

    ;; If non-nil then verify the signature for downloaded Spacelpa archives.
    ;; (default nil)
    dotspacemacs-verify-spacelpa-archives nil

    ;; If non-nil then spacemacs will check for updates at startup
    ;; when the current branch is not `develop'. Note that checking for
    ;; new versions works via git commands, thus it calls GitHub services
    ;; whenever you start Emacs. (default nil)
    dotspacemacs-check-for-update nil

    ;; If non-nil, a form that evaluates to a package directory. For example, to
    ;; use different package directories for different Emacs versions, set this
    ;; to `emacs-version'. (default 'emacs-version)
    dotspacemacs-elpa-subdirectory 'emacs-version

    ;; One of `vim', `emacs' or `hybrid'.
    ;; `hybrid' is like `vim' except that `insert state' is replaced by the
    ;; `hybrid state' with `emacs' key bindings. The value can also be a list
    ;; with `:variables' keyword (similar to layers). Check the editing styles
    ;; section of the documentation for details on available variables.
    ;; (default 'vim)
    dotspacemacs-editing-style 'emacs

    ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
    dotspacemacs-verbose-loading nil

    ;; Specify the startup banner. Default value is `official', it displays
    ;; the official spacemacs logo. An integer value is the index of text
    ;; banner, `random' chooses a random text banner in `core/banners'
    ;; directory. A string value must be a path to an image format supported
    ;; by your Emacs build.
    ;; If the value is nil then no banner is displayed. (default 'official)
    dotspacemacs-startup-banner 'official

    ;; List of items to show in startup buffer or an association list of
    ;; the form `(list-type . list-size)`. If nil then it is disabled.
    ;; Possible values for list-type are:
    ;; `recents' `bookmarks' `projects' `agenda' `todos'.
    ;; List sizes may be nil, in which case
    ;; `spacemacs-buffer-startup-lists-length' takes effect.
    dotspacemacs-startup-lists '((recents . 10)
                                  ;;(todos . 9)
                                  (projects . 7)
                                  ;;(bookmarks . 7)
                                  )

    ;; True if the home buffer should respond to resize events. (default t)
    dotspacemacs-startup-buffer-responsive t

    ;; Default major mode of the scratch buffer (default `text-mode')
    ;;'emacs-lisp-mode
    dotspacemacs-scratch-mode 'text-mode

    ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
    ;; (default nil)
    dotspacemacs-initial-scratch-message nil

    ;; List of themes, the first of the list is loaded when spacemacs starts.
    ;; Press `SPC T n' to cycle to the next theme in the list (works great
    ;; with 2 themes variants, one dark and one light)
    dotspacemacs-themes '(spacemacs-dark
                           spacemacs-light
                           solarized-light
                           solarized-dark
                           leuven
                           monokai
                           ;;doom-themes
                           ;;(doom-themes  :location
                           ;;                 (recipe :fetcher github
                           ;;                         :repo "hlissner/emacs-doom-themes"))
                           ;;zenburn
                           ;;(zenburn :location
                           ;;           (recipe :fetcher github
                           ;;                   :repo "bbatsov/zenburn-emacs"))
                           )

    ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
    ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
    ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
    ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
    ;; refer to the DOCUMENTATION.org for more info on how to create your own
    ;; spaceline theme. Value can be a symbol or list with additional properties.
    ;; (default '(spacemacs :separator wave :separator-scale 1.5))
    dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)
    ;;dotspacemacs-mode-line-theme '(all-the-icons :separator slant)

    ;; If non-nil the cursor color matches the state color in GUI Emacs.
    ;; (default t)
    dotspacemacs-colorize-cursor-according-to-state t

    ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
    ;; quickly tweak the mode-line size to make separators look not too crappy.
    dotspacemacs-default-font '("Source Code Pro"
                                 :size 14
                                 ;;:size ,(if (> (x-display-pixel-height) 1200)
                                 ;;         30 18)
                                 :weight normal
                                 :width normal
                                 :powerline-scale 1.1
                                 )

    ;; The leader key (default "SPC")
    dotspacemacs-leader-key "SPC"

    ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
    ;; (default "SPC")
    dotspacemacs-emacs-command-key "SPC"

    ;; The key used for Vim Ex commands (default ":")
    dotspacemacs-ex-command-key ":"

    ;; The leader key accessible in `emacs state' and `insert state'
    ;; (default "M-m")
    dotspacemacs-emacs-leader-key "M-m"

    ;; Major mode leader key is a shortcut key which is the equivalent of
    ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
    dotspacemacs-major-mode-leader-key ","

    ;; Major mode leader key accessible in `emacs state' and `insert state'.
    ;; (default "C-M-m")
    dotspacemacs-major-mode-emacs-leader-key "C-M-m"

    ;; These variables control whether separate commands are bound in the GUI to
    ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
    ;; Setting it to a non-nil value, allows for separate commands under `C-i'
    ;; and TAB or `C-m' and `RET'.
    ;; In the terminal, these pairs are generally indistinguishable, so this only
    ;; works in the GUI. (default nil)
    dotspacemacs-distinguish-gui-tab nil

    ;; Name of the default layout (default "Default")
    dotspacemacs-default-layout-name "Default"

    ;; If non-nil the default layout name is displayed in the mode-line.
    ;; (default nil)
    dotspacemacs-display-default-layout nil

    ;; If non-nil then the last auto saved layouts are resumed automatically upon
    ;; start. (default nil)
    dotspacemacs-auto-resume-layouts nil

    ;; If non-nil, auto-generate layout name when creating new layouts. Only has
    ;; effect when using the "jump to layout by number" commands. (default nil)
    dotspacemacs-auto-generate-layout-names nil

    ;; Size (in MB) above which spacemacs will prompt to open the large file
    ;; literally to avoid performance issues. Opening a file literally means that
    ;; no major mode or minor modes are active. (default is 1)
    dotspacemacs-large-file-size 1

    ;; Location where to auto-save files. Possible values are `original' to
    ;; auto-save the file in-place, `cache' to auto-save the file to another
    ;; file stored in the cache directory and `nil' to disable auto-saving.
    ;; (default 'cache)
    dotspacemacs-auto-save-file-location 'cache

    ;; Maximum number of rollback slots to keep in the cache. (default 5)
    dotspacemacs-max-rollback-slots 5

    ;; If non-nil, the paste transient-state is enabled. While enabled, after you
    ;; paste something, pressing `C-j' and `C-k' several times cycles through the
    ;; elements in the `kill-ring'. (default nil)
    dotspacemacs-enable-paste-transient-state nil

    ;; Which-key delay in seconds. The which-key buffer is the popup listing
    ;; the commands bound to the current keystroke sequence. (default 0.4)
    dotspacemacs-which-key-delay 0.4

    ;; Which-key frame position. Possible values are `right', `bottom' and
    ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
    ;; right; if there is insufficient space it displays it at the bottom.
    ;; (default 'bottom)
    dotspacemacs-which-key-position 'bottom

    ;; Control where `switch-to-buffer' displays the buffer. If nil,
    ;; `switch-to-buffer' displays the buffer in the current window even if
    ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
    ;; displays the buffer in a same-purpose window even if the buffer can be
    ;; displayed in the current window. (default nil)
    dotspacemacs-switch-to-buffer-prefers-purpose nil

    ;; If non-nil a progress bar is displayed when spacemacs is loading. This
    ;; may increase the boot time on some systems and emacs builds, set it to
    ;; nil to boost the loading time. (default t)
    dotspacemacs-loading-progress-bar t

    ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
    ;; (Emacs 24.4+ only)
    dotspacemacs-fullscreen-at-startup nil

    ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
    ;; Use to disable fullscreen animations in OSX. (default nil)
    dotspacemacs-fullscreen-use-non-native nil

    ;; If non-nil the frame is maximized when Emacs starts up.
    ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
    ;; (default nil) (Emacs 24.4+ only)
    dotspacemacs-maximized-at-startup nil

    ;; A value from the range (0..100), in increasing opacity, which describes
    ;; the transparency level of a frame when it's active or selected.
    ;; Transparency can be toggled through `toggle-transparency'. (default 90)
    dotspacemacs-active-transparency 90

    ;; A value from the range (0..100), in increasing opacity, which describes
    ;; the transparency level of a frame when it's inactive or deselected.
    ;; Transparency can be toggled through `toggle-transparency'. (default 90)
    dotspacemacs-inactive-transparency 90

    ;; If non-nil show the titles of transient states. (default t)
    dotspacemacs-show-transient-state-title t

    ;; If non-nil show the color guide hint for transient state keys. (default t)
    dotspacemacs-show-transient-state-color-guide t

    ;; If non-nil unicode symbols are displayed in the mode line.
    ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
    ;; the value to quoted `display-graphic-p'. (default t)
    dotspacemacs-mode-line-unicode-symbols t

    ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
    ;; scrolling overrides the default behavior of Emacs which recenters point
    ;; when it reaches the top or bottom of the screen. (default t)
    dotspacemacs-smooth-scrolling t

    ;; Control line numbers activation.
    ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
    ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
    ;; This variable can also be set to a property list for finer control:
    ;; '(:relative nil
    ;;   :disabled-for-modes dired-mode
    ;;                       doc-view-mode
    ;;                       markdown-mode
    ;;                       org-mode
    ;;                       pdf-view-mode
    ;;                       text-mode
    ;;   :size-limit-kb 1000)
    ;; (default nil)
    ;;'(:relative nil
    ;;  :disabled-for-modes dired-mode
    ;;                      doc-view-mode
    ;;                      ;; markdown-mode
    ;;                      ;; org-mode
    ;;                      ;;text-mode
    ;;                      :size-limit-kb 1000)
    dotspacemacs-line-numbers  t

    ;; Code folding method. Possible values are `evil' and `origami'.
    ;; (default 'evil)
    dotspacemacs-folding-method 'origami

    ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
    ;; (default nil)
    dotspacemacs-smartparens-strict-mode nil

    ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
    ;; over any automatically added closing parenthesis, bracket, quote, etc…
    ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
    dotspacemacs-smart-closing-parenthesis t

    ;; Select a scope to highlight delimiters. Possible values are `any',
    ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
    ;; emphasis the current one). (default 'all)
    dotspacemacs-highlight-delimiters 'all

    ;; If non-nil, start an Emacs server if one is not already running.
    ;; (default nil)
    dotspacemacs-enable-server nil

    ;; Set the emacs server socket location.
    ;; If nil, uses whatever the Emacs default is, otherwise a directory path
    ;; like \"~/.emacs.d/server\". It has no effect if
    ;; `dotspacemacs-enable-server' is nil.
    ;; (default nil)
    dotspacemacs-server-socket-dir nil ;;"~/.emacs.d/server"

    ;; If non-nil, advise quit functions to keep server open when quitting.
    ;; (default nil)
    dotspacemacs-persistent-server nil

    ;; List of search tool executable names. Spacemacs uses the first installed
    ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
    ;; (default '("rg" "ag" "pt" "ack" "grep"))
    dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

    ;; Format specification for setting the frame title.
    ;; %a - the `abbreviated-file-name', or `buffer-name'
    ;; %t - `projectile-project-name'
    ;; %I - `invocation-name'
    ;; %S - `system-name'
    ;; %U - contents of $USER
    ;; %b - buffer name
    ;; %f - visited file name
    ;; %F - frame name
    ;; %s - process status
    ;; %p - percent of buffer above top of window, or Top, Bot or All
    ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
    ;; %m - mode name
    ;; %n - Narrow if appropriate
    ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
    ;; %Z - like %z, but including the end-of-line format
    ;; (default "%I@%S")
    dotspacemacs-frame-title-format "%I@%S"
    ;;"%I@%S"

    ;; Format specification for setting the icon title format
    ;; (default nil - same as frame-title-format)
    dotspacemacs-icon-title-format nil

    ;; Delete whitespace while saving buffer. Possible values are `all'
    ;; to aggressively delete empty line and long sequences of whitespace,
    ;; `trailing' to delete only the whitespace at end of lines, `changed' to
    ;; delete only whitespace for changed lines or `nil' to disable cleanup.
    ;; (default nil)
    dotspacemacs-whitespace-cleanup 'trailing ;; nil

    ;; Either nil or a number of seconds. If non-nil zone out after the specified

    ;; number of seconds. (default nil)
    dotspacemacs-zone-out-when-idle nil

    ;; Run `spacemacs/prettify-org-buffer' when
    ;; visiting README.org files of Spacemacs.
    ;; (default nil)
    dotspacemacs-pretty-docs t))


(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq configuration-layer--elpa-archives
    '(
       ("melpa" . "melpa.org/packages/")
       ("org"   . "orgmode.org/elpa/")
       ("gnu"   . "elpa.gnu.org/packages/")
       ("popkit" . "elpa.popkit.org/packages/")
       ("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
       ("org-cn"   . "http://elpa.emacs-china.org/org/")
       ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")
       ("melpa-tuna" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
       ("org-tuna"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
       ("gnu-tuna"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
       ("myelpa" . "~./emacs.d/localelpa/")
       )
    )
  ;; https://github.com/syl20bnr/spacemacs/issues/2705
  ;; (setq tramp-mode nil)
  ;; http://spacemacs.org/doc/FAQ.html#orgheadline14
  ;; https://github.com/syl20bnr/spacemacs/issues/2705
  (setq tramp-ssh-controlmaster-options
    "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  ;; (setq tramp-mode nil)
  (setq url-gateway-method 'socks)
  (setq socks-server '("Default-server" "127.0.0.1" 1080 5))
  (setq socks-noproxy '("127.0.0.1" "192.168.1.*"))

  (setq byte-compile-warnings '(not obsolete))
  (setq warning-minimum-level :error)
  ;; hack for remove purpose mode
  ;; (setq purpose-mode nil)

  ;; add custom.el
  ;; https://github.com/cmccloud/.spacemacs.d/blob/master/init.el
  ;; autosave
  ;;(setq layouts-enable-autosave t)
  ;;(setq custom-file "~/.spacemacs.d/custom.el")
  ;;(load custom-file)
  ;; (setq-default evil-escape-key-sequence "df"))

  ;;(add-to-load-path "~/.spacemacs.d/packages")
  ;;(add-to-load-path "~/.spacemacs.d")

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;  Encoding
  (setenv "LANG" "en_US.UTF-8")
  (setenv "LC_ALL" "en_US.UTF-8")
  ;; remove svn log LC_TYPE not defined warning.
  (setenv "LC_CTYPE" "en_US")
  (set-locale-environment "UTF-8")
  (set-language-environment "UTF-8")
  (set-default-coding-systems 'utf-8-unix)
  (prefer-coding-system 'utf-8)
  (set-buffer-file-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8)
  (set-clipboard-coding-system 'utf-16le)
  (set-file-name-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (setq path-name-coding-system 'utf-8)
  (modify-coding-system-alist 'process "*" 'utf-8)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ) ;; End of user-init

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;;(setq custom-file "~/.spacemacs.d/custom.el")

  ;;(load custom-file :noerror 'no-message)

  (setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
  (load custom-file 'no-error 'no-message)


  ;;(setq-default custom-file (expand-file-name ".custom.el" user-emacs-directory))
  ;;(when (file-exists-p custom-file)
  ;; (load custom-file))

  (load-file "~/.spacemacs.d/parts/slpp.el")
  (add-to-list 'load-path "~/.spacemacs.d/libs")
  ;;(add-to-list 'load-path "~/.spacemacs.d/configs")
  (slpp-load-path-and-pkgs '(("~/.spacemacs.d/parts" hsiao-core hsiao-log)))
  (load-file "~/.spacemacs.d/init-hsiao.el")
  ;;(load-file "~/.spacemacs.d/hotkey/hsiao-prefix.el")


  )  ;; End of dot-spacemacs/user-config

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-clojuredocs helm-cider zenburn-theme youdao-dictionary yasnippet-snippets yapfify yaml-mode wttrin ws-butler writeroom-mode winum window-numbering which-key wgrep web-mode web-beautify wakatime-mode volatile-highlights vimrc-mode vi-tilde-fringe v2ex-mode uuidgen use-package unfill tree-mode toc-org timp tide tagedit symon string-inflection sql-indent spaceline-all-the-icons solarized-theme smeargle slim-mode shell-pop seeing-is-believing scss-mode sayid sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocop rspec-mode robe reveal-in-osx-finder restart-emacs rbenv rainbow-mode rainbow-identifiers rainbow-delimiters racket-mode pyvenv pytest pyim pyenv-mode py-isort pug-mode projectile-rails prettier-js popwin pippel pipenv pip-requirements persp-mode password-generator paradox ox-twbs ox-reveal ox-hugo ox-gfm overseer osx-trash osx-dictionary origami orgit org-projectile org-present org-pomodoro org-page org-mime org-journal org-download org-bullets org-brain open-junk-file ob-elixir nginx-mode neotree nameless mwim mvn multi-term move-text move-dup monokai-theme mmm-mode minitest meghanada maven-test-mode markdown-toc magithub magit-svn magit-gitflow magit-gh-pulls macrostep lorem-ipsum livid-mode live-py-mode link-hint leanote launchctl kanban jump json-navigator json-mode js2-refactor js-doc iy-go-to-char insert-shebang indent-guide importmagic impatient-mode ido-completing-read+ hyperbole hungry-delete hl-todo highlight-symbol highlight-parentheses highlight-numbers highlight-indentation highlight-defined helm-xref helm-themes helm-swoop helm-smex helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-mode-manager helm-make helm-gtags helm-gitignore helm-github-stars helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hackernews groovy-mode groovy-imports gradle-mode google-translate golden-ratio godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md ggtags fuzzy format-sql font-lock+ flyspell-popup flyspell-correct-helm flycheck-pos-tip flycheck-mix flycheck-joker flycheck-credo flycheck-clojure flycheck-bashate flx-ido fish-mode find-file-in-project fill-column-indicator feature-mode fcitx fancy-battery f3 eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eshell-z eshell-prompt-extras esh-help erlang ensime emmet-mode elisp-slime-nav editorconfig easy-kill dumb-jump dotenv-mode doom-themes doom-modeline disable-mouse diredful dired-icon diminish diff-hl deft define-word dactyl-mode cython-mode counsel-projectile company-web company-tern company-statistics company-shell company-quickhelp company-go company-emacs-eclim company-anaconda command-log-mode column-enforce-mode color-identifiers-mode cnfonts closure-lint-mode clojure-snippets clojure-quick-repls clojure-mode-extra-font-locking clojure-cheatsheet clojars clj-refactor clean-buffers clean-aindent-mode cider-hydra cider-eval-sexp-fu chruby centered-cursor-mode buttercup bundler buffer-move browse-at-remote benchmark-init beacon auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile all-the-icons-dired alchemist aggressive-indent add-node-modules-path ace-window ace-pinyin ace-link ace-jump-mode ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
