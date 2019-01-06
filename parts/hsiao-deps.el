;;; hsiao-deps.el --- hsiao's emacs deps releated package

;; Copyright (C) 2017 hsiao Xiao

;; Author: hsiao Xiao <xiaojianfang558@gmail.com>
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.5") (exec-path-from-shell "1.11"))
;; This file is not part of GNU Emacs.

;;; Code:

(require 'exec-path-from-shell)

(defcustom hsiao/lang-go-deps
  '("github.com/nsf/gocode"
    "github.com/rogpeppe/godef"
    "golang.org/x/tools/cmd/oracle"
    "golang.org/x/tools/cmd/gorename"
    "golang.org/x/tools/cmd/goimports")
  "go language deps"
  :group 'hsiao
  :type 'sexp)

(defun hsiao/deps-verify ()
  "Make sure all deps installed."
  (interactive)
  (hsiao/deps-verify-lang-go))

(defun hsiao/deps-verify-lang-go ()
  "Check language go deps."
  (let ((go-path (exec-path-from-shell-getenv "GOPATH")))
    (message "start check go-lang deps.")
    (unless go-path
      (error "No go lanuage envs for $GOPATH."))
    (message "$GOPATH=%s" go-path)
    (mapc #'(lambda (pkg)
              (let ((path-pkg (expand-file-name
                               (concat "src/" pkg)
                               go-path
                               )))
                (unless (file-exists-p path-pkg)
                  (message "Warning: %s not installed." pkg))))  ;; color-line ?
          hsiao/lang-go-deps)
    (message "finished check go-lang deps.")))

(provide 'hsiao-deps)
;;; hsiao-deps.el ends here
