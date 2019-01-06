;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-package.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Package Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up package for my personal configuration
;;     (currently for hsiao only)
;;
;;   note:- this is all the configuration for package.
;;   details:
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;  Old logs up to tag 0.200 are in HISTORY.md
;;  See git log after for changes after 2017-03-06
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:



;;; config-package.el --- Package releated package.

;; Copyright (C) 2018 Hsiao Xiao

;; Author: hsiao xiao <xiaojiangang558@gmail.com>
;; Version: 0.1.0
;; This file is not part of GNU Emacs.

;;; Code:

;; (require 'use-package)
;; (require 'async)
;; (setq use-package-verbose t)

;; ;; --------------------------------------------------------------------
;; ;; exec-path-from-shell
;; ;; https://github.com/purcell/exec-path-from-shell
;; ;; --------------------------------------------------------------------
;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize))

;; ;; 下面是自己写的函数，主要是多电脑时，把安装的packages保存到一个文件里去
;; (setq hsiao/save-package-activated-list-file "~/.spacemacs.d/hsiao-installed-packages")
;; (defvar hsiao-installed-packages nil)

;; (defun hsiao/save-package-activated-list (&optional arg)
;;   "Save history information to file given by `helm-adaptive-history-file'."
;;   (interactive "p")
;;   (with-temp-buffer
;;     (insert
;;      ";; -*- mode: emacs-lisp -*-\n"
;;      ";; Installed packages list used for multi computer env.\n")
;;     (prin1 `(setq hsiao-installed-packages ',package-activated-list)
;;            (current-buffer))
;;     (insert ?\n)
;;     (write-region (point-min) (point-max) hsiao/save-package-activated-list-file nil
;;                   (unless arg 'quiet))))

;; ;; 关闭emacs的时候，保存下当前已经安装的packages
;; (add-hook 'kill-emacs-hook 'hsiao/save-package-activated-list)
;; ;; 打开emacs的时候，load安装的packages
;; (add-hook 'after-init-hook
;;           (lambda ()
;;             (when (file-readable-p hsiao/save-package-activated-list-file)
;;               (load-file hsiao/save-package-activated-list-file))))

;; ;;http://ergoemacs.org/emacs/elisp_printing.html
;; (defun hsiao/print-installed-packages (&optional arg)
;;   "print info installed packages"
;;   (interactive "p")
;;   (with-current-buffer (get-buffer-create ab-message-buffer-name)
;;     (dolist (pkg hsiao-installed-packages)
;;       (insert "\n")
;;       (princ pkg (current-buffer)))))

;; (defun async/install-missed-package (&optional arg)
;;   "install missed package"
;;   (interactive "p")
;;   (async-start
;;    '(lambda ()
;;       ;; install the missing packages
;;       (dolist (package hsiao-installed-packages)
;;         (message "package %s" package)
;;         (unless (package-installed-p package)
;;           (package-install package))))))

;; (defun hsiao/get-readme-file-path (name)
;;   (format "%s/%s-readme.txt" package-user-dir name))

;; (defun hsiao/get-pkg-info (pkg)
;;   "获得包的详细说明，readme文件内容"
;;   (interactive)
;;   (let ((file-content (with-temp-buffer
;;                         (insert-file-contents (hsiao/get-readme-file-path pkg))
;;                         (buffer-string))))
;;     (format "package %s info:\n %s\n\n %s"
;;             pkg
;;             (hsiao/get-readme-file-path pkg)
;;             file-content)))

;; ;; 这里也是使用ivy-read的一个例子
;; (defun hsiao/search-pkg-installed ()
;;   "搜索已经安装的包名,选择后显示包的ReadeMe内容"
;;   (interactive)
;;   (ivy-read "search installed package name: "
;;             (remove-duplicates (mapcar (lambda (elt)
;;                                          (symbol-name elt))
;;                                        hsiao-installed-packages)
;;                                :test 'string=)
;;             :action (lambda (x)
;;                       (with-help-window
;;                           (help-buffer)
;;                         (print (hsiao/get-pkg-info x))))))

;; ;; 异步的列出packages
;; (defun async/list-packages ()
;;   "package-install async"
;;   (interactive)
;;   (async-start
;;    `(lambda ()
;;       (setq package-archives
;;             '(("melpa"         . "http://melpa.org/packages/")
;;               ("org"         . "http://orgmode.org/elpa/")
;;               ("marmalade"   . "http://marmalade-repo.org/packages/")
;;               ("popkit" . "http://elpa.popkit.org/packages/")))
;;       (require 'finder-inf nil t)
;;       ;; Initialize the package system if necessary.
;;       (package-initialize t)
;;       (setq coding-system-for-write 'utf-8-unix)
;;       (let (old-archives new-packages)
;;         ;; Read the locally-cached archive-contents.
;;         (package-read-all-archive-contents)
;;         (setq old-archives package-archive-contents)
;;         ;; Fetch the remote list of packages.
;;         (package-refresh-contents)
;;         ;; Find which packages are new.
;;         (dolist (elt package-archive-contents)
;;           (unless (assq (car elt) old-archives)
;;             (push (car elt) new-packages)))
;;         (setq result-prev (list new-packages package-archive-contents))))
;;    `(lambda (result)
;;       (setq package-archive-contents (cadr result))
;;       (let ((new-packages (car result)))
;;         ;; Generate the Package Menu.
;;         (let ((buf (get-buffer-create "*Packages*")))
;;           (with-current-buffer buf
;;             (package-menu-mode)
;;             (set (make-local-variable 'package-menu--new-package-list)
;;                  new-packages)
;;             (package-menu--generate nil t))
;;           ;; The package menu buffer has keybindings.  If the user types
;;           ;; `M-x ab/list-packages', that suggests it should become current.
;;           (switch-to-buffer buf))

;;         (let ((upgrades (package-menu--find-upgrades)))
;;           (if upgrades
;;               (message "%d package%s can be upgraded; type `%s' to mark %s for upgrading."
;;                        (length upgrades)
;;                        (if (= (length upgrades) 1) "" "s")
;;                        (substitute-command-keys "\\[package-menu-mark-upgrades]")
;;                        (if (= (length upgrades) 1) "it" "them"))))))))

;; ;; 确实包被安装，如果没安装，刚安装之
;; (defun ensure-package-installed (&rest packages)
;;   "Assure every package is installed, ask for installation if it’s not.
;; Return a list of installed packages or nil for every skipped package."
;;   (mapcar
;;    (lambda (package)
;;      (unless (package-installed-p package)
;;        (if (y-or-n-p (format "Package %s is missing. Install it? " package))
;;            (package-install package)
;;          package)))
;;    packages))

;; ;; make sure to have downloaded archive description.
;; ;; Or use package-archive-contents as suggested by Nicolas Dudebout
;; (or (file-exists-p package-user-dir)
;;     (package-refresh-contents))

;; ;;(ensure-package-installed 'find-file-in-project 'swiper);
;; (when (boundp hsiao-installed-packages)
;;   (message "hsiao-installed-packages exists!")
;;   (dolist (pkg hsiao-installed-packages)
;;     (message "%s\n" pkg)))

;; (ensure-package-installed 'find-file-in-project 'swiper);
;; (global-set-key (kbd "C-x f") 'find-file-in-project)

;; (provide 'config-package)
;; ;;; package-part.el ends here
