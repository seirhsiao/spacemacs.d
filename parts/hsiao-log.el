;;; hsiao-log.el --- 用于打Log.

;; Copyright (C) 2018 hsiao Xiao

;;; Code:

(require 'subr-x)
(require 'f)
(defvar hsiao--log-file-name "~/.spacemacs.d/local/log.txt")

(defun hsiao/log-format (origin)
  "Format `ORIGIN' log with timestamp."
  (concat (format-time-string "[%Y-%m-%d %H:%M:%S] " (current-time))
          origin))

(defun hsiao/log (&rest args)
  "record &rest args as log into file `hsiao--log-file-name' and
   each line with timestamp as prefix."
  (unless (file-exists-p (f-dirname hsiao--log-file-name))
    (message "log file doesn't exists, create its directory %s!"
             (f-dirname hsiao--log-file-name))
    (mkdir (f-dirname hsiao--log-file-name) t))
  (with-temp-buffer
    (goto-char (point-max))
    (insert (hsiao/log-format (string-join args " ")))
    (insert "\n")
    (append-to-file (point-min) (point-max) hsiao--log-file-name)))

(provide 'hsiao-log)
;;; hsiao-log.el ends here
