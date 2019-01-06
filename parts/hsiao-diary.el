;;; hsiao-diary.el --- hsiao' diary package

;; Copyright (C) 2017 hsiao Xiao

;; Author: hsiao Xiao <xiaojianfang558@gmail.com>
;; Version: 0.1.0
;; This file is not part of GNU Emacs.

;;; Code:


(defcustom hsiao/diary-root-path "~/work/github/diary"
  "Root diary path"
  :group 'hsiao
  :type 'string)

(defun hsiao/diary-header-content (&optional date-str)
  (concat
   (format "#+TITLE: %s\n" (or date-str (format-time-string "%Y-%m-%d")))
   "#+AUTHOR: hsiao\n"
   (format "#+DATE: %s\n" (format-time-string "%Y-%m-%d %H:%M" (current-time)))
   "#+EMAIL: xiaojianfang558@gmail.com\n"
   "#+LANGUAGE: zh\n"
   "#+LATEX_HEADER: \\usepackage{xeCJK}\n\n"
   "#+SETUPFILE: ~/work/github/org-html-themes/setup/theme-readtheorg.setup\n\n"
   "-----\n"))

(defun hsiao/diary-create (arg)
  (interactive "P")
  (let* ((date-str (format-time-string "%Y-%m-%d" (if arg (hsiao/diary-time-plus-day -1) (current-time))))
         (date-name (format "%s.org" date-str))
         file-name)
    (setq file-name (read-from-minibuffer
                     (format "Diary name (default %s): " date-name) date-name ))
    (setq file-name (expand-file-name file-name hsiao/diary-root-path))
    (find-file file-name)
    (unless (file-exists-p file-name)
      (insert (hsiao/diary-header-content date-str)))
    ;;(save-buffer)
    (message "diary name=%s" file-name)
    ))

(defun hsiao/diary-time-plus-day (day)
  "Current time plus day,
   Ref. https://www.gnu.org/software/emacs/manual/html_node/elisp/Time-Calculations.html"
  (time-add (current-time) (* day 24 60 60)))

(provide 'hsiao-diary)
;;; hsiao-diary.el ends here
