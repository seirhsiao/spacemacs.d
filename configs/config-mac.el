;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-mac.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Mac Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up mac for my personal configuration
;;     (currently for hsiao only)
;;
;;   note:- this is all the configuration for mac.
;;   details:
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


;; platfrom-dependent config: mac

;; (setq mac-option-key-is-meta t)
;; (setq mac-command-key-is-meta nil)
;; (setq mac-command-modifier 'meta)
;; (setq mac-option-modifier nil)

;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; '(prefer-coding-system 'utf-8)

;; chinese font(only english font in menlo or monaco)
;; (set-fontset-font "fontset-default" 'han '("STHeiti"))
;; (set-fontset-font
;;    (frame-parameter nil 'font)
;;    'han '("STHeiti" . "unicode-bmp"))

;; (setq ns-option-modifier 'super)

;; (global-set-key "\M-`" 'other-frame) ;tmm-menubar originally

;; (defun set-exec-path-from-shell-PATH ()
;;  (let ((path-from-shell 
;;      (replace-regexp-in-string "[[:space:]\n]*$" "" 
;;        (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
;;    (setenv "PATH" path-from-shell)
;;    (setq exec-path (split-string path-from-shell path-separator))))

;; (set-exec-path-from-shell-PATH)

;; (setq ns-use-srgb-colorspace t)

;; (setq mf-max-width 1438)

;;; osx.el --- OSX related configuration -*- lexical-binding: t; -*-
  ;; Setup mac modifier keys
;;  (setq mac-option-key-is-meta nil)
;;  (setq mac-command-key-is-meta t)
;;  (setq mac-command-modifier 'meta)
;;  (setq mac-option-modifier 'alt)
;;  (setq mac-right-command-modifier 'ctrl)
;;  (setq mac-right-option-modifier nil)

;; ;; Switch the Cmd and Meta keys
;; (setq mac-option-key-is-meta nil)
;; (setq mac-command-key-is-meta t)
;; (setq mac-command-modifier 'meta)
;; (setq mac-option-modifier nil)
;;(setq-default mac-command-modifier 'alt)

;; Menu bar is not annoying in OSX
;; Get rid of tool bar, menu bar and scroll bars.  On OS X we preserve the menu
;; bar, since the top menu bar is always visible anyway, and we'd just empty it
;; which is rather pointless.
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (and (not (eq system-type 'darwin)) (fboundp 'menu-bar-mode))
  (menu-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Make the browser the OS X default
(setq browse-url-browser-function 'browse-url-default-macosx-browser)

;;; Environment fixup
(use-package exec-path-from-shell
  :ensure t
  :if (and (eq system-type 'darwin) (display-graphic-p))
  :config
  (progn
    (when (string-match-p "/zsh$" (getenv "SHELL"))
      ;; Use a non-interactive login shell.  A login shell, because my
      ;; environment variables are mostly set in `.zprofile'.
      (setq exec-path-from-shell-arguments '("-l")))
    ;; Import additional environment variables beyond just $PATH
    (dolist (var '("PYTHONPATH"         ; Python modules
                   "INFOPATH"           ; Info directories
                   "JAVA_OPTS"          ; Options for java processes
                   "SBT_OPTS"           ; Options for SBT
                   "RUST_SRC_PATH"      ; Rust sources, for racer
                   "CARGO_HOME"         ; Cargo home, for racer
                   "EMAIL"              ; My personal email
                   "GPG_TTY"
                   "GPG_AGENT_INFO"
                   "SSH_AUTH_SOCK"
                   "SSH_AGENT_PID"

                   ))
      (add-to-list 'exec-path-from-shell-variables var))

;; Initialize Emacs' environment from the shell

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; ;; In dired, move deletions to trash
;; (setq delete-by-moving-to-trash t)

;; ;; Set font
;; (set-default-font "-apple-Source_Code_Pro-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1")

(defun finder ()
  "Opens file directory in Finder."
  (interactive)
  (let ((file (buffer-file-name)))
    (if file
        (shell-command
         (format "%s %s" (executable-find "open") (file-name-directory file)))
      (error "Buffer is not attached to any file."))))

;; Use GNU ls - install with:
;;    brew install xz
;;    brew install coreutils
(setq insert-directory-program "gls")

;;; OS X support
(use-package ns-win                     ; OS X window support
  :defer t
  :if (eq system-type 'darwin)
  :config
  (setq ns-pop-up-frames nil            ; Don't pop up new frames from the
                                        ; workspace
        mac-option-modifier 'meta       ; Option is simply the natural Meta
        mac-command-modifier 'meta      ; But command is a lot easier to hit
        mac-right-command-modifier 'left
        mac-right-option-modifier 'none ; Keep right option for accented input
        ;; Just in case we ever need these keys
        mac-function-modifier 'hyper))
(use-package osx-trash                  ; Trash support for OS X
  :if (eq system-type 'darwin)
  :ensure t
  :init (osx-trash-setup))

(provide 'config-mac)
