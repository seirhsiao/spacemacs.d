;; some async actions, which will cost some time running in background.
(defvar hsiao-git-project-list
  '(
    "dotfiles" 
    "~/.emacs.d/"
    "~/.spacemacs.d/" 
    ;;"popkit" 

    ;;"piece-meal" 
    ;;"pelpa"
    ;;"eden" 
    ;;"leanote-mode" 
    ;;"v2ex-mode" 
    ;;"learn-elisp-by-examples"
    ;;"multi-term-plus" 
    ;;"eeb" 
    ;;"emacs-neotree" 
    ;;"nicemacs"
    ;;"appkit-web" 
    ;;"emacs-cookbook" 
    ;;"emacsist" 
    ;;"diary"
    ;;"kick-starter"
    ))

(defun hsiao/git-code-update ()
  "update code async."
  (interactive)
  (let* ((begin-time (current-time)))
    (async-start
     ;; 异步执行更新code操作
     `(lambda ()
        ,(async-inject-variables "\\`load-path\\'")
        ,(async-inject-variables "\\`hsiao-git-project-list\\'")
        ,(async-inject-variables "\\`begin-time\\'")
        (require 'hsiao-log)
        (require 'subr-x)
        (hsiao/log "exec-when-emacs-boot....")
        (dolist (elt hsiao-git-project-list)
          (let* ((working-directory
                  (if (or (string-prefix-p "/" elt) (string-prefix-p "~" elt))
                      elt
                    (concat "~/work/github/" elt "/")))
                 (default-directory working-directory))
            (unless (file-exists-p default-directory)
              (hsiao/log (format "path %s doesnot exists" default-directory)))
            (when (file-exists-p default-directory)
              (hsiao/log (shell-command-to-string "echo $PWD"))
              ;; 执行操作是异步的!
              (hsiao/log (shell-command-to-string "git pull")))))
        (hsiao/log "finished hsiao/git-code-update.")
        begin-time)
     (lambda (result)
       (message "%s hsiao/git-code-update finished. time cost: %ss"
                (hsiao/log-format "")
                (float-time (time-subtract (current-time) result)))))))

(provide 'hsiao-async-action)
