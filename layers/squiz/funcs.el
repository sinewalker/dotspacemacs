;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       layers/squiz/funcs.el
;;  Created:    2014-07-03
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2016-02-05 08:58:07 mjl>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [MJL] Michael J. Lockhart (mlockhart@squiz.net)
;;
;;  Rights:     Copyright © 2014, 2016 Michael James Lockhart, B.App.Comp(HONS)
;;
;;  PURPOSE:    Functions for Squiz-specific stuff
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      Here is where I'm keeping my Squiz-only emacs hacks.
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;  MJL20140703 - Created (wiid)
;;  MJL20140808 - put the timestamp near front of buffer name
;;  MJL20140819 - shorter aliases
;;  MJL20160129 - Moved into a Spacemacs Layer "squiz"
;;              - Changed the namespace to `squiz-` from `mjl/', per Spacemacs
;;                practice, and the naming to - | / | //
;;  MJL20160203 - Emacs metadata
;;  MJL20160205 - Whitespace
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(defun squiz//wiid (country client-id)
  "runs the whyisitdown script (defined by `squiz-wiid-script')
asynchronously, for COUNTRY and CLIENT-ID"
  (shell-command (concat squiz-wiid-script " " country " \"" client-id "\"&"))
  (save-window-excursion
    (switch-to-buffer "*Async Shell Command*")
    (rename-buffer (format-time-string
                    (concat "*WIID-%H:%M-" country "-"
                            (upcase client-id) "*")))))

(defun squiz/wiid-au (client-id)
  "runs `squiz//wiid' for Australian CLIENT-ID"
  (interactive "sAU client: ")
  (squiz//wiid "AU" client-id))

(defalias 'wiid-au 'squiz/wiid-au)
(defalias 'yau 'squiz/wiid-au)

(defun squiz/wiid-uk (client-id)
  "runs `squiz//wiid' for United Kingdom CLIENT-ID"
  (interactive "sUK client: ")
  (squiz//wiid "UK" client-id))

(defalias 'wiid-uk 'squiz/wiid-uk)
(defalias 'yuk 'squiz/wiid-uk)


;;; Local Variables: ***
;;; mode:Emacs-lisp ***
;;; fill-column: 79 ***
;;; comment-column: 0 ***
;;; End: ***
