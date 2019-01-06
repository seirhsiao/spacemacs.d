;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-erlang.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Erlang Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up erlang for my personal configuration
;;     (currently for hsiao only)
;;
;;   note:- this is all the configuration for erlang.
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

(setq load-path (cons  "/usr/local/Cellar/erlang/18.1/lib/erlang/lib/tools-2.8.1/emacs"
                       load-path))
(setq erlang-root-dir "/usr/local/Cellar/erlang/18.1")
(setq exec-path (cons "/usr/local/Cellar/erlang/18.1/bin" exec-path))
(setq erlang-man-root-dir "/usr/local/Cellar/erlang/18.1/lib/erlang/man")

(require 'erlang-start)
(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

(provide 'erlang-part)
