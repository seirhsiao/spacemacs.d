;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-pyim.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Pyim Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up pyim for my personal configuration
;;     (currently for hsiao only)
;;
;;   note:- this is all the configuration for pyim.
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


(setq pyim-directory "~/.spacemacs.d/pyim")

;; {{ make IME compatible with evil-mode
(defun evil-toggle-input-method ()
  "when toggle on input method, switch to evil-insert-state if possible.
when toggle off input method, switch to evil-normal-state if current state is evil-insert-state"
  (interactive)
  ;; some guy donot use evil-mode at all
  (if (fboundp 'evil-insert-state)
      (if (not current-input-method)
          (if (not (string= evil-state "insert"))
              (evil-insert-state))
        (if (string= evil-state "insert")
            (evil-normal-state)
          )))
  ;; my way to toggle-input-method, the original implementation has some weird bug
  (if current-input-method
      (progn
        (deactivate-input-method)
        (setq current-input-method nil))
    (unless (bound-and-true-p pyim)
      (require 'pyim))
    (activate-input-method default-input-method)
    (setq current-input-method default-input-method)))

; (global-set-key (kbd "C-\\") 'evil-toggle-input-method)
;; }}

(setq pyim-punctuation-translate-p nil) ;; use western punctuation (ban jiao fu hao)

(eval-after-load 'pyim
  '(progn
     (setq default-input-method "pyim")
     (setq pyim-use-tooltip 'popup) ; don't use tooltip
     (setq pyim-directory "~/.spacemacs.d/pyim/")
     (setq pyim-cache-directory (concat pyim-directory "cache"))
     (setq pyim-property-file (concat pyim-directory "pyim-words-property.txt"))
     (setq pyim-personal-file (concat pyim-directory "pyim-personal.txt"))
     ;; another official dictionary
     (setq pyim-dicts '((:name "pinyin1" :file "~/.spacemacs.d/pyim/py.txt" :coding utf-8-unix)))

     (setq pyim-fuzzy-pinyin-adjust-function nil)
     ))

(setq-default pyim-english-input-switch-functions
              '(pyim-probe-program-mode))

(global-set-key (kbd "s-j") 'pyim-convert-code-at-point)

(provide 'config-pyim)
