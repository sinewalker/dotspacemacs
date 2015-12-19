;;; Compiled snippets and support files for `fundamental-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'fundamental-mode
                     '(("source-header" "`(insert-char (string-to-char (substring comment-start 0 1)) 80)`\n`comment-start`\n`comment-start`  File:       `(if buffer-file-name (insert (file-name-base buffer-file-name) (file-name-extension buffer-file-name t)))`\n`comment-start`  Created:    `(format-time-string \"%Y-%m-%d\")`\n`comment-start`  Language:   `mode-name`\n`comment-start`  Time-stamp: `(insert \"<\")``(insert \">\")`\n`comment-start`  Platform:   $1\n`comment-start`  OS:         $2\n`comment-start`  Author:     [MJL] Michael J. Lockhart (`user-mail-address`)\n`comment-start`\n`comment-start`  Rights:     Copyright © `(format-time-string \"%Y\")` Michael James Lockhart, B.App.Comp(HONS)\n`comment-start`\n`comment-start`  PURPOSE:    $3\n`comment-start`\n`comment-start`      $0\n`comment-start`\n`comment-start`  HISTORY\n`comment-start`\n`comment-start`  `(mjl/insert-date-stamp)` - Created\n`comment-start`\n" "source-header" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Tue Nov  3 11:10:53 2015
