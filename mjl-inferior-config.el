;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       mjl-inferior-config.el
;;  Created:    2016-01-28
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2016-01-28 12:52:27 mjl>
;;  Platform:   Emacs
;;  OS:         GNU
;;  Author:     [MJL] Michael J. Lockhart (sinewalker@gmail.com)
;;
;;  Rights:     Copyright © 2016 Michael James Lockhart, B.App.Comp(HONS)
;;
;;  PURPOSE:    Configure inferior shells for GNU environment
;;
;;      This simply sets up all the inferior mode settings to work with runtimes
;;      that are typically available in GNU/Linux
;;
;;  HISTORY
;;
;;  MJL20160128 - Created
;;

(setq inferior-lisp "clisp"
      scheme-program-name "guile"
      python-shell-interpreter "python")

;; prefer ipython when I can get it
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))

(provide 'mjl-inferior-config)
