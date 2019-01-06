;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-general.el
;;  Created:    2018-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2018-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao<xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao James Citi,Shanghai
;;
;;  PURPOSE:    Personal General Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up general for my personal configuration
;;     (currently for hsiao only)
;;
;;   note:- this is all the configuration for general.
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



  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; elpa stable repository
  ;; if you want to disable the elpa stable repository put this in your dotfile in the user-init function:
  ;; (setq configuration-layer-elpa-archives '(("melpa" . "melpa.org/packages/")
  ;;   ("org" . "orgmode.org/elpa/") ("gnu" . "elpa.gnu.org/packages/")))
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;========================================================================================
;;         基础快捷键说明: M = Alt, C = Ctrl, M-x = Alt+x, C-s = Ctrl+s 以此类推
;;========================================================================================
;;                                  插件管理器配置
;;========================================================================================
;;
;;  M-x package-list-packages 列出插件列表
;;  i  - 选择要安装的包
;;  d  - 选择要删除的包
;;  U  - 升级已安装的包
;;  x  - 执行操作
;;  M-x package－install 插件名(这种方法也可以安装插件)
;;  C-s 搜索插件,再次按则向下继续搜索
;;
;;========================================================================================

;;========================================================================================
;;                                个人信息配置
;;========================================================================================
(setq user-full-name "Jianfang Xiao")
(setq user-mail-address "xiaojianfang558@gmail.com")

;; 设置个人信息,也许在某些地方有用
;;(setq user-full-name "JinLei Wang")
;;(setq user-mail-address "1976883731@qq.com")

;;设置初始工作目录
(if (string-equal system-type "windows-nt")
    (setq default-directory "G:\\projects")
  (setq default-directory "~/work"))

;;=======================================================================================
;;                                  设置(utf-8)模式
;;=======================================================================================
;;默认写入文件的编码
;;(setq default-buffer-file-coding-system 'utf-8)
;;默认读取文件的编码
;;(prefer-coding-system 'utf-8)
;;终端方式的编码方式
;;(set-terminal-coding-system 'utf-8)
;;键盘输入的编码方式
;;(set-keyboard-coding-system 'utf-8)
;;读取或写入文件名的编码方式
;;(setq file-name-coding-system 'utf-8)

;;========================================================================================
;;                                 Hook
;;========================================================================================
;; Remove line highlight when in magit mode
(add-hook 'magit-mode-hook (lambda () (setq-local global-hl-line-mode nil)))
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
  ;; 在所有编程语言里启动行号显示、hungry-delete-mode 和 80 字符指示器
  ;; 放在 config 里面没用
;;(add-hook 'prog-mode-hook (lambda ()
;;                              (nlinum-mode t)
;;                              (hungry-delete-mode)
;;                              (turn-on-fci-mode)))

(add-hook 'magit-mode-hook 'emoji-cheat-sheet-plus-display-mode)
;;========================================================================================
;;                                Spacemacs
;;========================================================================================
(spacemacs|add-company-backends :modes text-mode)
 ;; hide lighter
(spacemacs|diminish spacemacs-whitespace-cleanup-mode)
(spacemacs|diminish which-key-mode)

;;(setq ns-use-srgb-colorspace nil)
;;(setq powerline-default-separator 'utf-8);;contour
(setq spaceline-org-clock-p t)
;;(setq dotspacemacs-enable-paste-transient-state t)
;;(setq projectile-enable-caching t)
;;(spacemacs/toggle-line-numbers-on)
;;(spacemacs/toggle-auto-fill-mode-on)
;;(spacemacs/toggle-mode-line-minor-modes-off)
;;(spacemacs/toggle-fill-column-indicator-on)
;;(spacemacs/toggle-highlight-current-line-globally-off)
  
  ;; Make tweaks to spacemacs
;;(spaceline-toggle-buffer-position-off)
;;(spaceline-toggle-buffer-size-off)
;;(spaceline-toggle-hud-off)
;;(spacemacs/toggle-camel-case-motion-globally-on)
;;(spacemacs/toggle-mode-line-minor-modes-off))
;;(linum-relative-global-mode)
;; temp fix for ivy-switch-buffer
;; (spacemacs/set-leader-keys "bb" 'helm-mini)

  ;; show the filepath in the frame title
  ;; http://emacsredux.com/blog/2013/04/07/display-visited-files-path-in-the-frame-title/ 
 ;; (setq frame-title-format
 ;;       '((:eval (if (buffer-file-name)
 ;;                    (abbreviate-file-name (buffer-file-name))
 ;;                  "%b"))))
;;========================================================================================
;;                                显示空格及其颜色配置
;;========================================================================================
;; 显示空格
(require 'whitespace)
(global-whitespace-mode t)

;; 粉色代表超过80个字符的部分,由lines-tail 参数控制
;; space-mark 参数表示显示空格
;; newline-mark 表示显示末尾的$符号
;; lines-tail 表示显示超过80个字符后的部分,用粉色高亮
;; trailing 表示高亮显示行尾的空格
;; spaces 下面要控制whitespace-space就必须包含这个参数
;; newline 下面要控制whitespace-newline就必须包含这个参数
;; 根据时间自动切换主题

(setq whitespace-style
      '(face
        ;; trailing blanks
        trailing
        ;; empty lines at beginning and/or end of buffer
        ;; empty
        ;; line is longer `whitespace-line-column'
        lines-tail
        ;; tab or space at the beginning of the line according to
        ;; `indent-tabs-mode'
        indentation
        newline-mark
        newline
        ;; show tab as » (see `whitespace-display-mappings')
        tab-mark
        space-mark
        spaces
        ))
  ;; show whitespace
;;  (global-whitespace-mode t)
;;  (setq whitespace-mode t)

;; 设置空格字符的颜色
;;(set-face-attribute 'whitespace-space nil :background "black")
;;(set-face-attribute 'whitespace-space nil :foreground "dim gray")

;; 设置选中区域颜色
;;(set-face-background 'region "#1C86EE")
;;(set-face-foreground 'region "#000000")


;;========================================================================================
;;                                窗口背景配置
;;========================================================================================
;; 设置背景色
;; (set-background-color "black")

;; 启动emacs时全屏
;;(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 设置光标为竖线
(setq-default cursor-type 'bar)
;; (set-cursor-color "blue")  ;; 估计只有在GUI下才生效

;; 终端下鼠标支持,需要gpm
;; (xterm-mouse-mode t)
;;关闭启动动画
(setq inhibit-startup-message nil)
;;========================================================================================
;;                                默认备份配置
;;========================================================================================
;; 不生成备份文件，即 xxx.xx~ 类文件;; Preventing backup (~) files 
(setq make-backup-files nil) ;; don't make backup files 

;; 关闭未保存文件时退出,自动保存 #文件名# 这样的文件
(setq auto-save-default nil) ;; don't autosave

(setq create-lockfiles nil)  ;; don't make lock files
;;========================================================================================
;;                                行号列号配置
;;========================================================================================

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
;;(global-linum-mode t) ; always show line numbers

;;How to set linum line number to start at 0?
;;If you want line number to start at 0, put this in your emacs init file:

;;(require 'linum)
;;(setq linum-format
;;      (lambda (line)
;;        (propertize (number-to-string (1- line)) 'face 'linum)))
;;设置是否显示光标所在列号
;; Turn on column numbers
;;(setq column-number-mode t)
;; show cursor position within line

;;(column-number-mode 1)
;;设置是否显示光标所在行号(默认显示)
;;(line-number-mode t)
;; 内置的linum行号是左对齐,不舒服
;;(global-linum-mode t)
;; 显示行号
;; (set-face-background 'linum "#000000")

;;(set-face-foreground 'linum "#CD661D")
;; 设置行号格式
;;(setq linum-format "%d")

;;========================================================================================
;;                                    其他杂项配置
;;========================================================================================
;; 括号匹配
(show-paren-mode t)

;; 高亮显示当前行
(global-hl-line-mode 1)
;;(global-hl-line-mode -1)
;;(set-face-background 'hl-line "#3e4446")
;;(set-face-background 'hl-line "#BEBEBE")
;;(set-face-foreground 'hl-line "#000000")

;; 设置选中区域颜色
;;(set-face-background 'region "#1C86EE")
;;(set-face-foreground 'region "#000000")

;; 光标靠近鼠标指针时，让鼠标指针自动让开
(mouse-avoidance-mode 'animate)

;; 高亮显示选中的区域
(transient-mark-mode t)

;;设置光标不闪
(blink-cursor-mode t)
;;切换输入法不抖动
;;https://emacs-china.org/t/topic/186/33

(setq redisplay-dont-pause nil)

;;自动的在文件末增加一新行
(setq require-final-newline t)

;;当光标在行尾上下移动的时候，始终保持在行尾。
(setq track-eol t)

;; 关闭错误提示声
(setq visible-bell nil) ;;(setq visible-bell nil) ; disables beep and use visible bell
;;(setq echo-keystrokes 0.1
;;        use-dialog-box nil
;;        visible-bell t)

;; 不要总是没完没了的问yes or no,而是改用y/n
(fset 'yes-or-no-p 'y-or-n-p)

;;(setq mouse-yank-at-point t)
;;设置光标为线条状
(setq-default cursor-type 'bar)

;;------------------------------- global ------------------------------------------------
;;golden-ratio https://github.com/roman/golden-ratio.el
(golden-ratio-mode 1)
(global-hungry-delete-mode t)
(smartparens-global-mode)
;; Enable global flycheck mode if you need it
(global-flycheck-mode)
(global-company-mode)

;; 语法高亮
(global-font-lock-mode t)

;; 高亮括号配对
(electric-pair-mode)

;; 高亮括号配对
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; 保存上次光标所在位置
;; remember cursor position
(if (version< emacs-version "25.0")
    (progn
      (require 'saveplace)
      (setq-default save-place t))
  (save-place-mode 1))

;;高亮显示选中的区域
(transient-mark-mode t)

(font-lock-add-keywords 'lisp-mode '("[(]" "[)]"))
;; 输入左边的括号,就会自动补全右边的部分.包括(), "", [] , {} , 等等。
(electric-pair-mode t)

;; 在状态条显示当前光标在哪个函数体内部
(which-function-mode t)

;; 显示时间，格式如下;; date and time in status bar
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; 打开压缩文件时自动解压
(auto-compression-mode 1)

;; 设置TAB的默认宽度
(setq default-tab-width 2)
;;(setq python-indent-guess-indent-offset nil)
(setq-default indent-tabs-mode nil);

;; https://www.reddit.com/r/emacs/comments/53zpv9/how_do_i_get_emacs_to_stop_adding_custom_fields/
;;(benchmark-init/activate)

;; https://github.com/tumashu/cnfonts
;;(require 'cnfonts)
;; 让 cnfonts 随着 Emacs 自动生效。
;;(cnfonts-enable)
;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
;;(cnfonts-set-spacemacs-fallback-fonts)

;; 自动缩进
(setq-default c-basic-offset 2)
(global-set-key (kbd "RET") 'newline-and-indent)


;;========================================================================================
;;  注意下面的配置在EmacsGUI下才生效,如果不使用GUI则最好注释,如果不使用GUI最好也不要使用主题
;;========================================================================================
;; 设置字体
;; 先通过GUI的Set Default Font选择字体,然后M-x describe-font 获取字体信息,然后写在这里
;; 设置字体为Ubuntu-mono
;;(set-default-font "-DAMA-Ubuntu Mono-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")

;; 隐藏菜单栏、工具栏、滚动条
;;(tool-bar-mode 0)
;;(menu-bar-mode 0)
;;(scroll-bar-mode 0)


;;========================================================================================
;;                         当前被选中的所有替换成你输入的字符
;;========================================================================================
(delete-selection-mode t)


;;========================================================================================
;;                                   括号匹配插件
;;========================================================================================
(require 'highlight-parentheses)
(global-highlight-parentheses-mode t)


;;========================================================================================
;;          recentf-mode(Alt+o 打开最近使用过的文件),数据库在.emacs.d/recentf
;;========================================================================================
;;(recentf-mode t)
;;(setq recentf-max-menu-items 35)

;;========================================================================================
;;                                       透明
;;========================================================================================
;; (set-frame-parameter (selected-frame) 'alpha '(88 70))
;; (add-to-list 'default-frame-alist '(alpha 88 70))


;;========================================================================================
;;                                 根据窗口编号切换窗口
;; 按Alt+0 ~ 9 切换窗口
;;========================================================================================
(require 'window-numbering)
(window-numbering-mode t)

  ;; Disable lock files
;;  (setq create-lockfiles nil)

;;  (setq vc-follow-symlinks t)
;; Automatic update of the copyright year in file headers
  (when (fboundp 'copyright-update)
    (add-hook 'before-save-hook 'copyright-update))
  ;;; Setup the auto mode list for files without extensions
  (add-to-list 'auto-mode-alist '("\\.clang-format\\'" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.clang-tidy\\'" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.zshrc.local\\'" . shell-script-mode))
  (add-to-list 'auto-mode-alist '("\\.zshenv.local\\'" . shell-script-mode))
  (add-to-list 'auto-mode-alist '("\\.projectile\\'" . gitignore-mode))
  (add-to-list 'auto-mode-alist '("\\.ignore\\'" . gitignore-mode))
  (add-to-list 'auto-mode-alist '("\\.qss\\'" . css-mode))

;;(let ((ws (window-system)))
;;  (cond ((eq ws 'ns) (load "config-mac"))
;;  ((eq ws 'x) (load "config-linux"))))
;;(setq python-shell-virtualenv-path "/Users/zw/.virtualenvs/dj")

;; https://emacs-china.org/t/topic/5211/8
;;(setq browse-url-browser-function 'eww-browse-url)
;;(setq powerline-default-separator nil)
;;(fcitx-evil-turn-on)
;;(fcitx-aggressive-setup)

;;http://clojure-doc.org/articles/tutorials/emacs.html
;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "TERM=vt100 $SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setenv "CLASSPATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(provide 'config-general)
