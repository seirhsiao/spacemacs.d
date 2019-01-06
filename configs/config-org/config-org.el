
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-org.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Org Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up org for my personal configuration
;;     (currently for hsiao only)
;;
;;   note:- this is all the configuration for org.
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


(require 'org-mime)
(require 'org-id)
(require 'org-clock)
(require 'org-habit)
(require 'org-mouse)
(require 'org-protocol)

(setq org-id-link-to-org-use-id 'use-existing)

(setq org-startup-indented t)

(setq org-directory "~/Dropbox/Notes/")

(setq org-default-notes-file (concat org-directory "organizer.org"))

(setq org-imenu-depth 5)

(setq org-list-allow-alphabetical t)

;; org-mode look
(defun jsg/org-mode-hook ()
  "My org-mode-hook function."
  (auto-fill-mode 1)

  (dolist (face '(org-level-1
                  org-level-2
                  org-level-3
                  org-level-4
                  org-level-5))
    (set-face-attribute face nil :weight 'semi-bold :height 1.0))

  )

(add-hook 'org-mode-hook 'jsg/org-mode-hook)

;;(require 'init-org/contacts)
;;(require 'init-org/agenda)

;;(require 'init-ora/shortcuts)
;;(require 'init-org/todo)
;;(require 'init-org/code)
;;(require 'init-org/captures)
;;(require 'init-org/mobile)
;;(require 'init-org/papers)
;;(require 'init-org/org-manage)
;;(require 'init-org/org-collector)
(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

(org-babel-do-load-languages 'org-babel-load-languages '((dot . t)))

(setq org-src-fontify-natively t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-mode configuration

;; i should write a toggle function to show descriptive or literate links in org-mode
;;(setq org-descriptive-links nil)

;; org-reveal - define were reveal.js files can be found
;; (i place reveal.js files in same directory as i write the org files)
(setq org-reveal-root ""
      )

;; define the location of the file to hold tasks
(with-eval-after-load 'org
  (setq org-default-notes-file "~/work/todo-list.org"))

;; Define a kanban style set of stages for todo tasks
(with-eval-after-load 'org
  (setq org-todo-keywords
    '((sequence "TODO" "DOING" "BLOCKED" "REVIEW" "|" "DONE" "ARCHIVED"))))

;;
Setting Colours (faces) for todo states to give clearer view of work
(with-eval-after-load 'org
  (setq org-todo-keyword-faces
    '(("TODO" . org-warning)
       ("DOING" . "yellow")
       ("BLOCKED" . "red")
       ("REVIEW" . "orange")
       ("DONE" . "green")
       ("ARCHIVED" .  "blue"))))

;; Progress Logging
;; When a TODO item enters DONE, add a CLOSED: property with current date-time stamp
(with-eval-after-load 'org
  (setq org-log-done 'time))

;; markdown mode hook for orgtbl-mode minor mode
(add-hook 'markdown-mode-hook 'turn-on-orgtbl)

;; turn on visual-line-mode for org-mode only
(add-hook 'org-mode-hook 'turn-on-visual-line-mode)
;;解决org表格里面中英文对齐的问题
(when (configuration-layer/layer-usedp 'chinese)
  (when (and (spacemacs/system-is-mac) window-system)
    (spacemacs//set-monospaced-font "Source Code Pro" "Hiragino Sans GB" 14 16)))
;;
;; end of org-mode configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'config-org)
