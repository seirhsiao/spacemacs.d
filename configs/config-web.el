;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-web.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Web mode Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up web for my personal configuration
;;     (currently for hsiao only)
;;
;;   note:- this is all the configuration for web.
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

(require 'web-mode)

(setq js-indent-level 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(add-to-list 'auto-mode-alist '("\\.jsx" . web-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; web-mode configuration

;; update: variables in the html layer can be used rather than a hook

;; changing auto indent size for languages in html layer (web mode) to 2 (defaults to 4)
;; (defun jr0cket-web-mode-indent-hook ()
;;   "indent settings for languages in web mode, markup=html, css=css, code=javascript/php/etc."
;;   (setq web-mode-markup-indent-offset 2)
;;   (setq web-mode-css-indent-offset  2)
;;   (setq web-mode-code-indent-offset 2))
;; (setq-default
;;;;;;;;;;;;;;;;js2-mode;;;;;;;;;;;;;;;;;;
;; js2-basic-offset 2
;; js2-mode-show-parse-errors nil
;; js2-mode-show-strict-warnings nil
;;;;;;;;;;;;;;;;;web-mode;;;;;;;;;;;;;;;;;
;; css-indent-offset 2
;; web-mode-markup-indent-offset 2
;; web-mode-css-indent-offset 2
;; web-mode-code-indent-offset 2
;; web-mode-attr-indent-offset 2)
;;)
;; (add-hook 'web-mode-hook  'web-mode-indent-hook)

;; end of web-mode configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;========================================================================================
;;                             Web开发相关: js html css
;;========================================================================================
;; 把tern后端添加到company中
(require 'company-tern)
(add-to-list 'company-backends 'company-tern)
(add-to-list 'company-backends 'company-css)

;; 打开.js文件自动启动js2-mode
;; 打开.html文件自动启动web-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
         ("\\.html\\'" . web-mode)
         ("\\.css\\'" . css-mode))
       auto-mode-alist))

;; 打开js文件自动启动js补全
(add-hook 'js2-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode)))

;; 打开html文件自动开启js补全
(add-hook 'web-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode)
                           ))

;; 缩进为4个空格
;;(defun my-web-mode-indent-setup ()
;;  (setq web-mode-markup-indent-offset 4)
;;  (setq web-mode-css-indent-offset 4)
;;  (setq web-mode-code-indent-offset 4))
;;(add-hook 'web-mode-hook 'my-web-mode-indent-setup)


(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-enable-current-element-highlight t)   ;; 高亮当前行
(setq web-mode-enable-current-column-highlight t)    ;; 高亮当前列
;; auto-complete 源setting
;; (setq web-mode-ac-sources-alist
;;  '(("css" . (ac-source-css-property))
;;    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))

(provide 'config-web)
