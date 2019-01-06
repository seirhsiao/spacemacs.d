;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-linux.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Linux Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up linux for my personal configuration
;;     (currently for hsiao only)
;;
;;   note:- this is all the configuration for linux.
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

;; (set-fontset-font "fontset-default" 'han (font-spec :name "Noto_Sans_T_Chinese"))

;; (global-set-key (kbd "M-SPC") 'toggle-input-method)

;;========================================================================================
;;             解决终端下,nogui模式,矩形选中后复制无法粘贴到外部程序的问题。
;;========================================================================================
;; linux需要安装xsel
(setq x-select-enable-clipboard t)
(unless window-system
 (when (getenv "DISPLAY")
  (defun xsel-cut-function (text &optional push)
    (with-temp-buffer
      (insert text)
      (call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))
  (defun xsel-paste-function()
    (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
      (unless (string= (car kill-ring) xsel-output)
        xsel-output )))
  (setq interprogram-cut-function 'xsel-cut-function)
  (setq interprogram-paste-function 'xsel-paste-function)
  ))

;(server-start)
