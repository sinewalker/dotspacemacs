;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       layers/mjl/config.el
;;  Created:    2015-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2016-02-06 09:09:54 mjl>
;;  Platform:   Emacs (Spacemacs)
;;  OS:         N/A
;;  Author:     [MJL] Michael J. Lockhart (mlockhart@squiz.net)
;;
;;  Rights:     Copyright © 2015, 2016 Michael James Lockhart, B.App.Comp(HONS)
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
;;  MJL20151220 - Created
;;  MJL20160104 - Added source code header with change log.
;;  MJL20160203 - Emacs metadata
;;  MJL20160206 - variables to switch keybinding groups off
;;              - remove the Mac option/meta/super switch
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:
;;

(defvar mjl-bind-osx-keys t
  "If non nill the OS X style keys will be bound to their usual functions")

(defvar mjl-bind-unix-keys t
  "If non nill, the Unix/Sun keys will be bound to useful functions")


;;; Local Variables: ***
;;; mode:Emacs-lisp ***
;;; fill-column: 79 ***
;;; comment-column: 0 ***
;;; End: ***
