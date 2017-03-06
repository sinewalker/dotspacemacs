# OLD HISTORY

I used to keep Change Log sections in my files, but with git (and especially
Magit), this practice is increasingly dated.

So At this point (after Tag 0.200) I will now only maintain the DVCS log. Also
I'm removing the Change Log section from all the files that have one, and
keeping that history here (however incomplete it is).

NO FURTHER CHANGES TO HISTORY.md ARE PLANNED. It's just for old history while I
was exploring Spacemacs (and git/magit)

## init.el

```elisp
;;  MJL20151215 - Created, all user config done in `dotspacemacs/user-config' to
;;                begin with
;;  MJL20151220 - Added personal snippets - not working
;;              - moved mu4e config out to a `required' feature file
;;              - load the PHP layer, but without the `php-extras' package,
;;                which is having Quelpa compilation issues
;;  MJL20151220 - tidy variables declarations in layers list
;;  MJL20151221 - added my personal layer `mjl' to the layers list
;;  MJL20160104 - source code header added, with change log
;;              - added `time-stamp' and `copyright-update'to 'before-save-hook
;;  MJL20160106 - use the `mu4e' layer from Spacemacs, rather than my own.
;;  MJL20160107 - added xkcd layer
;;  MJL20160111 - turned off display-time-mode because it doesn't always appear,
;;                and it stops the HUD from showing on the far right.
;;  MJL20160124 - Updated to spacemacs-0.105.9 : new variables
;;  MJL20160125 - clojure layer
;;  MJL20160128 - configure inferior shells, and rename mue4e-config
;;  MJL20160129 - squiz layer (just shove it in the variable for now)
;;              - Re-order the Layers list with host-specific stuff at the end
;;  MJL20160130 - Put shells on top (also left/right will work...)
;;  MJL20160201 - Fixed the ugly ~ in the fringe
;;  MJL20160203 - moved Emacs metadata (after ^L at bottom)
;;              - right-shift the fringe bits one bit to better space for vsplit
;;              - set scroll-bar-mode left (but don't turn it on)
;;  MJL20160205 - Maximize at startup
;;  MJL20160206 - Customize `dotspacemacs-configuration-layers' by
;;                `system-type' and `system-name'
;;              - Group `dotspacemacs/user-config' variables logically
;;              - only require simple config code if relevant Layer is loaded
;;  MJL20160207 - Fix smooth-scroll (`dotspacemacs-smooth-scrolling' didn't?)
;;              - Set `global-prettify-symbols-mode' for lambda etc.
;;              - Load Clojure layer only on Linux and Mac
;;  MJL20160208 - use Spacemacs naming convention for private variables
;;  MJL20160210 - require the mu4e config for work systems, rather than test
;;                for the layer, because my layer config is a list
;;              - UI tweeks (emacs-leader-key, whitespace, powerline, Customize)
;;  MJL20160212 - weirdly after I moved the `squiz' later, I have to expand the
;;                script filename myself now for my $HOME
;;  MJL20160220 - Org-mode configured as a Layer
;;              - Updated to spacemacs-0.105.10: nothing new
;;  MJL20160226 - I've got a new workstation - a MacBook Air called mutsu
;;  MJL20160301 - mu4e location for brew on Mac. Not ideal
;;  MJL20160313 - turn line numbers on
;;  MJL20160319 - deft note taking
;;  MJL20160323 - Puppet layer
;;  MJL20160328 - Updated to spacemacs-0.105.14: template comments
;;  MJL20160412 - default shell height 66%
;;  MJL20160419 - Enable menu-bar-mode on a Mac
;;  MJL20160422 - Updated to spacemacs-0.105.19: template comments
;;              - Experimenting with M-s-Space for the leader key
;;  MJL20160427 - csv-mode package (no layer)
;;  MJL20160504 - automatically copy mouse selection to kill ring
;;              - M-s-Space as leader is not good, back to s-Space
;;              - minimap package (no layer)
;;  MJL20160512 - Google Chrome edit-server extension code
;;  MJL20160528 - "Squiz" directory renamed to generic "Work"
;;  MJL20160616 - install `request' because it's not loading in latest update?
;;  MJL20160701 - org-journal
;;  MJL20160808 - use a random ASCII banner
;;  MJL20161105 - Upgraded to spacemacs-0.200.5: new/replaced variables
;;  MJL20161117 - imenu-list
;;  MJL20161126 - Graphviz
;;  MJL20161213 - leave `dotspacemacs-configuration-layer-path' as default
;;  MJL20161222 - smaller default face
;;  MJL20170101 - add sql layer
;;              - remove `org' and `org-journal' layers from `mjl--layers':
;;                now declared by `mjl-org', which will also configure
;;  MJL20170127 - add scheme and yaml layers, sicp
;;  MJL20170201 - use Squiz style initials on a Mac, Nyan is back, 
;;  MJL20170202 - idle-highlight-mode
;;  MJL20170221 - default shell: emacs, window width instead of full frame
;;  MJL20170227 - eshell: set the config directory to load all control files
;;  MJL20170306 - use chrome layer for edit-server, and add local config
;;              - refactor layers lists (fixes issue #5)
```

## conig/conf-inferior.el 

```elisp
;;  MJL20160128 - Created
;;  MJL20160129 - Renamed: mjl not really necessary. "conf" isn't either in the
;;                filename, except to make it match the feature name
;;  MJL20160203 - Emacs metadata
```

## config/conf-mail.el 

```elisp
;;  MJL20151210 - Created
;;  MJL20160203 - Emacs metadata
;;  MJL20160210 - eval after loading the mu4e package
;;  MJL20160220 - Renamed to conf-mail
;;              - hide the updates in minibuffer
;;              - handle html emails better
;;  MJL20160301 - Show thread-subject headers
;;  MJL20160308 - ImageMagick register types
;;              - remove INBOX.team shortcut
;;  MJL20160316 - Mac Brew has no mbsync, use offlineimap to get mail
;;  MJL20160415 - get mail less often, since it's so slow to clean up
;;  MJL20160614 - Going all-google for Work. No more imap/index step
```

## config/conf-work.el 

```elisp
;; MJL20170302 - Created (browse-url-browser-function)
;; MJL20170304 - edit-server (from `chrome' Layer) configuration
```

## layers/mjl/config.el 

```elisp
;;  MJL20151220 - Created
;;  MJL20160104 - Added source code header with change log.
;;  MJL20160203 - Emacs metadata
;;  MJL20160206 - variables to switch keybinding groups off
;;              - remove the Mac option/meta/super switch
;;  MJL20170201 - variable to specify Work initials
```

## layers/mjl/funcs.el 

```elisp
;;  This file contains custom utility functions that have been carried over
;;  from ages past. At various times the init file has been renamed. A rough
;;  chronology of these changes is:
;;
;;    2000: ~/.emacsrc
;;    2003: ~/.emacs.el
;;    2008: ~/.emacs.d/init.el
;;    2009: ~/.emacs.d/defuns.el
;;    2011: ~/.emacs.d/mjl/defuns.el
;;    2015: ~/.spacemacs.d/layers/mjl/funcs.el
;;
;;  What follows is the change log for all this history, minus items that have
;;  been removed/relocated/deprecated by advances in Emacs itself, or by
;;  Spacemacs' configurations (particularly UI and also loading mechanics)
;;
;;   MJL200002?? - Created (Bash sub-shell settings and custom C modes)
;;   MJL20030225 - Added function for inserting the ISO date
;;               - Added function to insert a modification date prefix
;;   MJL20030326 - New function `insert-date-dow' inserts current ISO date,
;;                 followed by the day of week, bound to S-F12
;;   MJL20080715 - Refactor my date-insert functions to use `format-time-string'
;;   MJL20080904 - `mjl/shell': use emacs as the editor
;;   MJL20081101 - `mjl/shell': fewer (comint-send-input) calls.
;;   MJL20090907 - Adopted Emacs Starter Kit -- relocated defuns here
;;   MJL20091009 - Remember-mode pop-up (1st attempt, from Linux ideas)
;;   MJL20100317 - `mjl/shell' now runs cygwin/bash on Windows
;;   MJL20100324 - `copy-line' [http://www.emacswiki.org/emacs/CopyingWholeLines]
;;   MJL20100512 - test for Windows using symbols instead of string=
;;   MJL20100603 - `mjl/save-to-dos' `mjl/save-to-unix' and `mjl/save-to-mac'
;;   MJL20100625 - `mjl/shell' introduced bug on Unix, fixed by setting vars
;;                 only on Windows
;;   MJL20100726 - Fix bug in EDITOR var for `mjl/shell'
;;   MJL20110705 - `mjl/calc-other-frame' for launching calc from clients
;;   MJL20110829 - `mjl/dired-view-file' and friends to browse files in dired.
;;   MJL20111130 - Zazra's cyberpunk cursor
;;   MJL20111212 - changed namespace convertion to use `mjl/'
;;   MJL20111213 - moved global key bingings to mjl/bindings.el
;;               - relocated org functions here, from old mjl/org.old
;;               - renamed to mjl/defuns.el
;;               - use local vars in `mjl/calc-other-frame' and
;;                 `mjl/remember-frame'
;;               - `mjl/insert-date-stamp' removed unneeded decode-time call
;;   MJL20131127 - Use a variable for mjl/insert-date-stamp function
;;   MJL20140710 - Added `mjl/edit-current-file-as-root'
;;   MJL20140722 - Added `mjl/diff-buffer-with-file'
;;   MJL20140724 - include (buffer-name) in difference buffers of
;;                 `mjl/duff-buffer-with-file'
;;   MJL20140724 - Added `mjl/mu4e-headers-narrow-unread'
;;   MJL20140724 - added `mjl/change-log'
;;   MJL20140917 - added `mjl/client-save-kill-emacs'
;;   MJL20140929 - fixed `mjl/open-org-files' to be non-hard-coded
;;   MJL20150106 - added `mjl/titlebar' from init.el code
;;   MJL20151221 - Renamed to layers/mjl/funcs.el (spacemacs)
;;               - removed functions no longer required in spacemacs
;;               - adopted Spacemacs naming convention for "private",
;;                 non-command functions (two slashes)
;;   MJL20151222 - Use Nyan Cat rainbow colours for the cyberpunk cursor
;;   MJL20160318 - `mjl/pretty-print-xml-region' from old =tools.el=
;;   MJL20160811 - `split-window-prefer-horizontally'
;;   MJL20170201 - `mjl/insert-date-work' and `mjl/hacker-type'
;;               - `mjl/ui-toggle-gui' also toggles scroll bars
```

## layers/mjl/keybindings.el 

```elisp
;;  MJL20151220 - Created, copied from osx layer, then imported much from my own
;;                ~/.emacs.d/mjl/boot/bindings.el
;;  MJL20151222 - Added rest of Sun keys and my F-keys
;;  MJL20160102 - bind font scaling to C-+/- as well (easy to type, doesn't
;;                break much)
;;  MJL20160104 - Swap F2 and F3 to better match physical key labels
;;              - bind font scaling to s-\ and s-] as well (these are in roughly
;;                traditional places on the TEK 209)
;;  MJL20160111 - bind `helm-M-x' to the <menu>/<apps> key, it's better, now I
;;                know how to use it.
;;              - map s-f, s-r, <next> and <prior> within isearch-mode-map
;;              - remove C-z binding: it causes more trouble than it's worth
;;  MJL20160118 - C-z and C-v: make them modern bindings: I don't use the defaults
;;  MJL20160203 - Emacs metadata
;;  MJL20160206 - variables control whether to bind key groupings
;;              - take out the Mac meta/option/super stuff -- osx layer can better
;;                handle this, and now I'm not conflicting the bindings
;;  MJL20160316 - (temporary hack) `wdired-change-to-wdired-mode' binding
;;  MJL20160318 - binding for helm-M-x on my TEK229/PC mode, plugged into a Mac Air
;;  MJL20160319 - M-n and M-p for paging with a Mac
;;  MJL20160420 - binding for helm-M-x on my TEK229/PC mode, plugged into a Mac Pro
;;  MJL20160729 - bind org-toggle-checkbox in Markdown mode too, since it works.
;;  MJL20160808 - Bind <home> and <end> to whatever C-a and C-e are bound to
;;                (heh, almost exactly 16 years later, still fixing home/end)
;;  MJL20160911 - super-shift-S Save-As
;;              - super-shift-O Open directory
;;  MJL20161014 - window split bindings like my iTerm2
;;  MJL20161104 - different <menu>-keys bound to M-x, for different OS
;;  MJL20170109 - Use super up/dn for paging up/down on a Mac (same as native)
;;  MJL20170201 - Bind the super-UP/DOWN if we're NOT binding OSX keys
;;                ourselves (because we're relying on the `osx' layer to do Mac
;;                keys, but that layer doesn't include extras)
;;              - `spacemacs/set-leader-keys' for date stamps (od*)
;;              - `spacemacs/set-leader-keys' for toggling Ruler
;;                (tR, which is not reserved, but available and sensible...)
;;              - `spacemacs/set-leader-keys' for `mjl/ui-toggle-gui' (Tu)
;;  MJL20170215 - `spacemacs/set-leader-keys' for `mjl/insert-timestamp-org' (odo)
```

## layers/mjl-org/canfig.el 

```elisp
;;  MJL20160129 - Created
;;  MJL20160203 - Emacs metadata
```

## layers/mjl-org/layers.el 

```elisp
;; MJL20170101 - Created.  Specify org and org-journal layers as requirements.
```

## layers/mjl-org/packages.elisp

```elisp
;;  MJL20160201 - Created
```

## layers/squiz/config.el 

```elisp
;;  MJL20160129 - Created, from old `squiz-funcs.el'
;;  MJL20160203 - Emacs metadata
;;  MJL20160805 - location of Pingdom Keys file.
;;              - change the default directory location
```

## layers/squiz/funcs.el 

```elisp
;;  MJL20140703 - Created (wiid)
;;  MJL20140808 - put the timestamp near front of buffer name
;;  MJL20140819 - shorter aliases
;;  MJL20160129 - Moved into a Spacemacs Layer "squiz"
;;              - Changed the namespace to `squiz-` from `mjl/', per Spacemacs
;;                practice, and the naming to - | / | //
;;  MJL20160203 - Emacs metadata
;;  MJL20160205 - Whitespace
;;  MJL20160805 - source the Pingdom keys before calling the script
;;  MJL20161013 - delete other windows, since I'm always doing that manually
```

## layers/squiz/keybindings.el 

```elisp
;;  MJL20160129 - Created
;;  MJL20160203 - Emacs metadata (still no actual code)
```
