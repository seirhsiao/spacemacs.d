;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-keys.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Keys Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up keys for my personal configuration
;;     (currently for hsiao only)
;;
;;   note:- this is all the configuration for keys.
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
  ;; old-school emacs style keybindings that i am replacing with nicer spacemacs alternatives

  ;; jr0cket: text scaling keybindings - use spc z x =/-
  ;; (define-key global-map (kbd "c-+") 'text-scale-increase)
  ;; (define-key global-map (kbd "c--") 'text-scale-decrease)

  ;; smartparens keybindings - use lisp-state, spc k menu instead
  ;; (define-key global-map (kbd "c-)") 'sp-forward-slurp-sexp)
  ;; (define-key global-map (kbd "c-(") 'sp-backward-slurp-sexp)
  ;; (define-key global-map (kbd "m-)") 'sp-forward-barf-sexp)
  ;; (define-key global-map (kbd "m-(") 'sp-backward-barf-sexp)

  ;; jr0cket: keybindings for cycling buffers
  ;; use spc b n and spc b n instead
  ;; (global-set-key [c-prior] 'previous-buffer)
  ;; (global-set-key [c-next] 'next-buffer)

  ;; jr0cket: remap multiple cursors to a pattern that is easier to remember
  ;; learn iedit mode instead (its fantastic)
  ;; (define-key global-map (kbd "c-c m c") 'mc/edit-lines)

  ;; end of old-school bindings
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
