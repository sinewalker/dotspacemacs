;;; Compiled snippets and support files for `emacs-lisp-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'emacs-lisp-mode
                     '(("source-header" "`(insert-char ?; 70)`\n;;\n;;  File:       `(if buffer-file-name (insert (file-name-base buffer-file-name) (file-name-extension buffer-file-name t)))`\n;;  Created:    `(format-time-string \"%Y-%m-%d\")`\n;;  Language:   `mode-name`\n;;  Time-stamp: `(insert \"<\")``(insert \">\")`\n;;  Platform:   Emacs\n;;  OS:         N/A\n;;  Author:     [MJL] Michael J. Lockhart (`user-mail-address`)\n;;\n;;  Rights:     Copyright © `(format-time-string \"%Y\")` Michael James Lockhart, B.App.Comp(HONS)\n;;\n;;  PURPOSE:    $3\n;;\n`(insert-char ?; 70)`\n;;\n;;; Commentary:\n;;\n;;      $0\n;;\n`(insert-char ?; 70)`\n;;\n;;; Change Log:\n;;\n;;  `(mjl/insert-date-stamp)` - Created\n;;\n`(insert-char ?; 70)`\n;;\n;;; Code:\n" "emacs-source-header" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Tue Nov  3 11:10:53 2015
