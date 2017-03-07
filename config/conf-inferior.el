;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       conf-inferior.el
;;  Created:    2016-01-28
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2017-03-07 22:15:37 mjl>
;;  Platform:   Emacs
;;  OS:         GNU
;;  Author:     [MJL] Michael J. Lockhart <sinewalker@gmail.com>
;;
;;  Rights:     Copyright © 2016, 2017 Michael James Lockhart, B.App.Comp(HONS)
;;
;;  PURPOSE:    Configure inferior shells for GNU environment
;;
;;      This simply sets up all the inferior mode settings to work with runtimes
;;      that are typically available in GNU/Linux
;;
;;  HISTORY
;;
;;  Old logs up to tag 0.200 are in HISTORY.org
;;  See git log after for changes after 2017-03-06
;;

(setq inferior-lisp-program "clisp"
      scheme-program-name "guile"
      python-shell-interpreter "python")

(defun mjl//run-some-python (interpreter &optional dedicated show)
  "wrapper for `run-python' which sets `python-shell-interpreter'
to the specified program INTERPRETER and then runs it. If the
program cannot be found, then just exit with a message."
  (if (executable-find interpreter)
      (run-python interpreter dedicated show)
    (message (format "No %s interpreter found" interpreter))))


;; I'm deliberately mimicking the naming of `run-python' here

(defun run-ipython3 ()
  "Runs ipython3 as the inferior python shell"
  (interactive)
  (mjl//run-some-python "ipython3" nil t))


(defun run-ipython ()
  "Runs ipython as the inferior python shell"
  (interactive)
  (mjl//run-some-python "ipython" nil t))

(defun run-ipython2 ()
  "Runs ipython as the inferior python shell"
  (interactive)
  (run-ipython))

(defun run-python3 ()
  "Runs python3 as the inferior python shell"
  (interactive)
  (mjl//run-some-python "python3" nil t))

(defun run-python2 ()
  "Runs python2 as the inferior python shell"
  (interactive)
  (mjl//run-some-python "python2" nil t))

(provide 'conf-inferior)

;;; Local Variables: ***
;;; mode:Emacs-lisp ***
;;; fill-column: 79 ***
;;; comment-column: 0 ***
;;; End: ***
