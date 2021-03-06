;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       config-mail.el
;;  Created:    2015-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2017-03-06 23:39:30 hsiao>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [hsiao] Jianfang Xiao <xiaojiangang558@gmail.com>
;;
;;  Rights:     Copyright © 2015-2018 Jianfang Xiao, Citi,Shanghai
;;
;;  PURPOSE:    Personal Mu 4 Emacs settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets up mu4e for my email (currently for Squiz only)
;;
;;   note:- this is not all the configuration for emails. I also have account
;;          details:
;;
;;    - IMAP sync (mbsync) in ~/.mbsyncrc
;;    - IMAP password in ~/keys/password.imap
;;    - SMTP:  in ~/.authinfo
;;    - Signature:  in ~/.signature
;;
;;    the two password/auth files MUST be protected at the operating system
;;    level (i.e. owner-only file access) and MUST NOT be added to revision
;;    control.
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

(with-eval-after-load 'mu4e

  (setq mu4e-headers-include-related t
        mu4e-headers-skip-duplicates t
        mu4e-headers-visible-lines 18
        mu4e-use-fancy-chars t
        ;mu4e-view-mode-hook '((turn-on-visual-line-mode))  ;MJL20151213 gives errors
        mu4e-headers-date-format "%Y-%m-%d %T%z"
        mu4e-headers-fields
        '( (:date          .  25)
           (:flags         .   6)
           (:from          .  22)
           (:thread-subject       .  nil))
        mu4e-sent-folder   "/sent"
        mu4e-drafts-folder "/drafts"
        mu4e-trash-folder  "/trash"
        mu4e-refile-folder "/archive"
        mu4e-maildir-shortcuts
        '(("/archive"     . ?a)
          ("/inbox"       . ?i)
          ("/sent"        . ?s)
          ("/oldmail"     . ?o))


        ;;mu4e-html2text-command "html2text -utf8 -width 72"
        mu4e-html2text-command "w3m -dump -T text/html"
        mu4e-show-images t
        mu4e-view-show-images t
        mu4e-view-prefer-html t
        mu4e-use-fancy-chars t


        mu4e-user-mail-address-list '("309183912@qq.com"
                                      "13247091250@163.com"
                                      "xiaojianfang558@@gmail.com")
        mu4e-reply-to-address "309183912@qq.com"

;       mu4e-get-mail-command "offlineimap"
;        mu4e-get-mail-command "true" ; TODO: determine a faster way to index
;        mu4e-update-interval 600
;        mu4e-hide-index-messages t


        mail-user-agent 'mu4e-user-agent
        user-mail-address "309183912@qq.com"
        user-full-name  "Jianfang Xiao"
        message-signature t  ; use -/.signature

        message-send-mail-function 'smtpmail-send-it ; for gnus/message/mu4e
        send-mail-function 'smtpmail-send-it    ; for 'mail' -- just in case
        smtpmail-smtp-server "mail.qq.com"
        smtpmail-local-domain "qq.com"
        smtpmail-smtp-service 587
        smtpmail-stream-type 'starttls
        smtpmail-debug-info t)

  (when (fboundp 'imagemagick-register-types)
    (imagemagick-register-types))

  ;; note the magic numbers: these are the ASCII codes for the bookmark
  ;; shortcuts, I think, set by Emacs Customize when I created the bookmarks on
  ;; my old Emacs setup. Actually, can just put ?A for the A character, rather
  ;; than work out the number. That's not so bad

  (setq mu4e-bookmarks '(("flag:unread AND NOT
         flag:trashed" "Unread messages" ?u)
            ("date:today..now" "Today's messages" ?t)
            ("flag:flagged" "Flagged messages" ?f)
            ("date:7d..now" "Last 7 days" ?w)
            ("mime:image/*" "Messages with images" ?p)
            ("subject:24x7" "24x7 activity reports" ?2)
            ;("subject:Open NR" "Open NR reports" 79)
            ("from:support@squiz.com.au AND subject:Comment Added " "Zendesk Reply Ticket Lists" ?z)
            ;("subject:P3 Report" "P1/2/3 Reports" 80)
            ("from:support@squiz.com.au Ticket OR from:support@squiz.com.au" "Tickets" ?T)
            ;("subject:Stats Records" "Status Reports" 83)
            ("subject:Support Handover" "Handover emails" ?H)
            ("subject:svn commit" "Subversion Commits" ?V)
           ;; ("NOT subject:svn* AND NOT subject:Spacewalk* AND NOT subject:HIPO* AND NOT subject:*Handover* AND NOT subject:\"Zendesk end-user removal notice\" AND (to:everyone@squiz.net OR to:everyone@squiz.com.au OR from:jloh OR from:dgraver OR from:parmstrong OR from:ncallahan OR from:kdavison OR from:mgough OR from:dbelcher OR from:dbenfield OR from:asharpe OR from:mwalker OR from:jmao OR from:ndavis OR from:atwin OR from:jalomes OR from:jalvares OR from:alagrange OR from:acarrucan OR from:mlockhart OR from:bbanda OR from:dschoern OR from:smcinerney OR to:cru@squiz.com.au OR to:cru@squiz.net OR to:cru-au@squiz.net OR cru-au@squiz.com.au OR to:sysadmin OR to:sysadmin-au OR to:security OR to:support OR to:support-team-global to:australia OR to:hobart-office OR to:australia@squiz.net OR cc:mlockhart)" "from Squiz Team" ?q)
            ("(subject:DOWN OR subject:alert OR subject:PROBLEM OR subject:RECOVERY OR from:alert@pingdom.com OR from:bb@nre.vic.gov.au OR from:outages@wholesale.eftel.com OR from:noreply@eftel.com OR to:support-monitor) AND NOT from:support@squiz.com.au" "Alerts" ?A)
            ("to:mlockhart AND NOT from:support AND NOT from:nagios AND NOT from:service-requests AND NOT subject:Zendesk end-user removal notice AND NOT subject:[JIRA]* AND NOT subject:24x7 Activity*" "to ME" ?m)
            ("subject:This Week in Support" "This Week in Support" ?7)
            ("to:jokes@squiz.com.au OR to:jokes@squiz.net" "Squiz jokes" ?J)))
  )

(autoload 'post-mode "post" "mode for e-mail" t)
(add-to-list 'auto-mode-alist
             '("\\.*mutt-*\\|\\.article\\|\\.followup"
               . post-mode))
(add-hook 'post-mode-hook
          (lambda()
            (auto-fill-mode t)
            (setq fill-column 72)    ; rfc 1855 for usenet messages
            ;; (require 'footnote-mode)
            ;; (footmode-mode t)
            ;; (require 'boxquote)
            ))

(provide 'config-mail)

;;; Local Variables: ***
;;; mode:Emacs-lisp ***
;;; fill-column: 79 ***
;;; comment-column: 0 ***
;;; End: ***
