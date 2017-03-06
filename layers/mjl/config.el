;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       layers/mjl/config.el
;;  Created:    2015-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2017-03-06 23:42:41 mjl>
;;  Platform:   Emacs (Spacemacs)
;;  OS:         N/A
;;  Author:     [MJL] Michael J. Lockhart <sinewalker@gmail.com>
;;
;;  Rights:     Copyright © 2015, 2016, 2017 Michael James Lockhart, B.App.Comp(HONS)
;;
;;  PURPOSE:    Configuration variables for the layer
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      This file is copied from the stock `osx' layer that comes with
;;      Spacemacs. All I have done is change the variable's name to match the
;;      layer. To begin with, there's no configuration to be done since this is
;;      a personal layer, not something I intend would be useful to others.
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
;;

(defvar mjl-bind-osx-keys t
  "If non nill the OS X style keys will be bound to their usual functions")

(defvar mjl-bind-unix-keys t
  "If non nill, the Unix/Sun keys will be bound to useful functions")

(defvar mjl-work-initials "MJL"
  "Initials/abbreviation to use when inserting a timestap with `mjl/insert-date-work'. Can be anything, but is designed to conform with local work practices")


;;; Local Variables: ***
;;; mode:Emacs-lisp ***
;;; fill-column: 79 ***
;;; comment-column: 0 ***
;;; End: ***
