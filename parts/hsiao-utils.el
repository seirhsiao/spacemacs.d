;;; hsiao-utils.el --- hsiao's utils package.  -*- lexical-binding: t; -*-

;; Copyright (C) 2018 hsiao Xiao

;; Author: hsiao Xiao <xiaojianfang558@gmail.com>
;; Version: 0.1.0
;; Package-Requires: ((let-alist "1.0.3") (s "1.10.0"))
;; Keywords: utils

;;; Code:

(defun hsiao/create-scratch-buffer nil
  "create a scratch buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))

(defun hsiao/just-one-space-debug ()
  "Only for debug"
  (interactive)
  (message "count %d" (hsiao/cal-space-count)))

(defun hsiao/cal-space-count ()
  "Count how many space char."
  (let ((char-list (list (char-after)
                         (char-before))))
    (when (hsiao/is-space (char-after))
      (push (char-after (+ 1 (point))) char-list))
    (when (hsiao/is-space (char-before))
      (push (char-before (- (point) 1)) char-list))
    (reduce '+
            (mapcar
             #'(lambda (x)
                 (if (hsiao/is-space x)
                     1
                   0))
             char-list))
    ))

(defun hsiao/is-space (char)
  (or (eq ?\b char)   ;; 8 backspace, BS, C-h
      (eq ?\t char)   ;; 9 tab, TAB, C-i
      (eq ?\n char)   ;; 10 newline, C-j
      (eq ?\v char)   ;; 11 vertical tab, C-k
      (eq ?\s char)   ;; 32 space character, SPC
      ))

(defun hsiao/just-one-space (&optional n)
  "Intelligent version of just-one-space."
  (interactive "*p")
  (if (or (> (hsiao/cal-space-count) 1)
          (= (hsiao/cal-space-count) 0))
      (just-one-space)
    (just-one-space 0)))

(defun hsiao/get-ip (arg)
  "Get current machine local ip adress."
  (interactive "P")
  (insert (shell-command-to-string "ifconfig |egrep \"10\\.|172\\.|192\\.\" |awk '{print $2}'")))

(defun hsiao/copy-file-name-to-clipboard (arg)
  "Copy the current buffer file name to the clipboard."
  (interactive "P")
  (let ((filename (or (buffer-file-name) default-directory)))
    (unless arg
      (when (string-suffix-p "/" filename)    ;; path
        (setq filename (substring filename 0 (- (length filename) 1))))
      (setq filename (file-name-nondirectory filename)))
    (when filename
      (kill-new filename)
      (message "File name \"%s\" was copied to the clipboard." filename))))

;; http://stackoverflow.com/questions/28221079/ctrl-backspace-in-emacs-deletes-too-much/39438119#39438119
;; 当backward-word里有"\n"只到"\n"处时
(defun hsiao/backward-kill-word ()
  "Customize/Smart backward-kill-word."
  (interactive)
  (let* ((cp (point))
         (backword)
         (end)
         (space-pos)
         (backword-char (if (bobp)
                            ""           ;; cursor in begin of buffer
                          (buffer-substring cp (- cp 1)))))
    (if (equal (length backword-char) (string-width backword-char))
        (progn
          (save-excursion
            (setq backword (buffer-substring (point) (progn (forward-word -1) (point)))))
          (setq ab/debug backword)
          (save-excursion
            (when (and backword          ;; when backword contains space
                       (s-contains? " " backword))
              (setq space-pos (ignore-errors (search-backward " ")))))
          (save-excursion
            (let* ((pos (ignore-errors (search-backward-regexp "\n")))
                   (substr (when pos (buffer-substring pos cp))))
              (when (or (and substr (s-blank? (s-trim substr)))
                        (s-contains? "\n" backword))
                (setq end pos))))
          (if end
              (kill-region cp end)
            (if space-pos
                (kill-region cp space-pos)
              (backward-kill-word 1))))
      (kill-region cp (- cp 1)))         ;; word is non-english word
    ))

(defun hsiao/elisp-function-find ()
  "Find current elisp file function!"
  (interactive)
  (let* (collection key)
    (setq collection (hsiao/current-elisp-functions))
    (setq key (completing-read "find elisp function by name: "
                               collection))
    (let ((pos-line (assoc-default key collection)))
      (hsiao/push-marker-stack)
      (goto-line pos-line))))

(defun hsiao/current-elisp-functions ()
  "Get current elisp function defs"
  (let (result)
    (save-excursion
      (beginning-of-buffer)
      (while (and (not (eobp))
                  (string-match "(defun\s+" (buffer-substring (point) (point-max))))
        (let ((ft (re-search-forward "(defun\s+"))
              (fe (re-search-forward "\s")))
          (when (and ft fe)
            (add-to-list 'result `(,(format "%s %s" (line-number-at-pos) (s-trim (buffer-substring-no-properties ft fe)))
                                   .
                                   ,(line-number-at-pos)
                                   )
                         t))
          )))
    result))

(provide 'hsiao-utils)
;;; hsiao-utils.el ends here
