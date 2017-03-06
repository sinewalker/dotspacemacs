;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       layers/squiz/funcs.el
;;  Created:    2014-07-03
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2017-03-06 23:52:11 mjl>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [MJL] Michael J. Lockhart (mlockhart@squiz.net)
;;
;;  Rights:     Copyright © 2014, 2016-2017 Michael James Lockhart, B.App.Comp(HONS)
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
;;  Old logs up to tag 0.200 are in HISTORY.md
;;  See git log after for changes after 2017-03-06
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(defun squiz//wiid (country client-id)
  "runs the whyisitdown script (defined by `squiz-wiid-script').
asynchronously, for COUNTRY and CLIENT-ID. It logs into Pingdom
by sourcing the bash script at `squiz-wiid-keys'."
  (shell-command (concat "source " squiz-wiid-keys "; "
                         squiz-wiid-script " " country
                         " \"" client-id "\"&"))
  (switch-to-buffer "*Async Shell Command*")
  (delete-other-windows)
  (rename-buffer (format-time-string
                  (concat "*WIID-%H:%M-" country "-"
                          (upcase client-id) "*"))))

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
