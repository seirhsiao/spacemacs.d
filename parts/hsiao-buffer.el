;;; hsiao-buffer.el --- buffer utils function.  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  hsiao Xiao

;; This file is NOT part of GNU Emacs.

;;; Commentary:

;; Buffer utils function.
;;

;;; Code:

(defun buffer-mode (buffer-or-string)
  "Returns the major mode associated with a buffer."
  (with-current-buffer buffer-or-string
    major-mode))

(defun get-buffer-mode-name (buffer-or-string)
  "Get the buffer major mode name."
  (interactive "bBuffer Name:")
  (message (with-current-buffer buffer-or-string
             major-mode)))

(defun get-current-file-name (arg)
  "Get the current buffer's file name"
  (interactive "P")
  (message (buffer-file-name (current-buffer)))) 

(defun hsiao/switch-buffer-each-other (arg)
  "switch current buffer with other window buffer 
   right-2-left and up-2-down, in emacs 26, use window-swap-states"
  (interactive "p")
  (if (version<= "26.1" emacs-version)
      (window-swap-states)
    (cond
     ((windmove-find-other-window 'right) (buf-move-right))
     ((windmove-find-other-window 'left) (buf-move-left))
     ((windmove-find-other-window 'up) (buf-move-up))
     ((windmove-find-other-window 'down) (buf-move-down))))
  (message "switch buffer done"))

(defun buffer-exists (bufname)   
  (not (eq nil (get-buffer bufname))))

(defvar hsiao/compile-log-buffer-name "*Compile-Log*")
(defun hsiao/save-compile-log-by-date (arg)
  "save each package install *Compile-Log* buffer content"
  (interactive "P")
  (if (not (buffer-exists hsiao/compile-log-buffer-name))
      (message "not buffer name *Compile-Log* exists!")
    (progn
      (let* ((current-buffer-save (current-buffer))
             (current-time-stamp-local
              (format-time-string "%Y-%m-%d-%H" (current-time)))
             (compile-log-file-name
              (format "~/.spacemacs.d/local/compile-log-%s.txt" current-time-stamp-local)))
        (save-current-buffer
          (message "*Compile-Log* save to '%s'" compile-log-file-name)
          (set-buffer hsiao/compile-log-buffer-name)
          (write-file compile-log-file-name)
          (save-buffer))))))

(defun hsiao/wrap-temp-buffer-name (buf-name)
  (downcase (if (and (string-suffix-p "*" buf-name)
                     (string-prefix-p "*" buf-name))
                (substring buf-name 1 (- (string-width buf-name) 1))
              buf-name)))

(defun hsiao/save-buffer-content-by-date (buf-name)
  (if (not (buffer-exists buf-name))
      (message "warning: not find buffer with name %s" buf-name)
    (progn
      (let* ((current-time-stamp-local
              (format-time-string "%Y-%m-%d-%H" (current-time)))
             (local-save-file-name
              (format "~/.spacemacs.d/local/%s-%s.txt" (hsiao/wrap-temp-buffer-name buf-name) current-time-stamp-local)))
        (save-current-buffer
          (message "save buffer %s content to %s" buf-name local-save-file-name)
          (set-buffer buf-name)
          (write-file local-save-file-name)
          (save-buffer))))))

(defun hsiao/save-message-content ()
  (if (not (buffer-exists "*Messages*"))
      (message "warning: not find buffer with name *Messages*")
    (progn
      (let* ((local-save-file-name "~/.spacemacs.d/local/Messages.txt"))
        (save-current-buffer
          (message "append buffer *Messages* content to %s" local-save-file-name)
          (set-buffer "*Messages*")
          (write-region (decode-coding-string (buffer-string) 'utf-8)
                        nil local-save-file-name 'append)
          ;;(append-to-file (point-min) (point-max) local-save-file-name)
          )))))

(defun hsiao/rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer '%s' is not visiting a file!" filename)
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
          ;;((get-buffer new-name)
          ;;     (message "A buffer named '%s' already exists!" new-name))
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

(defun hsiao/rename-file-and-new-buffer ()
  "Renames both current buffer and file it's visiting to NEW-NAME."
  ;;(interactive "sNew name: ")
  (interactive)
  (unless (buffer-file-name)
    (error "no visited file for current buffer."))
  (let* ((name (buffer-name))
         (filename (buffer-file-name))
         (ext (file-name-extension filename))
         (old-name (file-name-nondirectory filename))
         (new-name))
    (setq new-name (read-from-minibuffer
                    (format "New name (origin %s): " old-name) old-name ))
    (unless filename
      (error "Buffer '%s' is not visiting a file! Rename failed." name))
    (unless (s-contains? "." new-name)
      (setq new-name (concat new-name "." ext)))
    (when (equal current-prefix-arg '(4))
      (message "insert %% only"))
    (if (get-buffer new-name)
        (progn
          (message "A buffer named '%s' already exists! Use another name!" new-name)
          (rename-file name new-name 1)
          (rename-buffer (concat new-name "#" name))
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (when (listp recentf-list)
            (delete filename recentf-list)))
      (progn
        (rename-file name new-name 1)
        (rename-buffer new-name)
        (set-visited-file-name new-name)
        (set-buffer-modified-p nil)
        (when (listp recentf-list)
          (delete filename recentf-list))))))

(defun hsiao/delete-file-and-buffer ()
  "Delete current buffer and its visiting file.
   Kills the current buffer and deletes the file it is visiting"
  (interactive)
  (let ((filename (buffer-file-name)))
    (when (and filename
               (file-exists-p filename))
      (delete-file filename)
      (message "Deleted file %s" filename)
      (when (listp recentf-list)
        (delete filename recentf-list)))
    (when (buffer-exists (current-buffer))
      (kill-buffer))))

(defun hsiao/find-file (args)
  "find file in different style."
  (interactive "P")
  (if args
      (hsiao/create-file)
    (ido-find-file)))

(defun hsiao/create-file (&optional fname)
  "Create file in current default-directory."
  (interactive)
  (when (null fname)
    (setq fname (read-string (format "New file name in %s: " default-directory))))
  (when (s-blank-str? fname)
    (error "file name can not be empty!"))
  (find-file fname))

(defun hsiao/delete-file ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (when (yes-or-no-p
             (format "Do you really want to delete %s?" filename))
        (hsiao/delete-file-and-buffer)
        (message "file %s was deleted" filename)
        (when (listp recentf-list)
          (delete filename recentf-list))
        ))))

(defun hsiao/copy-selected-content ()
  "copy current selected content"
  (interactive)
  (if mark-active
      (progn
        (kill-new (buffer-substring (mark) (point)))
        (keyboard-quit))
    (progn
      (kill-new (buffer-string))
      (message "yon don't select any content. copy default current buffer content default."))))

(defun hsiao/delete-buffer ()
  "remove current buffer from recentf-list and kill it"
  (interactive)
  (let ((name (buffer-file-name)))
    (when (listp recentf-list)
      (delete name recentf-list))
    (kill-buffer)
    (message "buffer:%s was deleted!" name)
    ))

(defun hsiao/save-all-visited-files ()
  "Do save buffer list action."
  (interactive)
  (mapcar (lambda (elt)
            (save-current-buffer
              (set-buffer elt)
              (when (and buffer-file-name
                         (buffer-modified-p))
                (save-buffer)
                (message "- %s saved! -" buffer-file-name))))
          (buffer-list)))

(defun hsiao/create-temp-buffer (bname)
  "Create a temp buffer with timestamp as buffer name and switch to it!"
  (interactive "sBuffer Name(Default): ")
  (when (= 0 (length bname))
    (setq bname (format-time-string "*%Y-%m-%d_%H:%M*" (current-time))))
  (message "The temp buffer name is %s" bname)
  (switch-to-buffer (get-buffer-create bname)))

(defun hsiao/occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (deactivate-mark)
  (call-interactively 'occur))

(defun hsiao/occur-non-ascii ()
  "Find any non-ascii characters in the current buffer."
  (interactive)
  (occur "[^[:ascii:]]"))

(defun hsiao/indent-buffer ()
  "Indents the entire buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun hsiao/untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (hsiao/indent-buffer)
  (hsiao/untabify-buffer)
  (whitespace-cleanup))

(provide 'hsiao-buffer)
;;; hsiao-buffer.el ends here
