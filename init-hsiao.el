;; -----------------------------------------------------------------------------
;;
;;                    hsiao's Spacemacs Configurations.
;;
;;
;; -----------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       init-hsiao.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang xiao <xiaojianfang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao , Citi.Shanghai
;;
;;  PURPOSE:    Personal Mu 4 Emacs settings
;;  PROJECT:     https://github.com/hsiao/.spacemacs.d
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up personal configuration for my spacemacs.
;;
;;   note:- this is not all the configuration for init my personal.
;;          details:
;;
;;
;;    the two password/auth files MUST be protected at the operating system
;;    level (i.e. owner-only file access) and MUST NOT be added to revision
;;    control.
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;  Old logs up to tag 0.200 are in HISTORY.md
;;  See git log after for changes after 2017-03-06
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(message "------------------------------------------------------")
(hsiao/log "hsiao's emacs start to init...")
(message "hsiao's emacs start to init...")

(require 'f)
(require 's)
(require 'cl-lib)


;;(spacemacs/toggle-maximize-frame)              ;; 初始化后，最大化窗口
;;(when (string= system-type "darwin")           ;; macOS系统用command代替alter作为M键
;;  (setq mac-option-modifier 'super)
;;
;;(setq mac-command-modifier 'meta)
;;  (setq dired-use-ls-dired nil))               ;; macOS系统的ls不支持--dired这个option

;; -----------------------------------------------------------------------------
;; 最基本的全局load及features require
;; -----------------------------------------------------------------------------
(slpp-load-path-and-pkgs
  '(
     ;;("~/work/github/emacs-cookbook" "cookbook")
     ;;("~/.spacemacs.d/hotkey"                  ;; 按键相关放在hotkey/目录下
     ;; hsiao-basic-key-binding                  ;; 基本的快捷键设置
     ;; hsiao-global-key-binding                 ;; 全局的快捷键绑定
     ;; hsiao-major-mode-binding                 ;; local major mode key binding
     ;; )
     ("~/.spacemacs.d/parts"                     ;; 自己写的一些函数放在parts/目录下
       ;; emacs-nifty-tricks
       ;; copy-line                              ;; copy当前行
       ;; move-swift                             ;; 快速移动
       ;; hsiao-buffer                           ;; buffer相关
       ;; window-dealing                         ;; window相关
       ;; init-helm-hsiao                        ;; helm的初始化
       ;; insert-string                          ;; 插入基本字符串
       ;; hsiao-async-action
       ;; hsiao-persistent                       ;; 持久化存储
       ;; hsiao-swift
       ;; hsiao-gtd                              ;; getting things done
       ;; hsiao-utils                            ;; 工具函数
       ;; hsiao-face                             ;; 异步执行的任务
       ;; hsiao-org                              ;; org相关配置
       ;; hsiao-char                             ;; char相关操作
       ;; hsiao-cus                              ;; 一些对系统函数的定制
       ;; hsiao-diary                            ;; 日志相关
       ;; hsiao-deps                             ;; emacs运行需要的相关依赖
       ;; local-config
       )
     ("~/.spacemacs.d/configs"                   ;; configuration of uses
       ;;config-package                          ;; 包相关的
       ;; config-backup                          ;; 备份相关
       ;; config-c-lang                          ;; C语言相关
       ;; config-linux
       config-mac
       config-clojure                            ;; clojure语言相关
       config-general
       ;; config-coffee
       ;; config-deft
       ;; config-dired
       config-eclipse-like
       config-editorconfig
       config-rainbow-delimiters
       ;; config-elixir
       ;; config-erc
       ;; config-erlang
       ;; config-evil-key-bind
       ;;config-flycheck
       ;;config-flyspell
       ;; config-indent
       ;; config-inferior
       ;; config-ivy
       ;; config-java
       ;; config-js
       ;; config-keys
       ;; config-mail

       config-markdown
       ;;  config-mutt
       config-neotree
       ;; config-ocaml
       ;; config-org/config-org
       ;; config-org/config-org-page
       config-pyim
       ;; config-python
       ;; config-reason
       ;; config-scala
       ;; config-search
       config-shell
       ;; config-smex
       config-web
       ;; config-wl
       ;; config-work

       config-yasnippet
       ;;config-xml
       )
     )
  )
