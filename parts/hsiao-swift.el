;;; hsiao-swift.el --- some swift actions.

;; Copyright (C) 2016-2018  hsiao Xiao

;; Author: hsiao Xiao <xiaojianfang558@gmail.com>
;; Version: 0.1.0
;; Package-Requires: ((async "1.9"))
;; Keywords: emacs cookbook
;; URL: https://github.com/seirhsiao/.spacemacs.d

;; This file is NOT part of GNU Emacs.

;;; Commentary:

;; some swift action

;;; Code:

(require 'async)

(defun hsiao/magit-create-or-checkout-fix-branch ()
  "Crate (or checkout to) fix branch using magit."
  (interactive)
  (let* ((cbranch (magit-get-current-branch))
         (bname (format-time-string "fix%m%d" (current-time))))
    (if (member bname (magit-list-local-branch-names))
        (progn
          (magit-checkout bname)
          (message "checkout to branch %s success." bname)
          (force-mode-line-update))
      (if (and cbranch
               (not (string= cbranch bname))
               (string= "master" cbranch))
          (progn
            (magit-branch-and-checkout bname "master")
            (message "create & checkout to branch %s success." bname))
        (message "current branch is %s (not master), create branch %s failed." cbranch bname))
      (force-mode-line-update))))

(defun hsiao/swift-git-commit-push (msg)
  "Commit modified and push to upstream."
  (interactive "sCommit Message: ")
  (when (= 0 (length msg))
    (setq msg (format-time-string "commit by magit in emacs@%Y-%m-%d %H:%M:%S" (current-time))))
  (message "commit message is %s" msg)
  (when (and buffer-file-name
             (buffer-modified-p))
    (save-buffer))                                     ;; save it first if modified.
  (magit-stage-modified)
  (magit-commit (list "-m" msg))
  (let* ((begin-time (current-time)))
    (async-start
     `(lambda ()
        ,(async-inject-variables "\\`begin-time\\'")
        ,(async-inject-variables "\\`default-directory\\'")
        ,(async-inject-variables "\\`load-path\\'")    ;; main-process load-path.
        (require 'magit)
        (require 'hsiao-log)
        (hsiao/log (format "[[** start to execute push in directory %s" default-directory))
        (hsiao/log (shell-command-to-string "echo $PWD"))
        (when (file-exists-p default-directory)
          (hsiao/log (shell-command-to-string "git push"))
          (hsiao/log "finished push. **]]"))
        (format "%s push to upstream success. %s. time cost: %ss."
                (hsiao/log-format "")
                (or (magit-get "remote" "origin" "url") default-directory)
                (float-time (time-subtract (current-time) begin-time))))
     (lambda (result)
       (message "%s" result)))))

(defun hsiao/simple-git-commit-push (msg)
  "Simple commit current git project and push to its upstream."
  (interactive "sCommit Message: ")
  (when (= 0 (length msg))
    (setq msg (format-time-string "commit by magit in emacs@%Y-%m-%d %H:%M:%S"
                                  (current-time))))
  (message "commit message is %s" msg)
  (when (and buffer-file-name
             (buffer-modified-p))
    (save-buffer))                   ;; save it first if modified.
  (magit-stage-modified)
  (magit-commit (list "-m" msg))
  (magit-push-current-to-upstream nil)
  (message "now do async push to %s" (magit-get "remote" "origin" "url")))

(provide 'hsiao-swift)
;;; hsiao-swift.el ends here
