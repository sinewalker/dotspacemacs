;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       layers/squiz/config.el
;;  Created:    2016-01-29
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2016-08-05 17:26:58 mjl>
;;  Platform:   Emacs (Spacemacs)
;;  OS:         N/A
;;  Author:     [MJL] Michael J. Lockhart (mlockhart@squiz.net)
;;
;;  Rights:     Copyright © 2014, 2016 Michael James Lockhart, B.App.Comp(HONS)
;;
;;  PURPOSE:    Configuration variables for the layer
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;     Configuration for Squiz layer. I actually think putting one variable in a
;;     separate file is more Spaghetti than leaving it where I used it in the
;;     `funcs.el', but that's not how Spacemacs organises things... so here it
;;     is.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;  MJL20160129 - Created, from old `squiz-funcs.el'
;;  MJL20160203 - Emacs metadata
;;  MJL20160805 - location of Pingdom Keys file.
;;              - change the default directory location
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:
;;

(defvar squiz-wiid-script
  "~/Work/git/whyisitdown/whyisitdown"
  "how to find the whyisitdown script")

(defvar squiz-wiid-keys
  "~/Work/git/whyisitdown/keys"
  "where are the Pingdom keys")


;;; Local Variables: ***
;;; mode:Emacs-lisp ***
;;; fill-column: 79 ***
;;; comment-column: 0 ***
;;; End: ***
