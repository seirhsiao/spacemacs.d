
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-org-page.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Org-page Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up org-page for my personal configuration
;;     (currently for hsiao only)
;;

;;   note:- this is all the configuration for org-page.
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


(require 'org-page)
(setq op/repository-directory "~/work/github/blog/blog.hsiao.me")   ;; the repository location
(setq op/site-domain "http://seirhsiao.me/")         ;; your domain hsiao.me


(setq op/site-main-title "hsiao")
(setq op/site-sub-title "思考创造个性，个性成就自我！")
(setq op/personal-github-link "https://github.com/aborn")
(setq op/personal-avatar nil)

(setq op/repository-org-branch "source") ;; default is "source"
(setq op/repository-html-branch "gh-pages")  ;; default is "master"




;; (setq op/personal-avatar "http://m1.s1.dpfile.com/sc/api_res/weather/found_cloud.jpg")
(setq op/personal-duoshuo-shortname "hsiao")   ;; your duoshuo commenting system

(global-set-key (kbd "C-c p") (lambda ()
                                (interactive)
                                (op/do-publication t nil nil t t)  ;; 最后一个参数表示自动push
                                (message "发布完成!")))

(provide 'config-org-page)
