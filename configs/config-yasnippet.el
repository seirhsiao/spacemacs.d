;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-yasnippet.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-12-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao <xiaojianfang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang xiao, Citi Shnaghai
;;
;;  PURPOSE:    Personal Mu 4 Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up yasnippet for my personal configuration
;;
;;   note:- this is not all the configuration for yasnippet.
;;          details:
;;
;;  ** Snippets directories
;;     The following directories are added by default:
;;  - ~/.emacs.d/elpa/yasnippet-xxxxx/snippets
;;  - ~/.emacs.d/layers/auto-completion/snippets
;;  - ~/.emacs.d/private/snippets
;; (conditional to the value of = auto-completion-private-snippets-directory)
;;  - ~/.spacemacs.d/snippets   = (conditional to the existence of '~/.spacemacs.d' directory)
;;   You can provide additional directories by setting the variable
;;   = auto-completion-private-snippets-directory= which can take a string in case of
;;  a single path or a list of paths.
;; If its value is =nil= then the path =~/.emacs.d/private/snippets= is used.
;; Customized yasnippets
;; Yasnippet is a template system for Emacs
;;    the two password/auth files MUST be protected at the operating system
;;    level (i.e. owner-only file access) and MUST NOT be added to revision
;;    control.
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

;;========================================================================================
;;                                 yasnippet模板系统
;;========================================================================================
;; https://github.com/AndreaCrotti/yasnippet-snippets # 模版下载地址
;;(require 'yasnippet)
;;(yas-global-mode t)

;;  (add-to-list 'yas-snippet-dirs "/Users/xiao/.emacs.d/private/snippets/yasnippet-snippets")
;; (with-eval-after-load 'yasnippet
;;  (setq yas-snippet-dirs (remq 'yas-installed-snippets-dir yas-snippet-dirs)))
;;
;; (when (require 'yasnippet nil 'noerror)
;; (progn
;;  (yas/load-directory "~/.emacs.d/snippets")))
;; Customized yasnippets
;; Yasnippet is a template system for Emacs
(defun join-dirs (root &rest dirs)
  "Join dirs ROOT DIRS."
  (if (not dirs)
    root
    (apply 'join-dirs
      (expand-file-name (car dirs) root)
      (cdr dirs))))

(defvar yasnippet-snippets (join-dirs user-emacs-directory "elpa" "yasnippet-snippets" "snippets"))
(add-to-list 'yas-snippet-dirs (join-dirs user-emacs-directory "private" "yasnippet-snippets" "snippets"))
;;(defvar go-snippets (join-dirs user-emacs-directory "snippets" "go-snippets" "snippets"))
;;(defvar rust-snippets (join-dirs user-emacs-directory "snippets" "rust-snippets" "snippets"))
(defvar third-snippets (join-dirs user-emacs-directory "snippets" "third-snippets"))
(defvar my-snippets (join-dirs user-emacs-directory  "snippets" "my-snippets"))

(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (setq yas-snippet-dirs '(yasnippet-snippets third-snippets my-snippets))
  (yas-reload-all)
  :ensure t
  :init
  (yas-global-mode t))

;    (use-package yasnippet-snippets
;      :ensure t)
;;(setq yas-snippet-dirs (append '("/home/xiao/.spacemacs.d/snippets") yas-snippet-dirs))
;;(setq-default yas--default-user-snippets-dir "/home/xiao/.spacemacs.d/snippets")

;;(require 'yasnippet)
;;(yas-global-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'config-yasnippet)
