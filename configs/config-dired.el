;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-dired.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Deft Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up diredful for my personal configuration
;;      (currently for hsiao only)
;;
;;   note:- this is all the configuration for diredful.
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

("directories" "symlinks" "ruby" "python" "lisp" "text" "data" "images" "javascript" "html")

(("directories" (:foreground "SteelBlue1") "d.*" 1 nil t nil)
 ("symlinks" (:foreground "LightSkyBlue1") "lrwx" 1 nil t nil)
 ("ruby" (:foreground "indian red") "rb" nil nil nil t)
 ("python" (:foreground "spring green") "py" nil nil nil t)
 ("lisp" (:foreground "chartreuse") "el" nil nil nil t)
 ("text" (:foreground "salmon") "txt text rst markdown" nil nil nil t)
 ("data" (:foreground "gold1") "xml yaml json csv xls" nil nil nil t)
 ("images" (:foreground "slate gray") "jpe?g gif png bmp svg xpm pbm ico xbm ai tiff? " nil nil nil t)
 ("javascript" (:foreground "medium slate blue") "js" nil nil nil t)
 ("html" (:foreground "orange1") "html j2" nil nil nil t))



  ;; ;; (global-set-key [(control tab)] 'my-indent-or-complete)
  ;; (global-set-key [(tab)] 'my-indent-or-complete)
  ;;让 dired 可以递归的拷贝和删除目录
  (setq dired-recursive-copies 'top)
  (setq dired-recursive-deletes 'top)

  ;; Install all-the-icons from melpa.

  ;; Manually
  ;; Clone the repo
  ;; Add the cloned repo path to your load path
  ;; Add this snippet to your init.el
  ;;(add-to-load-path (expand-file-name "~/path/to/all-the-icons-dired"))
  ;;(load "all-the-icons-dired.el")
  ;;(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
  ;;From melpa
  ;;Add this snippet to your init.el
 (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
 (provide 'config-dired')
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
