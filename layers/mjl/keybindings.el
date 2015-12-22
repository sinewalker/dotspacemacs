;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       layers/mjl/keybindings.el
;;  Created:    2015-12-20
;;  Language:   Emacs-Lisp
;;  Time-stamp: <>
;;  Platform:   Emacs (Spacemacs)
;;  OS:         N/A
;;  Author:     [MJL] Michael J. Lockhart (mlockhart@squiz.net)
;;
;;  Rights:     Copyright © 2015 Michael James Lockhart, B.App.Comp(HONS)
;;
;;  PURPOSE:    Keybindings for my personal layer "mjl"
;;
;;      Using the `osx' layer from Spacemacs as a starting point, this sets
;;      global keybindings for the Super key (which SHOULD NOT be clobbered by
;;      emacs modes). Also including bindings for special keys from the Sun Type
;;      6, and some f-key bindings (though I'm still debating if these belong in
;;      this layer, or under special configs for specific Emacs applications)
;;
;;      So there are 3 global keymap groupings here:
;;
;;        - Modern/Common bindings, on Super-shifted keys (e.g. Cut/Copy/Paste)
;;        - Function Keys F1-F12 for my personal high-use functions/commands
;;        - Sun Keys Help, Attn/Open/Undo etc to make use of my Type 6
;;
;;      All have been designed so as not to conflict with Spacemacs or Emacs
;;      bindings. Some keys might be masked by the operating system.
;;
;;  HISTORY
;;
;;  Oh boy. My own bindings.el is a tail of woe and fail dating back to
;;  20000807 when I first wanted something simple like PC-style editing keys for
;;  cut/copy/paste. Little did I know back then how much wonder and pain I was
;;  in for. There were hooks and tricks and other pieces of cruft which I don't
;;  think warrant including into this Layer's configuration.
;;
;;  For this layer, I'm adopting the philosophy that I will go with Spacemacs'
;;  use of Helm for many things, and just use global key-binding for the "basic"
;;  editing functions we all know and love, plus Function Keys (being the F-keys
;;  on the top of most keyboards, as well as the special keys on some keyboards,
;;  like the Sun Type 6). All global settings should work for a "vanilla" other
;;  than functions defined in this layer.
;;
;;
;;  MJL20151220 - Created, copied from osx layer, then imported much from my own
;;                mjl/boot/bindings.el
;;  MJL20151222 - Added rest of Sun keys and my F-keys
;;
;;


;; this is only applicable to GUI mode
(when (display-graphic-p)
  ;; Treat command as super
  (setq mac-command-key-is-meta nil)
  (setq mac-command-modifier 'super)

  (when mjl-use-option-as-meta
    ;; Treat option as meta
    (setq mac-option-key-is-meta t)
    (setq mac-option-modifier 'meta))

  ;; Keybindings (OS-X)
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
  ;; Emacs sometimes registers C-s-f as this weird keycode
  (global-set-key (kbd "<C-s-268632070>") 'spacemacs/toggle-frame-fullscreen)

  ;;;;;;;;;;;;;;;;;;;;
  ;; Mike's additions (common bindings in other programs)
  (global-set-key (kbd "s-o") 'ido-find-file)
  (global-set-key (kbd "s-f") 'isearch-forward)
  (global-set-key (kbd "M-s-f") 'mjl/isearch-other-window)
  (global-set-key (kbd "s-r") 'isearch-backward)
  (global-set-key (kbd "s-g") 'go-to-line)
  (global-set-key (kbd "s-l") 'mjl/copy-line)

  ; cannot use the kbd macro for these keys
  (global-set-key [(super left)]        'windmove-left)
  (global-set-key [(super right)]       'windmove-right)
  (global-set-key [(super up)]          'windmove-up)
  (global-set-key [(super down)]        'windmove-down)

  (global-set-key [(super kp-subtract)] 'spacemacs/scale-down-font)
  (global-set-key [(super kp-add)]      'spacemacs/scale-up-font)

  ;;;;;;;;;;;;;;;;;;;;
  ;; Sun Type 6

  ; (help) is bound to helm-help  by default                               ; Help
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

  ;;;;;;;;;;;;;;;;;;;;
  ;;; MJL20140722 - New F-key bindings

  ;; F1: shells
  ;(global-set-key [f1]                  'shell) ;help is Ctl-H or <help>
  ;(global-set-key [(control f1)]        'ansi-term)
  ;(global-set-key [(meta f1)]           'eshell)
  ;; F2: buffer switching
  (global-set-key [f2]                  'ido-switch-buffer)
  (global-set-key [(control f2)]        'ibuffer)
  (global-set-key [(meta f2)]           'list-bookmarks)
  ;; F3: apps
  (global-set-key [f3]                  'mu4e)
  (global-set-key [(control f3)]        'calc)
  ;; meta-f3 masked by OS
  (global-set-key [(shift f3)]          'ediff-directories)
  ;; F4: evaluate ? (alt-f4 delete-frame seems sensible)
  (global-set-key [f4]                  'eval-last-sexp)
  (global-set-key [(control f4)]        'eval-region)
  (global-set-key [(meta f4)]           'delete-frame)

  ;; F5: revert/refresh functions
  (global-set-key [f5]                  'revert-buffer)
  (global-set-key [(control f5)]        'mjl/diff-buffer-with-file)
  (global-set-key [(meta f5)]           'vc-revert)
  ;; F6: Differences
  (global-set-key [f6]                  'ediff-buffers)
  (global-set-key [(meta f6)]           'ediff-revision)
  ;; F7: mark
  (global-set-key [f7]                  'transient-mark-mode)
  (global-set-key [(control f7)]        'mark-work)
  (global-set-key [(meta f7)]           'mark-paragraph)
  (global-set-key [(shift f7)]          'mark-defun)
  ;; F8: search/highlight
  ;; f8 (set by ergoemacs - leave alone)
  (global-set-key [(control f8)]        'hl-line-mode)
  (global-set-key [(meta f8)]           'global-hl-line-mode)
  (global-set-key [(shift f8)]          'idle-highlight-mode)
  ;; F9: macros
  (global-set-key [f9]                  'kmacro-call-macro)
  (global-set-key [(control f9)]        'kmacro-start-macro)
  (global-set-key [(meta f9)]           'kmacro-end-macro)
  (global-set-key [(shift f9)]          'kmacro-name-last-macro)
  ;; F10: Menu/GUI control
  ;; f10 (leave it)
  ;(global-set-key [(control f10)]       'mjl/toggle-rulers)
  ;(global-set-key [(meta f10)]          'mjl/toggle-gui)
  ;; F11 date/time insertion  (these might be done better as leaders?)
  (global-set-key [f11]                 'mjl/insert-date-stamp)
  (global-set-key [(control f11)]       'mjl/insert-timestamp-org)
  (global-set-key [(meta f11)]          'mjl/insert-date-work)
  (global-set-key [(shift f11)]         'mjl/insert-date-iso)
  (global-set-key [(control shift f11)] 'mjl/insert-log-entry-org)
  (global-set-key [(super f11)]         'mjl/insert-date-dow)
  ;; F12 org capture/agenda
  (global-set-key [f12]                 'org-capture)
  (global-set-key [(meta f12)]          'org-agenda)
  (global-set-key [(shift f12)]         'org-ctrl-c-ctrl-c)

  )
