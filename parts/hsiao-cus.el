;;; hsiao-cus.el --- 一些对系统函数的定制

;; Copyright (C) 2017 hsiao Xiao

;;; Commentary:

;; some swift action

;;; Code:

(defun hsiao/beginning-of-buffer (&optional arg)
  (interactive)
  (hsiao/push-marker-stack)
  (beginning-of-buffer arg))

(defun hsiao/end-of-buffer (&optional arg)
  (interactive)
  (hsiao/push-marker-stack)
  (end-of-buffer))

(provide 'hsiao-cus)
;;; hsiao-cus.el ends here
