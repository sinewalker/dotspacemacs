;;; Compiled snippets and support files for `c-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'c-mode
                     '(("source-header" "/*`(insert-char ?* 78)`\n *\n *  File:       `(if buffer-file-name (insert (file-name-base buffer-file-name) (file-name-extension buffer-file-name t)))`\n *  Created:    `(format-time-string \"%Y-%m-%d\")`\n *  Language:   `mode-name`\n *  Time-stamp: `(insert \"<\")``(insert \">\")`\n *  Platform:   $1\n *  OS:         $2\n *  Author:     [MJL] Michael J. Lockhart (`user-mail-address`)\n *\n *  Rights:     Copyright © `(format-time-string \"%Y\")` Michael James Lockhart, B.App.Comp(HONS)\n *\n *  PURPOSE:    $3\n *\n *      $0\n *\n *  HISTORY\n *\n *  `(mjl/insert-date-stamp)` - Created\n *\n */" "C-source-header" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Tue Nov  3 11:10:52 2015
