;; (require 'eieio)
;; (require 'eieio-base)
;; here use pcache for persistent
;; https://github.com/sigma/pcache/blob/master/pcache.el
(require 'pcache)

(defun hsiao/persistent-hash-table ()
  "persistent hash table"
  (interactive)
  (let ((repo (pcache-repository "hsiao"))
        (hsiaohash (make-hash-table :test 'equal)))
    (puthash "a" '((a . "a") (b ."b")) hsiaohash)
    (pcache-put repo 'ab/hash hsiaohash)
    (message "finished persistent")
    ))

(defun hsiao/persistent-get (key)
  "get"
  (interactive)
  (let ((repo (pcache-repository "hsiao")))
    (setq ab/debug (pcache-get repo 'ab/hash))
    )
  )

(provide 'hsiao-persistent)
