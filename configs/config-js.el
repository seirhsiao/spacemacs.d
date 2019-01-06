;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-js.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Javascript Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up js for my personal configuration
;;     (currently for hsiao only)
;;
;;   note:- this is all the configuration for js.
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


(setq-default js2-basic-offset 2
              js-indent-level 2)

(spacemacs/set-leader-keys-for-major-mode 'js2-mode
  "sb" 'nodejs-repl-send-buffer
  "sr" 'nodejs-repl-send-region
  "se" 'nodejs-repl-send-last-sexp
  "m." 'tern-find-definition
  )

(add-hook
 'js2-mode-hook
 (lambda ()
   (js2-mode-hide-warnings-and-errors)
   ;(evil-leader/set-key-for-mode 'js2-mode "m." 'tern-find-definition)
   ))
