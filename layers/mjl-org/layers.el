;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       layers/mjl-org/layers.el
;;  Created:    2017-01-01
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2017-01-01 23:57:06 mjl>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [MJL] Michael J. Lockhart (mlockhart@squiz.net)
;;
;;  Rights:     Copyright © 2017 Michael James Lockhart, B.App.Comp(HONS)
;;
;;  PURPOSE:    Declare Spacemacs Layers needed by mjl-org layer
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      For the longest time in 2016 I was putting off work on this layer
;;      because I couldn't figure out how to safely isolate my settings from the
;;      general `org' layer, which should own most of the general packages. But
;;      still I wanted to be able to say "install the `org' Layer too, just add
;;      this stuff after".
;;
;;      At last after re-reading the docementation some time after upgrading to
;;      Spacemacs 0.200.x I discovered layers.el...
;;
;;      The `org' layer does actually have a lot of variables that you can set
;;      to turn on plug-ins (such as `org-enable-github-support' to enable the
;;      `ox-gfm' export for Github flavoured markdown). Whether to set them here
;;      or in my `init.el' is something I'll need to consider.
;;;
;;
;; History:
;;
;; MJL20170101 - Created.  Specify org and org-journal layers as requirements.

(configuration-layer/declare-layers '(org org-journal))
