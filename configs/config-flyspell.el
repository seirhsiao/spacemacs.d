;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-flyspell.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Flyspell Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up flyspell for my personal configuration
;;     (currently for hsiao only)
;;
;;   note:- this is all the configuration for flyspell.
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

;; (define-key global-map (kbd "C-#") 'clojure-toggle-reader-comment-sexp)

;; (define-key global-map (kbd "SPC S s") 'flyspell-correct-at-point)

;; (define-key markdown-mode-map (kbd "SPC S s") #'flyspell-correct-at-point)

;; /usr/local/Cellar/aspell/0.60.6.1_1/bin
;;setq-default ispell-program-name "/usr/local/bin/aspell")
;;(setq-default ispell-list-command "list"
;;(setq ispell-program-name "/usr/local/bin/ispell")
(setq-default ispell-program-name "/usr/local/bin/aspell")
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(provide 'config-flyspell)
