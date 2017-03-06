;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       conf-work.el
;;  Created:    2017-03-02
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2017-03-04 22:28:11 mjl>
;;  Platform:   Emacs
;;  OS:         Apple Macintosh OS X
;;  Author:     [MJL] Michael J. Lockhart <sinewalker@gmail.com>
;;
;;  Rights:     Copyright © 2017 Michael James Lockhart, B.App.Comp(HONS)
;;
;;  PURPOSE:    Personal Work settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This sets personal preferences for Squiz.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;; MJL20170302 - Created (browse-url-browser-function)
;; MJL20170304 - edit-server (from `chrome' Layer) configuration
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:


;; Chrome layer configuration

;; Open specific web site text areas in different modes
;; or as markdown buffers by default
(when (member 'chrome dotspacemacs-configuration-layers)
;  (require 'edit-server)
  (setq edit-server-url-major-mode-alist
        '(("github\\.com" . org-mode))
        ;;TODO confim or install modes for moin and jira
        ;;'(("opswiki\\.squiz\\.net" . moin-moin-mode))
        ;;'(("jira\\.squiz\\.net" . jira-mode))
        '(("." . markdown-mode)))

  (add-to-list 'edit-server-new-frame-alist '(width  . 140))
  (add-to-list 'edit-server-new-frame-alist '(height . 60))

  ;;switch focus to Chrome after done editing
  (add-hook 'edit-server-done-hook (lambda () (shell-command
                                          "open -a \"Google Chrome\"")))
  ;(edit-server-start)
  )

;; use browser depending on url
;; (default to firefox overriding the OS default)
;;
;; Note:- the requires wrapper scripts on macOS to open the browser. e.g.
;; ~/bin/forefox:
;;;;
;; #!/usr/bin/env bash
;;
;; open -a "FirefoxDeveloperEdition" $@


(setq
 browse-url-browser-function
 '(
   ("squiz\\.net" . browse-url-default-browser)
   ("gitlab" . browse-url-chromium)
   ("google" . browse-url-chromium)
   ("github" . browse-url-firefox)
   ("thefreedictionary\\.com" . eww-browse-url)
   ("." . browse-url-firefox)
   ))

(provide 'conf-work)

;;; Local Variables: ***
;;; mode:Emacs-lisp ***
;;; fill-column: 79 ***
;;; comment-column: 0 ***
;;; End: ***
