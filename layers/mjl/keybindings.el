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
;;  like the Sun Type 6). All global settings should work for a "vanilla"
;;
;;
;;  MJL20151220 - Created, copied from osx layer, then imported much from my own
;;                mjl/boot/bindings.el
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

  ;; Mike's additions (common bindings in other programs)
  (global-set-key (kbd "s-o") 'ido-find-file)
  (global-set-key (kbd "s-f") 'isearch-forward)
  (global-set-key (kbd "s-r") 'isearch-backward)
  (global-set-key (kbd "s-g") 'go-to-line)
  (global-set-key (kbd "s-l") 'mjl/copy-line)


  ;; Function keys
  (global-set-key (kbd "<f5>") 'revert-buffer)

  ;; Sun Type 6
  (global-set-key (kbd "<cancel>") 'keyboard-quit) ;Stop
  ;;(global-set-key (kdd "<redo>") 'repeat-complex-command) ;already bound
  (global-set-key (kbd "<SunProps>") 'spacemacs/describe-char)
  ;;(global-set-key (kbd "<undo>") 'undo-tree-undo) ;already bound

  ;;TODO - finish these. I'm using `describe-key' to get emacs' name for each
  ;;       key under GNU/Linux/X11 (or, I could use my old bindings.el which has
  ;;       these values already...)


  )
