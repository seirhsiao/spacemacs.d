;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-reason.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Reason Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up reason for my personal configuration
;;     (currently for hsiao only)
;;
;;   note:- this is all the configuration for reason.
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


;; (defun chomp-end (str)
;;   "Chomp tailing whitespace from STR."
;;   (replace-regexp-in-string (rx (* (any " \t\n")) eos)
;;                             ""
;;                             str))

;; (let ((support-base-dir (concat (replace-regexp-in-string "refmt" "" (file-truename (chomp-end (shell-command-to-string "which refmt")))) ".."))
;;       (merlin-base-dir (concat (replace-regexp-in-string "ocamlmerlin" "" (file-truename (chomp-end (shell-command-to-string "which ocamlmerlin")))) "..")))
;;   ;; Add npm merlin.el to the emacs load path and tell emacs where to find ocamlmerlin
;;   (add-to-list 'load-path (concat merlin-base-dir "/share/emacs/site-lisp/"))
;;   (setq merlin-command (concat merlin-base-dir "/bin/ocamlmerlin"))

;;   ;; Add npm reason-mode to the emacs load path and tell emacs where to find refmt
;;   (add-to-list 'load-path (concat support-base-dir "/share/emacs/site-lisp"))
;;   (setq refmt-command (concat support-base-dir "/bin/refmt")))

;; (require 'reason-mode)
;; (require 'merlin)
;; (add-hook 'reason-mode-hook
;;           (lambda ()
;;             (add-hook 'before-save-hook 'refmt-before-save)
;;             (merlin-mode)
;;             (utop-minor-mode)))

;; (setq utop-command "opam config exec -- rtop -emacs")
;; ; (add-hook 'reason-mode-hook #'utop-minor-mode)

;; ; (setq merlin-ac-setup t)
