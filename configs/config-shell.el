;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-shell.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Shell Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up shell for my personal configuration
;;     (currently for hsiao only)
;;
;;   note:- this is all the configuration for shell.
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


(setq sh-basic-offset 2)
(setq sh-indentation 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Systemd user service

;; Use the exec-path-from-shell package to get PATH, MANPATH
;; and the environment variables from your zsh or bash rc-files.
;; ------------------------------------------------------------
;; set multi-term
;; ------------------------------------------------------------
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
;; Use Emacs terminfo, not system terminfo, mac系统出现了4m
(setq system-uses-terminfo nil)
;; (add-to-list 'term-bind-key-alist '("C-j"))
;; https://github.com/aborn/multi-term-plus
(add-to-list 'load-path "~/.emacs.d/private/multi-term-plus")
(require 'multi-term-config)
;; (load-file "~/.emacs.d/private/multi-term-plus/multi-term-config.el")

;; (setq exec-path-from-shell-variables
;;       (append exec-path-from-shell-variables
;;               (list "TERM"
;;                     "RUST_SRC_PATH"
;;                     "…"
;;                     )))
;; (exec-path-from-shell-initialize)
;;  End of System user service
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'config-shell)
