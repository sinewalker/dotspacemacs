;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       layers/mjl/funcs.el
;;  Created:    2000-02-??
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2017-05-21 08:21:28 mjl>
;;  Platform:   Emacs
;;  OS:         N/A
;;  Author:     [MJL] Michael J. Lockhart <sinewalker@gmail.com>
;;
;;  Rights:     Copyright © 2000-2017 Michael James Lockhart, B.App.Comp(HONS)
;;
;;  PURPOSE:    GNU Emacs functions
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      Personal emacs utility functions.
;;
;;      The functions in this file date from 2000. There have been changes over
;;      many years, but some of these are still integral to my personal
;;      workflow.
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
;;

;;;; Logging / Date-insertion functions


(defun mjl/insert-date-iso ()
  "Inserts the current local date and time (to the minute) into
the current buffer before Point. The date is formatted per ISO
8601 specification. This is useful for prefixing entries in a log
book."
  (interactive)
  (insert (format-time-string "%Y-%m-%dT%R%z")))

(defun mjl/insert-date-stamp ()
  "Inserts the current local date into the current buffer before
Point. The date is formatted per ISO 8601 Short specification and
prefixed with my initials 'MJL'. This is useful for inserting mod
comments into code files.

Note:- if you set `mjl/initials' to a non-null value, it'll use
that value instead"
  (interactive)
  (if (not (boundp 'mjl/initials))
      (insert (format-time-string "MJL%Y%m%d"))
    (insert (format-time-string (concat mjl/initials "%Y%m%d")))))

(defun mjl/insert-date-work ()
  "Inserts the current local date in ISO 8601 format prefixed
with Work-specific initials specified in mjl/work-initials Layer
variable"
  (interactive)
  (insert (format-time-string (concat mjl-work-initials "%Y%m%d"))))

(defun mjl/insert-date-dow ()
  "Inserts the current local date and the day of the week into
the current buffer before Point. The date is formatted per ISO
8601 specification. The DOW is expanded to the full name. This is
useful for prefixing day entries in a log book."
  (interactive)
  (insert (format-time-string "%Y-%m-%d %A")))


;;;; Custom mode functions


(defun mjl/linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (setq c-basic-offset 8))

(defun mjl/EDS-c-mode ()
  "C mode with adjusted defaults for use with EDS source code."
  (interactive)
  (c-mode)
  (c-set-style "bsd"))

(defun mjl/EDS-cpp-mode ()
  "C++ mode with adjusted defaults for use with EDS source code."
  (interactive)
  (c++-mode)
  (c-set-style "bsd"))

;;;; Make Emacs work better

(defun mjl/copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(defun mjl/ui-toggle-gui ()
  "Toggle Emacs' GUI elements (menu bar and tool bar) on and off.

The GUI elements are a crutch for new users. Even after 10 years
I still sometimes feel like a new user, so I want a convinient
way to turn the menus and tool-bar on and off in one hit...

Some might argue that the scroll-bar should also be toggled with
this function: I find it useful as a navigation tool so leave it
on.

Bind this function to a key (like M-F10, since F10 activates the
menu normally)."
  (interactive)
  (cond ((null menu-bar-mode)
         (menu-bar-mode t)
         (tool-bar-mode t)
         (scroll-bar-mode t)
         (setq mouse-autoselect-window 1))
        (t
         (menu-bar-mode -1)
         (tool-bar-mode -1)
         (scroll-bar-mode -1)
         (setq mouse-autoselect-window t))))

(defun mjl/ui-toggle-rulers ()
  "Toggle Emacs' Ruler elements (line number and column guides) on and off.
"
  (interactive)
  (cond ((null ruler-mode)
         (linum-mode t)
         (ruler-mode t))
        (t
         (linum-mode -1)
         (ruler-mode -1))))

(defun mjl/save-to-dos (arg)
  "Sets buffer's file-encoding to DOS line-endings (CRLF). If
optional argument is greater than 1, also saves the buffer."
  (interactive "p")
  (set-buffer-file-coding-system 'undecided-dos)
  (when (> (prefix-numeric-value arg) 1) (save-buffer)))

(defun mjl/save-to-unix (arg)
  "Sets buffer's file-encoding to Unix line-endings (LF). If
optional argument is greater than 1, also saves the buffer."
  (interactive "p")
  (set-buffer-file-coding-system 'undecided-unix)
  (when (> (prefix-numeric-value arg) 1) (save-buffer)))

(defun mjl/save-to-mac (arg)
  "Sets buffer's file-encoding to Macintosh line-endings (CR). If
optional argument is greater than 1, also saves the buffer."
  (interactive "p")
  (set-buffer-file-coding-system 'undecided-mac)
  (when (> (prefix-numeric-value arg) 1) (save-buffer)))

(defun mjl/edit-current-file-as-root ()
  "Edit the file that is associated with the current buffer as
root. Probably only works for local files"
  (interactive)
  (if (buffer-file-name)
      (progn
        (setq file (concat "/sudo::" (buffer-file-name)))
        (find-file file))
    (message "Current buffer does not have an associated file.")))
(defalias 'gotroot 'mjl/edit-current-file-as-root)

(defun mjl/calc-other-frame ()
  "launches calc in another frame. For use when running calc as
  an application from host OS."
  (interactive)
  (require 'calc)
  (let ((f (make-frame)))
    (raise-frame f)
    (select-frame f)
    (calc-other-window)
    (delete-window)))

(defun mjl/wordpressify ()
  "replaces strings to fix WordPress' habit of smart-quoting blog
  posts.  Use this function after generating html with
  htmlize-region or htmlize-buffer"
  (interactive)
  (while (search-forward "'" nil t)
    (replace-match "&x27;"))
  (while (search-forward "..." nil t)
    (replace-match "&x2e;&x2e;&x2e;"))
  (query-replace "\"" "&quot;"))

(defun mjl/isearch-other-window ()
  "perform interactive search on other window"
  (save-selected-window
    (other-window 1)
    (isearch-forward)))

;; Cyberpunk cursor http://www.emacswiki.org/emacs/Zarza

;(defvar blink-cursor-colors (list  "#92c48f" "#6785c5" "#be369c" "#d9ca65")
(defvar blink-cursor-colors
;  (list "#381d30" "#79171b" "#9c2a14" "#a95f1b" "#ae7d20" "#ac9c25" "#848b1f" "#416b16" "#328b24" "#2d904f" "#1f758a" "#265da0" "#40399c" "#3f2e89" "#202860")
  (list "#9c2a14" "#a95f1b" "#ac9c25" "#328b24" "#1f758a" "#265da0" "#40399c")
  "On each blink the cursor will cycle to the next color in this list.")

(setq blink-cursor-count 0)
(defun blink-cursor-timer-function ()
  "Cyberpunk variant of timer `blink-cursor-timer'. OVERWRITES original version in `frame.el'.

This one changes the cursor color on each blink. Define colors in `blink-cursor-colors'."
  (when (not (internal-show-cursor-p))
    (when (>= blink-cursor-count (length blink-cursor-colors))
      (setq blink-cursor-count 0))
    (set-cursor-color (nth blink-cursor-count blink-cursor-colors))
    (setq blink-cursor-count (1+ blink-cursor-count)))
  (internal-show-cursor nil (not (internal-show-cursor-p))))

;;TODO prefer horizonal splitting in Spacemacs
;; see https://www.emacswiki.org/emacs/HorizontalSplitting
(defun mjl/split-window-prefer-horizonally (window)
  "If there's only one window (excluding any possibly active
         minibuffer), then split the current window horizontally."
  (if (one-window-p t);(and (one-window-p t)
      ;     (not (active-minibuffer-window)))
      (let ((split-height-threshold nil))
        (split-window-horizontally window))
    (split-window-sensibly window)))

;(setq split-window-preferred-function 'split-window-horizonally)

(defun mjl/split-horizontally-for-temp-buffers ()
  "Split the window horizontally for temp buffers."
  (when (one-window-p t)
    (split-window-horizontally)))

;(add-hook 'temp-buffer-setup-hook 'split-window-horizontally)

;;;; org stuff

;; TODO these may belong in `mjl-org' Layer?

(defun mjl/insert-log-entry-org ()
  "Inserts the current local date and time (to the minute) into
the current buffer before Point. The date is formatted to suit
Org mode's agenda and highlighting functions.

   Additionally puts 3 asterisks to indicate a 3rd-level heading
in Org. Useful for starting log entries"
  (interactive)
  (insert (format-time-string (concat "*** " (org-time-stamp-format t t) " "))))

(defun mjl/insert-timestamp-org ()
  "Inserts the current local date and time (to the minute) into
the current buffer before Point. The date is formatted to suit
Org mode's agenda and highlighting functions. This is like
org-time-stamp-inactive, but does not prompt for date/time."
  (interactive)
  (insert (format-time-string (concat (org-time-stamp-format t t) " "))))

(defun mjl/open-org-files ()
  "Opens all my ORG Agenda files in a new frame"
  (interactive)
  (mapc 'find-file (org-agenda-files))
  (new-frame)
  (switch-to-buffer (file-name-nondirectory (car (org-agenda-files)))))

;; (defun mjl/remember-review-file ()
;;   "Open `remember-data-file'."
;;   (interactive)
;;   (find-file-other-window remember-data-file))

(defun mjl/remember-frame ()
  "Create a small popup frame for remember mode; this is meant to
   be called with emacsclient -c -e '(mjl/remember-frame)'"
  (interactive)
  (let ( (f (make-frame)) )
    (select-frame f))
  (modify-frame-parameters nil
                           '( (name   . "*Remember*") ;; must be same as in mode-hook below
                              (width  . 80)
                              (height . 20)
                              (vertical-scroll-bars . nil)
                              (menu-bar-lines . nil)
                              (tool-bar-lines . nil)))
  (raise-frame)
  (delete-other-windows)
  (org-remember)
  (when (fboundp 'x-focus-frame) (x-focus-frame nil))) ;; X only....


;; when we're in such a remember-frame, close it when done.
;; (add-hook 'org-remember-mode-hook
;;   (lambda()
;;     (define-key org-remember-mode-map (kbd "C-c C-c")
;;       '(lambda()(interactive)
;;          (let ((remember-frame-p
;;                  (string= (frame-parameter nil 'name) "*Remember*")))
;;            (when remember-frame-p (make-frame-invisible))  ;; hide quickly

;;            (org-remember-finalize)
;;            (when remember-frame-p (delete-frame)))))))


(defcustom remember-frame-alist nil
  "Additional frame parameters for pop-up remember frame."
  :type 'alist
  :group 'remember)

(defadvice remember (around remember-frame-parameters activate)
  "Set some frame parameters for the remember frame."
  (let ((default-frame-alist (append remember-frame-alist default-frame-alist)))
    ad-do-it))


;;;; unsorted useful functions

(defun mjl/diff-buffer-with-file ()
  "Compares current buffer with its file, using ediff. This is like ibuffer's difference function (C-=), only with ediff"
  (interactive)
  (let ((tempfileA (make-temp-file (concat (buffer-name) "-FILE-saved-")))
        (tempfileB (make-temp-file (concat (buffer-name) "-BUFFER-ram-"))))
    (when buffer-file-name
      (unwind-protect
          (progn
            (copy-file buffer-file-name tempfileA t)
            (write-region nil nil tempfileB nil 'nomessage)
            (ediff-files tempfileA tempfileB)))
      (sit-for 0)
      (when (file-exists-p tempfileA)
        (delete-file tempfileA))
      (when (file-exists-p tempfileB)
        (delete-file tempfileB)))))

;;TODO this may belong in `conf/conf-mail' configuration?
(defun mjl/mu4e-headers-narrow-unread ()
  "Narrow the Mu4e Headers view to just unread email. I use
this rather than having a separate 'AND flag:unread' search for
everything"
  (interactive)
  (mu4e-headers-search-narrow "flag:unread"))

(defalias 'mjl/unread 'mjl/mu4e-headers-narrow-unread)

(defun mjl/change-log (summary)
  "inserts a change summary to the end of the changes list on a source file"
  (interactive "sSummary> ")
  (save-excursion
    (end-of-buffer)
    (search-backward-regexp " [A-Z][A-Z][A-Z|a-z]20[0-9][0-9][0-9][0-9][0-9][0-9] - ")
    (move-beginning-of-line 2)
    (insert (concat comment-start "   "))
    (mjl/insert-date-stamp)
    (insert (concat " - " summary))
    (newline)))

(defun mjl/client-save-kill-emacs(&optional display)
  " This is a function that can bu used to shutdown save buffers and
shutdown the emacs daemon. It should be called using
emacsclient -e '(client-save-kill-emacs)'.  This function will
check to see if there are any modified buffers or active clients
or frame.  If so an x window will be opened and the user will
be prompted.
 - from http://www.emacswiki.org/emacs/EmacsAsDaemon"

  (let (new-frame modified-buffers active-clients-or-frames)

    ; Check if there are modified buffers or active clients or frames.
    (setq modified-buffers (mjl//modified-buffers-exist))
    (setq active-clients-or-frames ( or (> (length server-clients) 1)
					(> (length (frame-list)) 1)
				       ))

    ; Create a new frame if prompts are needed.
    (when (or modified-buffers active-clients-or-frames)
      (when (not (eq window-system 'x))
	(message "Initializing x windows system.")
	(x-initialize-window-system))
      (when (not display) (setq display (getenv "DISPLAY")))
      (message "Opening frame on display: %s" display)
      (select-frame (make-frame-on-display display '((window-system . x)))))

    ; Save the current frame.
    (setq new-frame (selected-frame))


    ; When displaying the number of clients and frames:
    ; subtract 1 from the clients for this client.
    ; subtract 2 from the frames this frame (that we just created) and the default frame.
    (when ( or (not active-clients-or-frames)
	       (yes-or-no-p (format "There are currently %d clients and %d frames. Exit anyway?" (- (length server-clients) 1) (- (length (frame-list)) 2))))

      ; If the user quits during the save dialog then don't exit emacs.
      ; Still close the terminal though.
      (let((inhibit-quit t))
             ; Save buffers
	(with-local-quit
	  (save-some-buffers))

	(if quit-flag
	  (setq quit-flag nil)
          ; Kill all remaining clients
	  (progn
	    (dolist (client server-clients)
	      (server-delete-client client))
		 ; Exit emacs
	    (kill-emacs)))
	))

    ; If we made a frame then kill it.
    (when (or modified-buffers active-clients-or-frames) (delete-frame new-frame))
    )
  )


(defun mjl//modified-buffers-exist()
  "This function will check to see if there are any buffers
that have been modified.  It will return true if there are
and nil otherwise. Buffers that have buffer-offer-save set to
nil are ignored."
  (let (modified-found)
    (dolist (buffer (buffer-list))
      (when (and (buffer-live-p buffer)
		 (buffer-modified-p buffer)
		 (not (buffer-base-buffer buffer))
		 (or
		  (buffer-file-name buffer)
		  (progn
		    (set-buffer buffer)
		    (and buffer-offer-save (> (buffer-size) 0))))
		 )
	(setq modified-found t)
	)
      )
    modified-found
    )
  )

(defun mjl/titlebar()
  "Set the Emacs frame title bar the way I like, with active
buffer filename, or buffer name if no file associated.  I run
this in my init.el but it's not sticking for daemons"
  (interactive)
  (when (or (display-graphic-p) (window-system)) ; display-graphic-p
    (global-hl-line-mode)                        ; not always bound?
    (mouse-wheel-mode t)
    (setq frame-title-format '(buffer-file-name "%f" ("%b")))))

(defun mjl/pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n"))
    (indent-region begin end))
  (message "Ah, much better!"))

;; "Hacker Type" implementation, in Emacs
;; I'm unsure where exactly this came from?
(defun mjl/hacker-type (arg)
  (interactive (list (read-file-name "Filename: ")))
  (setq mjl--fake-hacker-type-map (make-sparse-keymap))
  (setq mjl--ht-filename arg)
  (setq mjl--ht-start 0)
  (setq mjl--ht-insert-by 3)

  (define-key mjl--fake-hacker-type-map [remap self-insert-command]
    'mjl//ht-inject-contents)
  (use-local-map mjl--fake-hacker-type-map)
  )

(defun mjl//ht-inject-contents (&optional n)
  (interactive)
  (setq mjl--ht-end (+ mjl--ht-start mjl--ht-insert-by))
  (insert-file-contents mjl--ht-filename nil mjl--ht-start mjl--ht-end)
  (forward-char mjl--ht-insert-by)
  (setq mjl--ht-start (+ mjl--ht-start mjl--ht-insert-by))
  )

(defun mjl/deactivate-hacker-type ()
  (interactive)
  (define-key mjl--fake-hacker-type-map [remap self-insert-command] nil)
  )


;;; Local Variables: ***
;;; mode:Emacs-lisp ***
;;; fill-column: 79 ***
;;; comment-column: 0 ***
;;; End: ***
