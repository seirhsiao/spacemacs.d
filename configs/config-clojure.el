 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-clojure.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Mu 4 Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up mu4e for my clojure language
;;
;;   note:- this is not all the configuration for clojure. I also have configuration
;;          details:
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;  Old logs up to tag 0.200 are in HISTORY.md
;;  See git log after for changes after 2017-03-06
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clojure configurations
;;
;; In clojure-mode, treat hyphenated words as a single word.
(add-hook 'clojure-mode-hook #'(lambda () (modify-syntax-entry ?- "w")))
(add-hook 'clojure-mode-hook #'cider-hydra-mode)
(add-hook 'cider-mode-hook #'eldoc-mode)
;;(add-hook 'cider-repl-mode-hook #'paredit-mode)
;;(add-hook 'cider-repl-mode-hook #'subword-mode)
(add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)
;; enable safe structural editing in evil (clojure layer - evil-cleverparens)
(spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hook-clojure-mode)
;;
;; pretty print in clojure to use the fast idiomatic pretty-printer.
;; this is approximately 5-10x faster than clojure.core/pprint
(setq cider-pprint-fn 'fipp)
;;
;; configure clojurescript-jack-in to use the helper functions provided by lein-figwheel template
;; https://github.com/bhauman/lein-figwheel
;; fig-start will start figwheel and compile the clojurescript application
;; cljs-repl will connect emacs buffer to clojurescript repl created by figwheel
;;
;; without this configuration, emacs command clojurescript-jack-in defaults to jvm rhino repl
;; if using a different clojurescript template you may require different function calls in the do expression
;; alternatively: set via m-x customize-variable cider-cljs-lein-repl
(setq cider-cljs-lein-repl
  "(do
          (user/fig-start)
          (user/cljs-repl))")

;; if you are not using figwheel template to configure funcitons in dev/core.clj
;; then use the full function calls
;; (setq cider-cljs-lein-repl
;;       "(do (require 'figwheel-sidecar.repl-api)
;;          (figwheel-sidecar.repl-api/start-figwheel!)
;;          (figwheel-sidecar.repl-api/cljs-repl))")

;; Multi-line editing in the REPL buffer
;; `RTN` creates a new line, `C-RTN` evaluates the code
;; Multi-line editing in the REPL buffer
(add-hook 'cider-repl-mode-hook
  '(lambda ()
     (define-key cider-repl-mode-map (kbd "RET") #'cider-repl-newline-and-indent)
     (define-key cider-repl-mode-map (kbd "C-<return>") #'cider-repl-return)))

;; TODO: Spacemacs pull request with these keybindings, updating REPL intro text with details
;; You can remove this message with the <M-x cider-repl-clear-help-banner> command.
;; You can disable it from appearing on start by setting
;; ‘cider-repl-display-help-banner’ to nil.

;; TODO: review this binding
;; repl history keybindings - not used - use s-<up> and s-<down> which are the defaults
(add-hook 'cider-repl-mode-hook
  '(lambda ()
     (define-key cider-repl-mode-map (kbd "<up>") 'cider-repl-previous-input)
     (define-key cider-repl-mode-map (kbd "<down>") 'cider-repl-next-input)))

(add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode)
;; hook for command-line-mode - shows keybindings & commands in separate buffer
;; load command-line-mode when opening a clojure file
;; (add-hook 'clojure-mode-hook 'command-log-mode)
;;
;; turn on command-log-mode when opening a source code or text file
;; (add-hook 'prog-mode-hook 'command-log-mode)
;; (add-hook 'text-mode-hook 'command-log-mode)
;;
;; toggle reader macro sexp comment
;; toggles the #_ characters at the start of an expression
(defun clojure-toggle-reader-comment-sexp ()
  (interactive)
  (let* ((point-pos1 (point)))
    (evil-insert-line 0)
    (let* ((point-pos2 (point))
            (cmtstr "#_")
            (cmtstr-len (length cmtstr))
            (line-start (buffer-substring-no-properties point-pos2 (+ point-pos2 cmtstr-len))))
      (if (string= cmtstr line-start)
        (delete-char cmtstr-len)
        (insert cmtstr))
      (goto-char point-pos1))))

;; Assign keybinding to the toggle-reader-comment-sexp function
(define-key global-map (kbd "C-;") 'clojure-toggle-reader-comment-sexp)

;; Evaluate code when it is contained in a (comment (,,,))
;; 24th sept - didnt work, even after updating spacemacs and packages
;; (setq cider-eval-toplevel-inside-comment-form t)
;;
;; (add-hook 'clojure-mode-hook
;;           '(setq cider-eval-toplevel-inside-comment-form t))
;;
;; end of clojure configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evil-cleverparens - now part of the clojure layer (develop branch)
;;
;; use the evil-cleverparens layer
;; https://github.com/luxbock/evil-cleverparens
;;
;; add evil-cleverparens to clojure-mode
;; (spacemacs/toggle-evil-cleverparens-on)
;; (add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
;; end of evil-smartparens
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; exclude sayid as it currently does not support nrepl 0.4
;;
;; Temporary fix
;; (setq sayid-inject-dependencies-at-jack-in nil)
;; issue raised: https://github.com/syl20bnr/spacemacs/issues/11146
;;
;; pull request merged into develop to switch sayid off by default
;; https://github.com/bpiel/sayid/pull/40
;; enable sayid by adding this code to the .spacemacs dotspacemacs/layers configuration
;;   dotspacemacs-configuration-layers
;;    '(
;;       (clojure :variables clojure-enable-sayid t)
;;     )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cider-refactor to be off by default
;;
;; @plexus to create a pull Request to disable clj-refactor by default
;; - it seems not many people use it and there are version conflicts occasionally
;;
;; Add this code to the .spacemacs configuration file
;;   dotspacemacs-configuration-layers
;;    '(
;;       (clojure :variables clojure-enable-clj-refactor t)
;;     )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq cider-lein-parameters "update-in :plugins conj \"[cider/cider-nrepl \\\"0.19.0-SNAPSHOT\\\"]\" -- update-in :plugins conj \"[refactor-nrepl \\\"2.4.0\\\"]\" -- update-in :dependencies conj \"[org.clojure/tools.nrepl \\\"0.2.13\\\"]\" -- update-in :dependencies conj \"[org.clojure/clojure \\\"1.9.0\\\"]\" -- update-in :dependencies conj \"[nrepl \\\"0.5.3\\\"]\" -- repl :headless")


(setq cider-boot-parameters
  "-d cider/cider-nrepl:0.19.0-SNAPSHOT -d org.clojure/tools.nrepl:0.2.13 repl -m cider.nrepl/cider-middleware -s wait")

(provide 'config-clojure)
