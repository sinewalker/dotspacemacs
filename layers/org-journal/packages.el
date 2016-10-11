;;; packages.el --- org-journal layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Mike Lockhart <sinewalker@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:


;;; Code:

(defconst org-journal-packages
  '(org-journal))

(defun org-journal/init-org-journal ()
  (use-package org-journal
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys "aj" 'org-journal-new-entry))
    ;; :config
    ;; (progn
    ;;   (spacemacs/set-leader-keys-for-major-mode 'org-journal
    ;;     "h" org-journal-open-previous-entry
    ;;     "b" org-journal-open-previous-entry
    ;;     "p" org-journal-open-previous-entry
    ;;     "l" org-journal-open-next-entry
    ;;     "f" org-journal-open-next-entry
    ;;     "n" org-journal-open-next-entry
    ;;     "j" org-journal-new-entry))
    ))

;;; packages.el ends here
