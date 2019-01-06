;; boost find file and load saved persp layout  performance
;; which will break some function on windows platform
;; eg. known issues: magit related buffer color, reopen will fix it

;;https://gist.github.com/jakemcc/3887459
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(if window-system (set-exec-path-from-shell-PATH))


(when (spacemacs/system-is-mswindows)
  (progn (setq find-file-hook nil)
         (setq vc-handled-backends nil)
         (setq magit-refresh-status-buffer nil)
         (add-hook 'find-file-hook 'spacemacs/check-large-file)

         ;; emax.7z in not under pdumper release
         ;; https://github.com/m-parashar/emax64/releases/tag/pdumper-20180619
         (defvar emax-root (concat (expand-file-name "~") "/emax"))

         (when (file-exists-p emax-root)
           (progn
             (defvar emax-root (concat (expand-file-name "~") "/emax"))
             (defvar emax-bin (concat emax-root "/bin"))
             (defvar emax-bin64 (concat emax-root "/bin64"))
             (defvar emax-mingw64 (concat emax-root "/mingw64/bin"))
             (defvar emax-lisp (concat emax-root "/lisp"))

             (setq exec-path (cons emax-bin exec-path))
             (setenv "PATH" (concat emax-bin ";" (getenv "PATH")))

             (setq exec-path (cons emax-bin64 exec-path))
             (setenv "PATH" (concat emax-bin64 ";" (getenv "PATH")))

             (setq exec-path (cons emax-mingw64 exec-path))
             (setenv "PATH" (concat emax-mingw64 ";" (getenv "PATH")))))

         (add-hook 'projectile-mode-hook '(lambda () (remove-hook 'find-file-hook #'projectile-find-file-hook-function)))))

;; windows下需要开启下面的,并且需要安装KDiff3这个软件，否则autopep8无法正常使用
;(add-hook 'before-save-hook 'delete-trailing-whitespace)
;(add-hook 'find-file-hook 'find-file-check-line-endings)

;(defun dos-file-endings-p ()
;(string-match "dos" (symbol-name buffer-file-coding-system)))
;(defun find-file-check-line-endings ()
;(when (dos-file-endings-p)
;     (set-buffer-file-coding-system 'undecided-unix)
;     (set-buffer-modified-p nil)))
;; solve org table Chinese and English text align issue
  (when (configuration-layer/layer-usedp 'chinese)
    (when (and (spacemacs/system-is-mac) window-system)
      (progn
        (spacemacs//set-monospaced-font "Operator Mono Lig" "Hiragino Sans GB" 16 18)
        (set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji" :size 12)))))

  ;; Setting Chinese Font
  (when (and (spacemacs/system-is-mswindows) window-system)
    ;; Git location
    (add-to-list 'exec-path "C:/Program Files/Git/bin")
    ;; Aspell location
    (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin")
    (setq ispell-program-name "aspell")

    (setq w32-pass-alt-to-system nil)
    (setq w32-apps-modifier 'super)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        (font-spec :family "Microsoft Yahei" :size 18))))

  ;; set the width threshold to split window horizontally
  (setq-default split-width-threshold 120)

 ;; diminish modes
  (spacemacs|diminish meghanada-mode " ⓜ" " M")
  (spacemacs|diminish company-box-mode)
  (spacemacs|diminish which-key-mode)
  (spacemacs|diminish smartparens-mode)
  (spacemacs|diminish hybrid-mode)
  (spacemacs|diminish mmm-mode)
  (spacemacs|diminish tide-mode)
  (spacemacs|diminish dired-omit-mode)
  (spacemacs|diminish all-the-icons-dired-mode)
  (spacemacs|diminish helm-gtags-mode)
  (spacemacs|diminish ggtags-mode)
  (spacemacs|diminish counsel-mode)
  (spacemacs|diminish importmagic-mode)
  (spacemacs|diminish whitespace-mode)
  (spacemacs|diminish hungry-delete-mode)
  (spacemacs|diminish spacemacs-whitespace-cleanup-mode)
