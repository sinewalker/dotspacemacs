;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       layers/mjl/keybindings.el
;;  Created:    2015-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2017-02-01 22:44:11 mjl>
;;  Platform:   Emacs (Spacemacs)
;;  OS:         N/A
;;  Author:     [MJL] Michael J. Lockhart (mlockhart@squiz.net)
;;
;;  Rights:     Copyright © 2015-2017 Michael James Lockhart, B.App.Comp(HONS)
;;
;;  PURPOSE:    Keybindings for my personal layer "mjl"
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;    Using the `osx' layer from Spacemacs as a starting point, this sets global
;;    keybindings for the Super key (which SHOULD NOT be clobbered by emacs
;;    modes). Also including bindings for special keys from the Sun Type 6, and
;;    some f-key bindings (though I'm still debating if these belong in this
;;    layer, or under special configs for specific Emacs applications)
;;
;;    So there are 3 global keymap groupings here:
;;
;;      - Modern/Common bindings, on Super-shifted keys (e.g. Cut/Copy/Paste)
;;      - Function Keys F1-F12 for my personal high-use functions/commands
;;      - Sun Keys Help, Attn/Open/Undo etc to make use of my Type 6
;;
;;    All have been designed so as not to conflict with Spacemacs or Emacs
;;    bindings. Some keys might be masked by the operating system.
;;
;;  HISTORY
;;
;;  Oh boy. My own bindings.el is a tail of woe and fail dating back to 20000807
;;  when I first wanted something simple like PC-style editing keys for
;;  cut/copy/paste. Little did I know back then how much wonder and pain I was
;;  in for. There were hooks and tricks and other pieces of cruft which I don't
;;  think warrant including into this Layer's configuration.
;;
;;  Then, in 2014 when I did my major emacs config overhaul, I looked at my
;;  global bindings with a view to make sense of them, especially for the
;;  F-keys, but also in light of all the munging that ergoemacs did to the
;;  control keys. It was a major mess again (in code, as well as the bindings
;;  themselves).
;;
;;  Part of my motivation to move to Spacemacs in late 2015/early 2016 was to
;;  ditch ergoemacs and return to some sort of sanity in the code, while still
;;  having the global bindings I want, with an opportunity for "modern"-style
;;  keys bound on the Super modifier.
;;
;;  For this layer, I'm adopting the philosophy that I will go with Spacemacs'
;;  use of Helm for many things, and just use global key-bindings for the
;;  "basic" editing functions that I know and love, plus Function Keys (being
;;  the F-keys on the top of most keyboards, as well as the special keys on some
;;  keyboards, like the Sun Type 6). All global settings should work for a
;;  "vanilla" Spacemacs other than functions defined in this layer.
;;
;;
;;  BUGS
;;
;;  MJL20160104 - The "vanilla" rule is broken for some of my old personal
;;  "tools.el" functions, which I've not yet imported into this layer.
;;
;;  MJL20160104 - The date functions which I bound to F11 might work better with
;;  a leader key, rather than modifiers to F11. Jury is still out: I've been
;;  using F11 for date stamps since 2003...
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
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
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; this is only applicable to GUI mode
(when (display-graphic-p)

  ;; Keybindings (from OS-X)
  ;; (these are set by the `osx' layer, so if that's installed, you maybe want
  ;; to set `mjl-bind-osx-keys' to nil and avoid binding them again here)
  (when mjl-bind-osx-keys
    (global-set-key (kbd "s-=") 'spacemacs/scale-up-font)
    (global-set-key (kbd "s--") 'spacemacs/scale-down-font)
    (global-set-key (kbd "s-0") 'spacemacs/reset-font-size)
    (global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
    (global-set-key (kbd "s-v") 'yank)
    (global-set-key (kbd "s-c") 'evil-yank)
    (global-set-key (kbd "s-a") 'mark-whole-buffer)
    (global-set-key (kbd "s-x") 'kill-region)
    (global-set-key (kbd "s-w") 'delete-window)
    (global-set-key (kbd "s-W") 'delete-frame)
    (global-set-key (kbd "s-n") 'make-frame)
    (global-set-key (kbd "s-s")  ; note:- this is shadowed by KDE Plasma Desktop
                    (lambda ()   ;        Shell "Stop Current Activity" default
                      (interactive)  ;    global shortcut.  Remap that
                      (call-interactively (key-binding "\C-x\C-s"))))
    (global-set-key (kbd "s-z") 'undo-tree-undo)
    (global-set-key (kbd "s-Z") 'undo-tree-redo)
    (global-set-key (kbd "C-s-f") 'spacemacs/toggle-frame-fullscreen)
    )

  ;; These are standard macOS/OS X bindings but are missing from the `osx'
  ;; layer. So I always want to bind them on a Mac, but only on a Mac
  (when (equal system-type 'darwin)
    (global-set-key [(super down)] 'scroll-up-command) ;; Macs don't have
    (global-set-key [(super up)] 'scroll-down-command) ;; <next> or <prev> keys!
    )

  ;;;;;;;;;;;;;;;;;;;;
  ;; Mike's additions (common bindings in other programs)
  (global-unset-key (kbd "C-z"))  ;; this binding only makes sense in a terminal
  (global-unset-key (kbd "C-v"))  ;; this binding is silly anyway, use <next>


  ;don't know if this is a Mac thing or not, but <home>/<end> do beginning /
  ;end of buffer instead of line? Make them do what C-a and C-e do...
  (global-set-key (kbd "<home>") (lambda () (interactive)
                                   (call-interactively (key-binding "\C-a"))))
  (global-set-key (kbd "<end>") (lambda () (interactive)
                                  (call-interactively (key-binding "\C-e"))))

  (global-set-key (kbd "C-z") 'undo-tree-undo)  ;; might as well be normal undo
  (global-set-key (kbd "C-v") 'yank)            ;; might as well be normal paste

  (global-set-key (kbd "C-+") 'spacemacs/scale-up-font)
  (global-set-key (kbd "C--") 'spacemacs/scale-down-font)
  (global-set-key (kbd "s-\\") 'spacemacs/scale-down-font)
  (global-set-key (kbd "s-]") 'spacemacs/scale-up-font)
  (global-set-key (kbd "s-o") ;; why is this not in osx? - Do what C-x C-f does
                  (lambda ()
                    (interactive)
                    (call-interactively (key-binding "\C-x\C-f"))))

  ;; When Mastering Emacs, one learns no navigate by searching
  (global-set-key (kbd "s-f") 'isearch-forward)
  (define-key isearch-mode-map (kbd "s-f")    'isearch-repeat-forward)
  (define-key isearch-mode-map (kbd "<next>") 'isearch-repeat-forward)
  (define-key isearch-mode-map [(find)]       'isearch-repeat-forward)
  (global-set-key (kbd "M-s-f") 'mjl/isearch-other-window)
  (global-set-key (kbd "s-r") 'isearch-backward)
  (define-key isearch-mode-map (kbd "s-r")     'isearch-repeat-backward)
  (define-key isearch-mode-map (kbd "<prior>") 'isearch-repeat-backward)

  ;; ideas from Atom
  (global-set-key (kbd "s-O") 'ido-dired)             ;; open dir
  (global-set-key (kbd "s-S") 'ido-write-file)        ;; save-as
  (global-set-key (kbd "s-b") 'helm-mini)             ;; browse buffers

  (global-set-key (kbd "s-g") 'goto-line)
  (global-set-key (kbd "s-l") 'mjl/copy-line) ;; in Atom: select line hdk
  (global-set-key (kbd "s-/") 'comment-dwim) ;; default M-; gets shadowed
  (global-set-key (kbd "s-\\") 'neotree-toggle)

  ;; TODO: some others from Atom.  E.g.
  ;;  M-s-[/]{/} fold/unfold/all
  ;;  M-s-s Save All
  ;;  M-s-z git checkout head
  ;;  s-j join lines
  ;; and consider:
  ;;  s-<return> new line below
  ;;  s-down/up bottom/top (I currently bind them to window movement below)
  ;;  s-T open term at file's directory (atom's atom-terminal plugin, non-core, spacemacs already has SPC ' )
  ;;  M-T open term at Project's root directory

  ;; splits windows like my iTerm2

  (global-set-key (kbd "S-s-<backspace>") 'split-window-right)
  (global-set-key (kbd "s-_") 'split-window-below)
  (global-set-key (kbd "S-s-<return>") 'spacemacs/toggle-maximize-buffer)

  ;; mode-specific mappings
  ;; TODO move these to layers, when I make them, probably...
  (with-eval-after-load 'dired
     (define-key dired-mode-map (kbd "E") 'wdired-change-to-wdired-mode)
     )
  (with-eval-after-load 'markdown
    (require 'org) ;; gotta load it now if it's not already
    (define-key markdown-mode-map (kbd "s-t") 'org-toggle-checkbox)
    )

  ;; Meta-x
  (cond ((eq system-type 'windows-nt)
         (global-set-key (kbd "<apps>") 'helm-M-x))
        ((eq system-type 'darwin) ;; on Mac, <menu> key maps to different keys:
         (global-set-key (kbd "C-j")    'helm-M-x)) ;;  Railwaycat emacs-mac,
        ;(global-set-key (kbd "C-p")    'helm-M-x)) ;;  vanilla brew emacs
        ((t)
         (global-set-key (kbd "<menu>") 'helm-M-x)))

  ; cannot use the kbd macro for these keys?
  ;(global-set-key [(super left)]        'windmove-left)
  ;(global-set-key [(super right)]       'windmove-right)
  ;(global-set-key [(super up)]          'windmove-up)
  ;(global-set-key [(super down)]        'windmove-down)

  (global-set-key [(super kp-subtract)] 'spacemacs/scale-down-font)
  (global-set-key [(super kp-add)]      'spacemacs/scale-up-font)

  ;;;;;;;;;;;;;;;;;;;;
  ;; Sun Type 6

  (when mjl-bind-unix-keys
    ;; (help) is bound to helm-help  by default                              ; Help
    (global-set-key [(meta help)]         'woman)                            ; M-Help
    (global-set-key [(control help)]      'info)                             ; C-Help

    (global-set-key [(cancel)]            'keyboard-quit)                    ; Stop
    (global-set-key [(meta cancel)]       'keyboard-quit)                    ; M-Stop
    (global-set-key [(control cancel)]    'save-buffers-kill-terminal)       ; C-Stop

    (global-set-key [(SupProps)]          'spacemacs/describe-char)          ; Props

    (global-set-key [(SunFront)]          'spacemacs/next-useful-buffer)     ; Front
    (global-set-key [(meta SunFront)]     'spacemacs/previous-useful-buffer) ; M-Front
    (global-set-key [(control SunFront)]  'ibuffer)                          ; C-Front

    (global-set-key [(SunOpen)]           'find-file)                        ; Open
    (global-set-key [(XF86Open)]          'find-file)
    (global-set-key [(meta SunOpen)]      'kill-buffer)                      ; M-Open
    (global-set-key [(meta XF86Open)]     'kill-buffer)                      ; M-Open
    (global-set-key [(control SunOpen)]   'save-buffer)                      ; C-Open
    (global-set-key [(control XF86Open)]  'save-buffer)                      ; C-Open

    (global-set-key [(find)]              'isearch-forward)                  ; Find
    (global-set-key [(meta find)]         'isearch-backward)                 ; M-Find
    (global-set-key [(control find)]      'isearch-forward-regexp)           ; C-Find


    ;;  (redo) is bound to 'repeat-complex-command by default                ; Redo
    ;;  (undo) is bound to undo by default                                   ; Undo
    (global-set-key [(meta undo)]         'redo)                             ; M-Undo

    (global-set-key [(XF86Copy)]          'kill-ring-save)                   ; Copy
    (global-set-key [(meta XF86Copy)]     'mjl/copy-line)                    ; M-Copy

    (global-set-key [(XF86Paste)]         'yank)                             ; Paste
    (global-set-key [(meta XF86Paste)]    'yank-pop)                         ; M-Paste

    (global-set-key [(XF86Cut)]           'kill-region)                      ; Cut
    (global-set-key [(meta XF86Cut)]      'kill-line)                        ; M-Cut
    (global-set-key [(control XF86Cut)]   'kill-sexp)                        ; C-Cut
    )

  ;;;;;;;;;;;;;;;;;;;;
  ;;; MJL20140722 - New F-key bindings

  ;; F1: shells (TEK F1=Home, Mac=Dimmer)
  ;; f1 set by Spacemacs for Helm stuff. Leave it for now.
  ;global-set-key [f1]                  'shell) ;help is Ctl-H or <help>
  ;(global-set-key [(control f1)]        'ansi-term)
  ;(global-set-key [(meta f1)]           'eshell)

  ;; F2: apps () (TEK F2=email, Mac=Brighter)
  (global-set-key [f2]                   'mu4e)
  (global-set-key [(control f2)]         'calc)
  (global-set-key [(meta f2)]            'ediff-directories)

  ;; F3: buffer switching (F3 TEK = Find, Mac = Exposé)
  (global-set-key [f3]                   'ido-switch-buffer)
  (global-set-key [(control f3)]         'ibuffer)
  ;; meta-f3 masked by OS
  (global-set-key [(shift f3)]           'list-bookmarks)


  ;; F4: evaluate ? (alt-f4 delete-frame seems sensible)
  ;; (or maybe dired? TEK=folder, Mac=Spaces)
  (global-set-key [f4]                  'eval-last-sexp)
  (global-set-key [(control f4)]        'eval-region)
  (global-set-key [(meta f4)]           'delete-frame)

  ;; F5: revert/refresh functions (TEK Calc)
  (global-set-key [f5]                  'revert-buffer)
  (global-set-key [(control f5)]        'mjl/diff-buffer-with-file)
  (global-set-key [(meta f5)]           'vc-revert)

  ;; F6: Differences (TEK Media)
  (global-set-key [f6]                  'ediff-buffers)
  (global-set-key [(meta f6)]           'ediff-revision)

  ;; F7: mark (TEK/Mac=Prev track)
  (global-set-key [f7]                  'transient-mark-mode)
  (global-set-key [(control f7)]        'mark-work)
  (global-set-key [(meta f7)]           'mark-paragraph)
  (global-set-key [(shift f7)]          'mark-defun)

  ;; F8: search/highlight (TEK/Mac=Pause)
  (global-set-key [(control f8)]        'hl-line-mode)
  (global-set-key [(meta f8)]           'global-hl-line-mode)
  (global-set-key [(shift f8)]          'idle-highlight-mode)

  ;; F9: macros (TEK/Mac=Next track)
  (global-set-key [f9]                  'kmacro-call-macro)
  (global-set-key [(control f9)]        'kmacro-start-macro)
  (global-set-key [(meta f9)]           'kmacro-end-macro)
  (global-set-key [(shift f9)]          'kmacro-name-last-macro)

  ;; F10: Menu/GUI control (TEK/Mac=Mute)
  ;; (Spacemacs does things with f10, leave it for now)
  ;(global-set-key [(control f10)]       'mjl/ui-toggle-rulers)
  ;(global-set-key [(meta f10)]          'mjl/ui-toggle-gui)

  ;; F11 date/time insertion  (these might be done better as leaders?) (TEK/Mac=Quieter)
  (global-set-key [f11]                 'mjl/insert-date-stamp)
  (global-set-key [(control f11)]       'mjl/insert-timestamp-org)
  (global-set-key [(meta f11)]          'mjl/insert-date-work)
  (global-set-key [(shift f11)]         'mjl/insert-date-iso)
  (global-set-key [(control shift f11)] 'mjl/insert-log-entry-org)
  (global-set-key [(super f11)]         'mjl/insert-date-dow)

  ;; F12 org capture/agenda (TEK/Mac=Louder)
  (global-set-key [f12]                 'org-capture)
  (global-set-key [(meta f12)]          'org-agenda)
  (global-set-key [(shift f12)]         'org-ctrl-c-ctrl-c)

  )

;;; Local Variables: ***
;;; mode:Emacs-lisp ***
;;; fill-column: 79 ***
;;; comment-column: 0 ***
;;; End: ***
