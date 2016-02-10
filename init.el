;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  File:       ~/.spacemacs.d/init.el
;;  Created:    2015-12-15
;;  Language:   Emacs-Lisp
;;  Time-stamp: <2016-02-10 22:09:52 mjl>
;;  Platform:   Emacs (Spacemacs)
;;  OS:         N/A
;;  Author:     [MJL] Michael J. Lockhart (sinewalker@gmail.com)
;;
;;  Rights:     Copyright © 2015, 2016 Michael James Lockhart, B.App.Comp(HONS)
;;
;;  PURPOSE:    Personal Spacemacs configuration file
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This file is loaded by Spacemacs at startup.
;; It must be stored in one of these locations:
;;
;;  - in your home directory as ~/.spacemacs
;;  - in ~/.spacemacs.d/init.el
;;  - in $SPACEMACSDIR/init.el if that environment variable is set
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
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
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:



(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers")
   ;; List of configuration layers to load. This is not the spacemacs
   ;; config variable. Instead I'll build up my own list and copy after.
   mjl--layers
   '(
     ;; ----------------------------------------------------------------
     ;; List of useful layers to have in Spacemacs. This should only list
     ;; layers to be loaded on every system I install Spacemacs to. If a layer
     ;; should be loaded everywhere but configured differently, then it belongs
     ;; in one of the other lists which follow.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets/")
     better-defaults
     emacs-lisp
     git
     markdown
     org
     (shell :variables
            ;;shell-default-height 24
            shell-default-position 'top)
     spell-checking
     syntax-checking
     version-control
     (colors :variables
             colors-enable-rainbow-identifiers nil
             colors-enable-nyan-cat-progress-bar (display-graphic-p))
     php
     python
     javascript
     erc
     xkcd
     )
   )

  ;; ----------------------------------------------------------------
  ;; These list layers to load on specific platforms or systems
  ;; ----------------------------------------------------------------
  (setq
   ;; Layers to be loaded only on Microsoft Windows
   mjl--windows-layers
   '(
     (mjl :variables
          mjl-bind-osx-keys t
          mjl-bind-unix-keys nil) ; don't work in Windows
     )
   ;; Layers to be loaded only on Macintosh
   mjl--darwin-layers
   '(
     osx
     (mjl :variables
          mjl-bind-osx-keys nil ; bound by osx layer
          mjl-bind-unix-keys nil) ; don't exist on a Mac
     (clojure :variables
              clojure-enable-fancify-symbols t)
     )
   ;; Layers to be loaded only on GNU/Linux
   mjl--gnu/linux-layers
   '(
     (mjl :variables
          mjl-bind-osx-keys t
          mjl-bind-unix-keys t)
     (clojure :variables
              clojure-enable-fancify-symbols t)
     )
   ;; Layers to be loaded only on Work computers
   mjl--work-layers
   '(
     (squiz :variables
            squiz-wiid-script "~/Squiz/git/whyisitdown/whyisitdown")
     (mu4e  :variables
            mu4e-installation-path "/usr/local/share/emacs/site-lisp/mu4e")
     )
   ;; A list of system-names I use at work
   ;; Whenever I install spacemacs to a new system, add it's `system-name'
   mjl--work-systems
    '("milo.local")
   )
  ;; ----------------------------------------------------------------
  ;; now append the layers lists depending on what the system is
  ;; ----------------------------------------------------------------
  (cond ((eq system-type 'windows-nt)
         (setq mjl--layers (append mjl--layers mjl--windows-layers)))
        ((eq system-type 'darwin)
         (setq mjl--layers (append mjl--layers mjl--darwin-layers)))
        ((eq system-type 'gnu/linux)
         (setq mjl--layers (append mjl--layers mjl--gnu/linux-layers))))
  (when (member system-name mjl--work-systems)
    (setq mjl--layers (append mjl--layers mjl--work-layers)))

  (setq-default
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   ;; ----------------------------------------------------------------
   ;; I'm just setting this to the `mjl-layers' list appended above
   ;; ----------------------------------------------------------------
   dotspacemacs-configuration-layers mjl--layers
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
                                    php-extras ; MJL20151220 compilation errors
                                    )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-dark
                         solarized-light
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "s-SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "M-s-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido t
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'right
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  (setq frame-title-format '(buffer-file-name "%f" ("%b"))
        mouse-autoselect-window t
        display-time-24hr-format t
        vi-tilde-fringe-bitmap-array [8 20 42 85 42 20 8 0 0 0]
        indicate-unused-lines t
        scroll-bar-mode 'left
        scroll-conservatively 10000 ; MJL20160206 this should be set, not sure why it's not
        powerline-default-separator 'zigzag
        org-support-shift-select t
        )
  (blink-cursor-mode t)
  (global-prettify-symbols-mode t)
  (delete-selection-mode t)

  (add-hook 'before-save-hook 'time-stamp)
  (setq copyright-limit 1024)
  (add-hook 'before-save-hook 'copyright-update)

  ;; simple configs. Try to keep short and sweet. If it's complex, use
  ;; `with-eval-after-load', or make a separate Layer.
  (push "~/.spacemacs.d/config/" load-path)
  (when (member system-name mjl--work-systems)
    (require 'conf-mu4e nil t))
  (when (member 'python dotspacemacs-configuration-layers)
    (require 'conf-inferior nil t))
  ;; TODO make a separate layer for org config/packages
  (when (member 'org dotspacemacs-configuration-layers)
    (require 'conf-org nil t))
  )

;; MJL20160206 - I don't remember setting these?
;; TODO I should review it periodically and move into
;;      `dotspacemacs/user-config' when I understand what they do
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(paradox-github-token t)
 '(safe-local-variable-values (quote ((org-tags-match-list-sublevels . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))


;;; Local Variables: ***
;;; mode:Emacs-lisp ***
;;; fill-column: 79 ***
;;; comment-column: 0 ***
;;; End: ***
