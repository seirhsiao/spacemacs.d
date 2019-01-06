;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-neotree.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal Neotree Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up neotree for my personal configuration
;;     (currently for hsiao only)
;;
;;   note:- this is all the configuration for neotree.
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  all-the-icons-dired
;; https://github.com/jtbm37/all-the-icons-dired
;; (add-to-load-path (expand-file-name "/Users/xiao/work/dotfiles/emacs/emacs.d/private/local/all-the-icons-dired"))
(load "all-the-icons-dired.el")
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; End of the all the icons dired
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; all-the-icons
;; https://github.com/domtronn/all-the-icons.el
;; Installing Fonts
;; M-x all-the-icons-install-fonts

(use-package all-the-icons)
;; Usage
;; The simplest usage for this package is to use the following functions;
;; all-the-icons-icon-for-buffer
;; all-the-icons-icon-for-file
;; all-the-icons-icon-for-mode
;;
;; Which can be used to get a formatted icon which you can insert into buffers, e.g.
;; (insert (all-the-icons-icon-for-file "foo.js"))
;; Inserts a javascript icon
;; #("js-icon" 0 1 (display (raise -0.24) face (:family "alltheicon" :height 1.08 :foreground "#FFD446")
;; End of the all the icons
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Neotree configuration
;; Display neotree on the right rather than left (default)
;; (setq neo-window-position 'right)
;;
;; emacs-neotree
;; https://github.com/jaypei/emacs-neotree
;; https://github.com/Yangruipis/emacs_setting.git
;;
;;(add-to-list 'load-path "/some/path/neotree")
;; M-m p t
(require 'neotree)
(setq projectile-switch-project-action 'neotree-projectile-action)
(setq neo-show-hidden-files nil)
(setq neo-smart-open t)
;; (global-set-key [f2] 'neotree-toggle)
(global-set-key (kbd "<f8>") 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; (setq neo-vc-integration '(face))

(defun neotree-project-dir-toggle ()
  "Open NeoTree using the project root, using find-file-in-project,
or the current buffer directory."
  (interactive)
  (let ((project-dir
          (ignore-errors
           ;;; Pick one: projectile or find-file-in-project
                                        ; (projectile-project-root)
            (ffip-project-root)
            ))
         (file-name (buffer-file-name))
         (neo-smart-open t))
    (if (and (fboundp 'neo-global--window-exists-p)
          (neo-global--window-exists-p))
      (neotree-hide)
      (progn
        (neotree-show)
        (if project-dir
          (neotree-dir project-dir))
        (if file-name
          (neotree-find file-name))))))
(define-key global-map (kbd "<f8>") 'neotree-project-dir-toggle)

;;(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; End of Neotree configuration
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;(defun zw-neotree-find-project-root ()
;;  (interactive)
 ;; (let ((origin-buffer-file-name (buffer-file-name))
 ;;        (origin-buffer (current-buffer)))
;;    (neotree-find (projectile-project-root))
;;    (neotree-find origin-buffer-file-name)
;;    (switch-to-buffer origin-buffer)))

;;(evil-leader/set-key "px" 'zw-neotree-find-project-root)


;;========================================================================================
;;                                 neotree目录树插件
;;========================================================================================
;; H       切换显示隐藏文件。
;; C-c C-n 创建文件，若以 / 结尾则表示创建文件夹。
;; C-c C-d 删除文件或目录。
;; C-c C-r 重命名文件或目录。
;;(require 'neotree)
;;(neotree-toggle)
;; 不要老是自动改变项目根目录
;;(setq-default neo-autorefresh nil)
;; 设定窗口宽度
;;(setq neo-window-width 35)
;; 应用宽度
;;(neotree-stretch-toggle)
;;(neotree-stretch-toggle)
;; 设置宽度为不固定
;;(setq neo-window-fixed-size nil)
;; 默认移动到右边的窗口
;;(windmove-right)

(provide 'config-neotree)
