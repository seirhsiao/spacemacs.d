;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-backup.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-12-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao <xiaojianfang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao, Citi Shnaghai
;;
;;  PURPOSE:    Personal Mu 4 Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up backup for my personal configuration
;;
;;   note:- this is not all the configuration for backup.
;;          details:
;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;  Old logs up to tag 0.200 are in HISTORY.md
;;  See git log after for changes after 2018-03-06
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; spacemacs use:
;; dotspacemacs-auto-save-file-location 'cache
;; Backup settings
(defvar backup-directory (concat user-emacs-directory ".cache"))
(if (not (file-exists-p backup-directory))
  (make-directory backup-directory t))
(setq backup-directory-alist `(("." . ,backup-directory)))
(setq
  make-backup-files t               ; backup of a file the first time it is saved. ;;启用备份功能
  ;;备份设置方法，直接拷贝
  backup-by-copying t               ; don't clobber symlinks
  ;;启用版本控制，即可以备份多次
  version-control t                 ; version numbers for backup files
  ;;备份最原始的版本两次，即第一次编辑前的文档，和第二次编
  kept-old-versions 3               ; oldest versions to keep when a new numbered backup is made (default: 2)
  ;;备份最新的版本6次，理解同上
  kept-new-versions 6               ; newest versions to keep when a new numbered backup is made (default: 2)
  ;;删掉不属于以上3种版本的版本
  delete-old-versions t             ; delete excess backup files silently
  delete-by-moving-to-trash t
  ;;不生成 #filename# 临时文件
  auto-save-default t               ; auto-save every buffer that visits a file
  auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
  auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
  )

;; Auto-save settings
(defvar auto-save-directory (concat user-emacs-directory ".cache/auto-save"))
(if (not (file-exists-p auto-save-directory))
  (make-directory auto-save-directory t))

(add-to-list 'auto-save-file-name-transforms
  (list "\\(.+/\\)*\\(.*?\\)" (expand-file-name "\\2" auto-save-directory))
  t)
;; Save place in files between sessions
(setq save-place-file (concat user-emacs-directory ".cache/auto-save"))
(save-place-mode 1)
;;关闭自动保存模式
(setq auto-save-mode nil)

;; Always Use `y-or-n-p', Never `yes-or-no-p'
;; https://www.emacswiki.org/emacs/YesOrNoP
;; (defalias 'yes-or-no-p 'y-or-n-p)

(setq vc-make-backup-files nil) ;;使用版本控制系统的时候也启用备份功能

(defun ecm-backup-enable-predicate (filename)
  (and (not (string= "/tmp/" (substring filename 0 5)))
    (not (string-match "semanticdb" filename))
    ))
(setq backup-enable-predicate 'ecm-backup-enable-predicate);;设置备份条件

(provide 'config-backup)
