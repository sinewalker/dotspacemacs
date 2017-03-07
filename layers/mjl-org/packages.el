;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       layers/mjl-org/packages.el
;;  Created:    2016-02-01
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2017-03-07 22:18:35 mjl>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [MJL] Michael J. Lockhart <sinewalker@gmail.com>
;;
;;  Rights:     Copyright © 2016, 2017 Michael James Lockhart, B.App.Comp(HONS)
;;  License:    GPLv3
;;  URL:        https://github.com/sinewalker/dotspacemacs
;;
;;  PURPOSE:    Personal mjl-org layer packages file for Spacemacs.
;;
;;              This file is not part of GNU Emacs, or Spacemacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `mjl-org-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `mjl-org/init-PACKAGE' to load and initialize the package.
;;
;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `mjl-org/pre-init-PACKAGE' and/or
;;   `mjl-org/post-init-PACKAGE' to customize the package as it is loaded.
;;
;;; TODO
;;
;;   - [ ] Move my org config from my un-Layered `conf-org' feature into this
;;         layer's config.el
;;   - [ ] Additional Packages installation (org-gcal and calfw)
;;   - [ ] Review my old org cruft, but probably most of that can be thrown away
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;  Old logs up to tag 0.200 are in HISTORY.org
;;  See git log after for changes after 2017-03-06
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(defconst mjl-org-packages
  '()
  "The list of Lisp packages required by the mjl-org layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location. The
      following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe. See:
        https://github.com/milkypostman/melpa#recipe-format"
  )


;;; packages.el ends here

;;; Local Variables: ***
;;; mode:Emacs-lisp ***
;;; fill-column: 79 ***
;;; comment-column: 0 ***
;;; End: ***
