;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-eclipse-like.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Deft Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up eclipse like  for my personal configuration
;;     (currently for hsiao only)
;;
;;   note:- this is  all the configuration for eclipse like.
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

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; move up
  ;; Minor mode for Eclipse-like moving and duplicating lines or rectangles.
  ;; https://github.com/wyuenho/move-dup
  ;; (use-package move-dup)
  ;; (require 'move-dup)
  ;;;; Minor mode for Eclipse-like moving and duplicating lines or rectangles.
  ;;(use-package move-dup)
  (when (file-exists-p "~/emacs.d/private/move-dup/move-dup.el")
    (load-file "~/emacs.d/private/move-dup/move-dup.el"))
  (require 'move-dup)
  ;;
  (global-set-key (kbd "M-<up>") 'md/move-lines-up)
  (global-set-key (kbd "M-<down>") 'md/move-lines-down)
  (global-set-key (kbd "C-M-<up>") 'md/duplicate-up)
  (global-set-key (kbd "C-M-<down>") 'md/duplicate-down)
  ;; https://github.com/targzeta/move-lines
  ;;(require 'move-lines)
  ;;(move-lines-binding)
  ;; End of move up
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; commenmt or uncomment like eclipse
  ;; https://stackoverflow.com/questions/9688748/emacs-comment-uncomment-current-line
  ;; https://stackoverflow.com/questions/20041904/eclipse-like-line-commenting-in-emacs
  (defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
      (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
        (setq beg (line-beginning-position) end (line-end-position)))
      (comment-or-uncomment-region beg end)
      (next-line)))
  (global-set-key (kbd "C-M-/") 'comment-or-uncomment-region-or-line)
  ;; (global-set-key [remap comment-or-uncomment-region] 'comment-or-uncomment-region-or-line)
  ;; (global-set-key (kbd "[?\C-c ?\C-/]") 'comment-or-uncomment-region-or-line)
  ;;  (global-set-key [?\C-c ?\C-/] 'comment-or-uncomment-region)
  ;;(global-set-key (kbd "M-/") 'comment-or-uncomment-region)
  ;; End comment or uncomments
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'config-eclipse-like)
