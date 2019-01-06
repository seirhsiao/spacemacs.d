;;; hsiao-char.el --- hsiao's char-releated actions.  -*- lexical-binding: t; -*-

;; Copyright (C) 2016 hsiao Xiao

;; Author: hsiao Xiao <xiaojianfang558@gmail.com>
;; Version: 0.1.0
;; Keywords: char

;;; Code:

(require 'hsiao-core)

(defcustom hsiao-replace-pairs
  [
   ["." "。"]
   ["," "，"]
   [":" "："]
   [";" "；"]
   ["?" "？"]
   ["!" "！"]
   ]
  "replace pairs"
  :group 'hsiao
  :type 'sexp)

;;;###autoload
(defun hsiao/convert-en-punctuation-to-cn (args)
  "Convert English punctuation to chinese style or vice versa."
  (interactive "P")
  (if args
      (hsiao/loop-each-char-action 'hsiao/do-convert-action t)
    (hsiao/loop-each-char-action 'hsiao/do-convert-action))
  (if buffer-file-name
      (save-buffer)))

(defun hsiao/loop-each-char-action (action &optional args)
  "Do loop `ACTION' iterator for each char in current buffer."
  (unless (functionp action)
    (error "Argument action needs function type."))
  (save-excursion
    (goto-char (point-min))
    (while (not (eobp))
      (funcall action args)
      (forward-char))))

(defun hsiao/is-A-to-Z (char)
  "char a(A) ~ z(Z), 0~9"
  (and
   (>= char 33)
   (<= char 126)))

(defun hsiao/do-convert-action (&optional versa)
  "do convert action"
  (let* ((cchar (char-after))                   ;; char current
         (cachar (char-after (+ (point) 1)))    ;; char after
         (cbchar (char-before (point))))        ;; char before
    (mapc
     (lambda (x)
       (when (and
              (string= (aref x 0) (string cchar))
              (or versa
                  (or (not cbchar) (not (hsiao/is-A-to-Z cbchar))))
              (or versa
                  (not (hsiao/is-A-to-Z cachar))))
         (hsiao/replace-current-char (aref x 1))))
     (if versa
         (mapcar (lambda (x) (vector (elt x 1) (elt x 0))) hsiao-replace-pairs)
       hsiao-replace-pairs))
    ))

(defun hsiao/replace-current-char (char)
  "Replace current char with `CHAR'"
  (unless (or (characterp char)
              (stringp char))
    (error "Argument error, need char or string type."))
  (delete-char 1)
  (insert char))

(provide 'hsiao-char)
;;; hsiao-char.el ends here
