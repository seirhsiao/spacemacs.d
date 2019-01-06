;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-python.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Python Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up python for my personal configuration
;;     (currently for hsiao only)
;;
;;   note:- this is all the configuration for python.
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


;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (progn
;;               (add-to-list 'python-shell-extra-pythonpaths "/home/xiao/.emacs.d/.cache/anaconda-mode/0.1.9/jedi-0.12.1-py3.6.egg")
;;               (add-to-list 'python-shell-extra-pythonpaths "/home/xiao/.emacs.d/.cache/anaconda-mode/0.1.9/parso-0.2.0-py3.6.egg")
;;               (add-to-list 'python-shell-extra-pythonpaths "/home/xiao/.emacs.d/.cache/anaconda-mode/0.1.9/service_factory-0.1.5-py3.6.egg"))))
;;========================================================================================
;;                                      Python
;;========================================================================================
(setq py-python-command "python3")
(setq elpy-rpc-python-command "python3") ;; 这条命令才是Python3补全的关键,前提是在shell中可以直接敲python3进入python shell
(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")
;;(setq pyvenv-virtualenvwrapper-python "/usr/bin/python3") ;; 如果没有使用虚拟环境,这条可以不启用
(require 'elpy)
;; 开启elpy插件
(elpy-enable)
;; 关闭缩进提示线
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))
;; C-cC-c 直接运行当前python文件,主要用于单元测试
(defun shell-command-on-buffer()
(interactive)
(shell-command (concat "python3 " (buffer-file-name))))  ;; 这里运行的是Python3哦
(defvar my-keys-minor-mode-map
(let ((map (make-sparse-keymap)))
(define-key map (kbd "C-c C-c") 'shell-command-on-buffer) map) "my-keys-minor-mode keymap.")
(define-minor-mode my-keys-minor-mode "A minor mode so that my key settings override annoying major modes." :init-value t :lighter " Unit-Test(C-c C-c)")
(my-keys-minor-mode 1)
(setq elpy-company-add-completion-from-shell t)

;; F5运行,比上面的好处是有shell回显
(defun python/run-current-file (&optional directory)
  "Execute the current python file."
  (interactive
   (list (or (and current-prefix-arg
                  (read-directory-name "Run in directory: " nil nil t))
             default-directory)))
  (when (buffer-file-name)
    (let* ((command (or (and (boundp 'executable-command) executable-command)
                        (concat "python3 " (buffer-file-name))))
           (default-directory directory)
           (compilation-ask-about-save nil))
      (executable-interpret (read-shell-command "Run: " command)))))
(define-key python-mode-map [f5] 'python/run-current-file)

;;========================================================================================
;;                                    实时代码检查
;;========================================================================================
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))
;;如果使用的是Python3,则需用pip3安装pylint否则,实时代码检查将不可用
(setq flycheck-python-pylint-executable "/usr/bin/pylint") ;; 这里指定pylint的位置

;;========================================================================================
;;             遵循PEP8规范,保存时自动格式化代码，并纠正所有不符合PEP8标准的错误
;;========================================================================================
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)  ;; 要注意,如果没有把python3的bin目录加入环境变量,那么这个也是无法正常工作的哦

;; windows下需要开启下面的,并且需要安装KDiff3这个软件，否则autopep8无法正常使用
;(add-hook 'before-save-hook 'delete-trailing-whitespace)
;(add-hook 'find-file-hook 'find-file-check-line-endings)

;(defun dos-file-endings-p ()
;(string-match "dos" (symbol-name buffer-file-coding-system)))
;(defun find-file-check-line-endings ()
;(when (dos-file-endings-p)
;     (set-buffer-file-coding-system 'undecided-unix)
;     (set-buffer-modified-p nil)))
