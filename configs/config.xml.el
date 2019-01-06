(load "~/.emacs.d/nxml-mode-20041004/rng-auto.el")

(add-to-list 'auto-mode-alist
              (cons (concat "\\." (regexp-opt '("xml" "xsd" "sch" "rng" "xslt" "svg" "rss") t) "\\'")
                    'nxml-mode))
(when (> emacs-major-version 21)
  (setq magic-mode-alist
        (cons '("<\\?xml " . nxml-mode) magic-mode-alist)))
(fset 'xml-mode 'nxml-mode)
(fset 'html-mode 'nxml-mode)
(require 'rng-loc nil t)

(defun nxml-where ()
  "Display the hierarchy of XML elements the point is on as a path."
  (interactive)
  (let ((path nil))
    (save-excursion
      (save-restriction
        (widen)
        (while (and (< (point-min) (point)) ;; Doesn't error if point is at beginning of buffer
                    (condition-case nil
                        (progn
                          (nxml-backward-up-element) ; always returns nil
                          t)
                      (error nil)))
          (setq path (cons (xmltok-start-tag-local-name) path)))
        (if (called-interactively-p t)
            (message "/%s" (mapconcat 'identity path "/"))
          (format "/%s" (mapconcat 'identity path "/")))))))

(defun my-nxml-comment-region ()
  "comment a block if in nXML mode; else call comment-region"
  (interactive)
  ;; KLUDGE: should bind key in buffer, but I'm lazy
  (cond ((string-equal mode-name "nXML")
   (save-excursion
     (narrow-to-region (point) (mark))
     (goto-point-min)
     (save-excursion (replace-string "--" "\\-\\-"))
     (insert "<!--\n")
     (goto-point-max)
     (insert "-->\n")
     (widen)))
  (t (comment-region (point) (mark)))))

(defun my-nxml-uncomment-region ()
  "uncomment a block if in nXML mode; else call uncomment-region
assumes it was commented by my-nxml-comment-region"
  (interactive)
  ;; KLUDGE: should bind key in buffer, but I'm lazy
  (cond ((string-equal mode-name "nXML")
   (save-excursion
     (search-backward "<!--\n")
     (delete-char 5)
     (let ((start (point)) end)
       (search-forward "-->\n")
       (delete-char -4)
       (setq end (point))
       (save-excursion (replace-string "\\-\\-" "--" nil start end)))))
  (t (uncomment-region (point) (mark)))))

(add-hook 'nxml-mode-hook (lambda() (hs-minor-mode 1)))

(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "<!--\\|<[^/>]*[^/]>" ;; regexp for start block
               "-->\\|</[^/>]*[^/]>" ;; regexp for end block
               "<!--"
               nxml-forward-element
               nil))
(defun my-toggle-level ()
  "mainly to be used in nxml mode"
  (interactive) (hs-show-block) (hs-hide-level 1))

(eval-after-load "nxml-mode"
  '(progn
     (define-key nxml-mode-map (kbd "M-'") 'my-toggle-level)
     (define-key nxml-mode-map [mouse-3] 'my-toggle-level)))


(require 'auto-complete-nxml)
;;(require 'auto-complete-nxml nil t)
;; Keystroke for popup help about something at point.
(setq auto-complete-nxml-popup-help-key "C-:")

;; Keystroke for toggle on/off automatic completion.
(setq auto-complete-nxml-toggle-automatic-key "C-c C-t")

;; If you want to start completion manually from the beginning
(setq auto-complete-nxml-automatic-p nil)

(provide 'config-xml)
