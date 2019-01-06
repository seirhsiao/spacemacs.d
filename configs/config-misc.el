


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-misc.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Flycheck Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up mics for my personal configuration
;;     (currently for hsiao only)
;;
;;   note:- this is all the configuration for misc.
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Misc packages;;;;;;;;;;;;;;;;;;;;;;;;;;; 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Highlights
  ;; Highlights the current cursor line
  (global-hl-line-mode t)
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; beacon 
  ;; flashes the cursor's line when you scroll
  (use-package beacon
  :ensure t
  :config
  (beacon-mode t)
  ;; (setq beacon-color "#666600")
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; hungry-delete  
  ;; deletes all the whitespace when you hit backspace or delete
  (use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode t))
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; multiple-cursors
  (use-package multiple-cursors
  :ensure t)

  ;; expand the marked region in semantic increments (negative prefix to reduce region)
  (use-package expand-region
  :ensure t
  :config 
  (global-set-key (kbd "C-=") 'er/expand-region))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; undo-tree
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode t))

(global-auto-revert-mode t) ;; you might not want this
(setq auto-revert-verbose nil) ;; or this
(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "<f6>") 'revert-buffer)
