;;; hsiao-core.el --- hsiao's core package

;; Copyright (C) 2016-2018 hsiao Xiao

;; Author: Hsiao Xiao <xiaojianfang558@gmail.com>
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.4") (elisp-slime-nav "0.9"))
;; This file is not part of GNU Emacs.

;;; Code

(require 'elisp-slime-nav)

(defgroup hsiao nil
  "hsiao package group"
  :prefix "hsiao-"
  :group 'convenience)

(defun hsiao/push-marker-stack ()
  "Push marker to stack."
  (if (fboundp 'xref-push-marker-stack)
      (xref-push-marker-stack)
    (with-no-warnings
      (ring-insert find-tag-marker-ring (point-marker)))))

(defun hsiao/pop-tag-mark ()
  "Rewrite pop-tag-mark alias xref-pop-marker-stack to fix multi-window back.
   Pop back to where \\[xref-find-definitions] was last invoked."
  (interactive)
  (unless (boundp 'ggtags-mode)
    (spacemacs/ggtags-mode-enable))   ;; 开启 ggtags-mode
  (let ((ring xref--marker-ring))
    (when (ring-empty-p ring)
      (user-error "Marker stack is empty"))
    (let* ((marker (ring-remove ring 0))
           (mbuffer (or (marker-buffer marker)
                        (user-error "The marked buffer has been deleted")))
           (mwindow (get-buffer-window mbuffer)))
      (when mwindow
        (select-window mwindow))
      (switch-to-buffer mbuffer)
      (goto-char (marker-position marker))
      (set-marker marker nil nil)
      (run-hooks 'xref-after-return-hook))))

(defun hsiao/nav-thing-at-point (input)
  "Nav to adopt position in different mode-line"
  (interactive (list (elisp-slime-nav--read-symbol-at-point)))
  (cond ((or (eq major-mode 'emacs-lisp-mode)
             (eq major-mode 'inferior-emacs-lisp-mode))
         (elisp-slime-nav-find-elisp-thing-at-point input))
        ((eq major-mode 'go-mode)
         (godef-jump (point)))
        ((eq major-mode 'ruby-mode)
         (robe-jump))   ;; TODO need fix
        (t (message "not found suitable nav-thing-at-point."))))

(provide 'hsiao-core)
;;; hsiao-core.el ends here
