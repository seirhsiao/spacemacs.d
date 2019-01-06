  ;; Make sure that semantic does not go crazy on elisp comments
  ;; https://github.com/syl20bnr/spacemacs/pull/7736#issuecomment-313320906
  (use-package semantic
    :defer t
    :config
    (setq-mode-local emacs-lisp-mode
                     semanticdb-find-default-throttle
                     (default-value 'semanticdb-find-default-throttle)))
