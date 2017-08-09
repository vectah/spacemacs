;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     vimscript
     shell-scripts
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (ivy :variables
          ivy-initial-inputs-alist nil)
     (mu4e :variables
           mu4e-installation-path "/usr/share/emacs/site-lisp")
     ;; helm
     ;; auto-completion
     ;; if you want to enable the tool tip...
     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-help-tooltip t)
     better-defaults
     emacs-lisp
     git
     markdown
     (org :variables
          org-use-speed-commands t)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-term-shell "/bin/bash")
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     search-engine
     colors
     pandoc
     themes-megapack
     imenu-list
     ibuffer
     python
     (ipython-notebook :variables
                       ein:use-auto-complete t)
     semantic
     (c-c++ :variables
            c-c++-enable-clang-support t)
     common-lisp
     gtags
     cscope
     html
     (javascript :variables
                 tern-command '("nodejs" "/home/brendanz/node_modules/tern/bin/tern"))
     (evil-snipe :variables
                 evil-snipe-enable-alternate-f-and-t-behaivors t
                 evil-snipe-override-local-mode t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     leuven-theme
     spaceline-all-the-icons
     all-the-icons-dired
     beacon
     irony
     irony-eldoc
     company-irony
     company-irony-c-headers
     flycheck-irony
     doom-themes
     gruvbox-theme
     function-args
     visual-regexp
     visual-regexp-steroids
     outorg
     outshine
     navi-mode
   )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

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
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 10)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(zenburn
                         gruvbox-dark-soft
                         spacemacs-dark
                         spacemacs-light
                         default)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state nil
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Hack"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
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
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
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
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (defvar outline-minor-mode-prefix "\M-#")
  (defvar spacemacs-evil-cursor-colors '((normal . "turquoise")
                                         (insert . "magenta"))
    "Colors assigned to evil states.")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (require 'spaceline-all-the-icons)
  (spaceline-all-the-icons-theme)

  (require 'beacon)
  (beacon-mode 1)

  ;; required packages for irony
  (require 'company-irony)
  (require 'company-irony-c-headers)
  (require 'irony-eldoc)

  ;; outshine/outorg/navi-mode settings ====================================
  (require 'outshine)
  (add-hook 'outline-minor-mode-hook 'outshine-hook-function)
  (setq outshine-use-speed-commands t)

  ;; attach outshine to major modes
  (add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)
  (add-hook 'python-mode-hook 'outline-minor-mode)
  (add-hook 'python-mode-hook 'outline-minor-mode)

  ;; visual regexp settings ================================================
  (require 'visual-regexp-steroids)

  ;; dired mode ===========================================================
  (require 'all-the-icons-dired)
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)


  ;; multiple cursors ======================================================
  ;; no prompt when using multiple cursors
  (setq mc/always-run-for-all t)

  ;; enable evil multiple cursors
  (global-evil-mc-mode t)

  ;; disables ===============================================================
  ;; apparently this fixes iedit in cc-mode...
  ;; https://github.com/hlissner/evil-multiedit/issues/8
  (setq ggtags-highlight-tag nil)

  ;; mu4e setup =============================================================
  ;;; Set up some common mu4e variables
  (setq mu4e-maildir "~/Maildir"
        mu4e-trash-folder "/Trash"
        mu4e-refile-folder "/Archive"
        mu4e-get-mail-command "offlineimap"
        mu4e-update-interval nil
        mu4e-compose-signature-auto-include nil
        mu4e-view-show-images t
        mu4e-view-show-addresses t
        send-mail-function 'smtpmail-send-it)

  ;; evil cursor color customization =========================================
  ;; this is who you change the evil cursor colors
  ;; (setq evil-normal-state-cursor '("light gray" box))
  ;; (setq evil-insert-state-cursor '("light sea green" bar))
  ;; (setq evil-motion-state-cursor '("light blue" box))
  ;; (setq evil-replace-state-cursor '("tomato" (hbar . 4)))

  ;; powerline customizations =================================================
  ;; (setq spaceline-version-control-p 'nil)
  (setq spaceline-minor-modes-p 'nil)
  (setq spaceline-flycheck-error-p 'nil)
  (setq spaceline-flycheck-info-p 'nil)
  (setq spaceline-flycheck-warning-p 'nil)
  ;; this is how you change the background of the modeline evil state colors
  (set-face-attribute 'spacemacs-normal-face
                      nil :background "medium sea green")

  (setq spaceline-all-the-icons-flycheck-status-p 'nil)
  (setq spaceline-all-the-icons-flycheck-status-info-p 'nil)
  (setq spaceline-all-the-icons-flycheck-alternate 'nil)
  (setq spaceline-all-the-icons-git-ahead-p t)
  (setq spaceline-all-the-icons-buffer-position-p t)

  ;; misc ======================================================================
  ;; this stupid mode indents when I do not want indents
  (electric-indent-mode nil)
  (fa-config-default)

  ;; change definition of a 'word' for evil mode - remove underline
  (add-hook 'c-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'csv-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

  ;; custom commands ===========================================================

  (defun big-comment-box (b e)
    "Draw a box comment around the region but arrange for the region to extend
     to at least the fill column. Place the point after the comment box."

    (interactive "r")

    (let ((e (copy-marker e t)))
      (goto-char b)
      (end-of-line)
      (insert-char ?  (- fill-column (current-column)))
      (comment-box b e 1)
      (goto-char e)
      (set-marker e nil)))

  (defun spacemacs-kill-buffer-and-window ()
    (interactive)
    (kill-buffer-and-window))

  ;; pop up current buffer
  (defun my-turn-current-window-into-frame ()
    (interactive)
    (let ((buffer (current-buffer)))
      (unless (one-window-p)
        (delete-window))
      (display-buffer-pop-up-frame buffer nil)))

  ;;;###autoload
  (defun ora-dired-rsync (dest)
    (interactive
     (list
      (expand-file-name
       (read-file-name
        "Rsync to:"
        (dired-dwim-target-directory)))))
    ;; store all selected files into "files" list
    (let ((files (dired-get-marked-files
                  nil current-prefix-arg))
          ;; the rsync command
          (tmtxt/rsync-command
           "rsync -arvz --progress "))
      ;; add all selected file names as arguments
      ;; to the rsync command
      (dolist (file files)
        (setq tmtxt/rsync-command
              (concat tmtxt/rsync-command
                      (shell-quote-argument file)
                      " ")))
      ;; append the destination
      (setq tmtxt/rsync-command
            (concat tmtxt/rsync-command
                    (shell-quote-argument dest)))
      ;; run the async shell command
      (async-shell-command tmtxt/rsync-command "*rsync*")
      ;; finally, switch to that window
      (other-window 1)))


  (defun load-notes ()
    (interactive)
    (find-file "~/org/notes.org"))

  (defun copy-file-path (&optional *dir-path-only-p)
    "Copy the current buffer's file path or dired path to `kill-ring'.
     Result is full path.
     If `universal-argument' is called first, copy only the dir path.
     URL `http://ergoemacs.org/emacs/emacs_copy_file_path.html'
     Version 2017-01-27"
    (interactive "P")
    (let ((-fpath
           (if (equal major-mode 'dired-mode)
               (expand-file-name default-directory)
             (if (buffer-file-name)
                 (buffer-file-name)
               (user-error "Current buffer is not associated with a file.")))))
      (kill-new
       (if *dir-path-only-p
           (progn
             (message "Directory path copied: 「%s」" (file-name-directory -fpath))
             (file-name-directory -fpath))
         (progn
           (message "File path copied: 「%s」" -fpath)
           -fpath )))))

  ;; auto-completion ===========================================================
  ;; customize the emacs lisp auto completion to not have capf
  (setq company-backends-emacs-lisp-mode '((company-elisp
                                            company-dabbrev-code
                                            company-keywords
                                            company-gtags
                                            company-etags)))

  ;; clean up the org mode completion a bit
  (setq company-backends-org-mode '(company-files))


  ;; clean up the c completions backends
  ;; (setq company-backends-c-mode-common '((company-dabbrev
  ;;                                         company-dabbrev-code
  ;;                                         company-keywords)
  ;;                                        (company-semantic)
  ;;                                        (company-etags
  ;;                                         company-gtags)))

  ;; (setq company-backends-c-mode-common '((company-clang
  ;;                                         company-semantic)
  ;;                                        (company-dabbrev-code
  ;;                                         company-keywords)
  ;;                                        (company-etags
  ;;                                         company-gtags)))

  (setq company-backends-c-mode-common '((company-irony
                                          company-irony-c-headers)
                                         (company-dabbrev-code
                                          company-keywords)
                                         (company-etags
                                          company-gtags)))

  (global-company-mode t)

  ;; appearance ================================================================
  ;; set the default separator to straight lines
  (setq powerline-default-separator 'nil)

  ;; blink the cursor and turn off the line highlight
  (blink-cursor-mode t)
  (global-hl-line-mode 0)

  ;; semantic ==================================================================
  ;; remove annoying semantic features
  ;; (add-hook 'semantic-mode-hook (lambda () (global-semantic-stickyfunc-mode -1)))
  (add-hook 'semantic-mode-hook (lambda () (global-semantic-idle-summary-mode -1)))

  ;; parsing #ifs in some files causes issues so disable globally
  ;; usually the problem is when a flag defined in a makefile is used to
  ;; disable an entire file
  (setq semantic-c-obey-conditional-section-parsing-flag 'nil)

  ;; c mode configuration ======================================================
  (add-hook 'c-mode-hook 'ggtags-mode)
  (add-hook 'c-mode-hook 'cscope-minor-mode)

  ;; add this if you want the fancys lines and whatnot under functions
  ;; (add-hook 'c-mode-hook 'semantic-decoration-mode)

  (with-eval-after-load 'cc-mode
    (setq c-default-style "bsd"
          c-basic-offset 2))

  ;; irony mode ===============================================================
  ;; I have enabled flycheck because for some reason irony does not re parse buffers
  ;; sometimes. I can get irony to re parse buffers by killing the server, but I did
  ;; not want to do that. (might go back to that if flycheck is too annoying)
  ;; However, flycheck does cause the buffers to be reparsed, thus making irony work
  ;; correctly. I disable all the error and warning marks because they are distracting and
  ;; more often than not, inaccurate in embedded projects. Turn them back on here.
  ;; see this issue for some more details...
  ;; https://github.com/Sarcasm/irony-mode/issues/364 

  (setq flycheck-indication-mode nil)
  (defun disable-flycheck-faces ()
    (interactive)
    (set-face-attribute 'flycheck-error nil :underline nil)
    (set-face-attribute 'flycheck-warning nil :underline nil))

  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'flycheck-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'irony-mode-hook #'irony-eldoc)
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
  ;; (add-hook 'after-save-hook 'irony-server-kill)

  ;; MACROS ====================================================================
  ;; uses '/' search for 'Local Function' and appends a function prototype from line at point
  ;; to the bottom of the block below 'Local Function'
  (fset 'insert-local-function-proto
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([121 121 109 109 47 76 111 99 97 108 32 70 117 110 99 116 105 111 110 115 return C-down 80 32 111 59 96 109 122 122] 0 "%d")) arg)))

  (fset 'paste-over-word
        [?c ?i ?w ?\C-r ?0 escape])

  (fset 'split-at-next-comma
        [?f ?, ?a return escape])

  (fset 'paste-over-remain-word
        [?c ?w ?\C-r ?0 escape])

  (fset 'add-semicolon
        [?A ?\; escape])

  ;; Custom keybindings ========================================================

  ;; two letters (,/;/n)
  (spacemacs/set-leader-keys "o," 'split-at-next-comma)
  (spacemacs/set-leader-keys "o;" 'add-semicolon)
  (spacemacs/set-leader-keys "on" 'load-notes)
  (spacemacs/set-leader-keys "ob" 'big-comment-box)

  ;; a (p/f) - ag
  (spacemacs/set-leader-keys "oap" 'counsel-projectile-ag)
  (spacemacs/set-leader-keys "oaf" 'counsel-ag)

  ;; c (d) - copy
  (spacemacs/set-leader-keys "ocd" 'copy-file-path)

  ;; f (r) - fill region
  (spacemacs/set-leader-keys "ofr" 'fill-region)

  ;; g (d/b/r) - ggtags
  (spacemacs/set-leader-keys "ogd" 'ggtags-find-tag-dwim)
  (spacemacs/set-leader-keys "ogb" 'ggtags-prev-mark)
  (spacemacs/set-leader-keys "ogr" 'ggtags-update-tags)

  ;; h (g) - helm
  (if (member 'helm dotspacemacs-configuration-layers)
      (eval (spacemacs/set-leader-keys "ohg" 'helm-grep-do-git-grep)))

  ;; i (p/d) - ivy
  (if (member 'ivy dotspacemacs-configuration-layers)
      (eval (spacemacs/set-leader-keys "oip" 'ivy-push-view)
            (spacemacs/set-leader-keys "oid" 'ivy-pop-view)))

  ;; p (w/o) - paste
  (spacemacs/set-leader-keys "opw" 'paste-over-word)
  (spacemacs/set-leader-keys "opo" 'paste-over-remain-word)

  ;; r (p/f) - ripgrep
  (spacemacs/set-leader-keys "orp" 'counsel-projectile-rg)
  (spacemacs/set-leader-keys "orf" 'counsel-rg)

  ;; s (s/d/m) - semantic
  (spacemacs/set-leader-keys "oss" 'semantic-ia-show-summary)
  (spacemacs/set-leader-keys "osd" 'semantic-describe-tag)
  (spacemacs/set-leader-keys "osm" 'helm-semantic-or-imenu)

  ;; v (q/r)
  (spacemacs/set-leader-keys "ovr" 'vr/replace)
  (spacemacs/set-leader-keys "ovq" 'vr/query-replace)
  (spacemacs/set-leader-keys "ovm" 'vr/mc-mark)

  ;; Number pad keybinds
  (global-set-key (kbd "<kp-1>")
                  'spacemacs/workspaces-transient-state/eyebrowse-switch-to-window-config-1-and-exit)
  (global-set-key (kbd "<kp-2>")
                  'spacemacs/workspaces-transient-state/eyebrowse-switch-to-window-config-2-and-exit)
  (global-set-key (kbd "<kp-3>")
                  'spacemacs/workspaces-transient-state/eyebrowse-switch-to-window-config-3-and-exit)

  ;; NOTE possible conflicting keybinds
  (with-eval-after-load 'cc-mode (define-key c-mode-map (kbd "C-c x")  'company-other-backend))
  (with-eval-after-load 'cc-mode (define-key c-mode-map (kbd "C-c d")  'semantic-ia-show-doc))
  (spacemacs/set-leader-keys "jy" 'avy-copy-line)
  (spacemacs/set-leader-keys "bk" 'spacemacs-kill-buffer-and-window)

  ;; IVY modifications =============================================================================
  (defun user-ivy-config ()

    (defun ivy-copy-to-buffer-action (x)
      (with-ivy-window
       (insert x)))

    (defun ivy-yank-action (x)
      (kill-new x))

    (ivy-set-actions
     t
     '(("i" ivy-copy-to-buffer-action "insert")
       ("y" ivy-yank-action "yank")))
    )
  ;; helm configuration ============================================================================
  (defun user-helm-config ()
    'nil
    )

  (if (member 'ivy dotspacemacs-configuration-layers)
      (user-ivy-config))

  (if (member 'helm dotspacemacs-configuration-layers)
      (eval (user-helm-config)))

  ;; python ====================================================================
  ;; (setq python-shell-exec-path "/home/brendanz/anaconda/bin")
  (setq python-shell-interpreter "/home/brendan/anaconda3/bin/python"
        python-shell-interpreter-args "-i")

  ;; terminal settings ===============================================================================
  ;; http://stackoverflow.com/questions/6820051/unicode-characters-in-emacs-term-mode/7442266#7442266
  (defadvice ansi-term (after advise-ansi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
  (ad-activate 'ansi-term)
  (add-hook 'term-mode-hook 'toggle-truncate-lines)

  ;; OD Config =================================================================
  (defun load-od-persp ()
    (interactive)
    (persp-load-state-from-file "~/.emacs.d/.cache/layouts/od-persp"))

  (defun save-od-persp ()
    (interactive)
    (persp-save-state-to-file "~/.emacs.d/.cache/layouts/od-persp"))
  (add-hook 'emacs-startup-hook 'load-od-persp)
  ;; custom layouts ============================================================
  (spacemacs|define-custom-layout "@dired"
    :binding "D")

  (spacemacs|define-custom-layout "@mu4e"
    :binding "M")

  ;; end of user config ========================================================
  )


;; end of user config ========================================================
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(custom-safe-themes
   (quote
    ("6fc0ae7cc2abd82d8add1140874ccf8773feaaae73a704981d52fdf357341038" "2d32455b3acc27bef4dc912f74c14a371cf7167a075bbd4f90ac14e761359e5b" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#383838" t)
 '(frame-brackground-mode (quote dark))
 '(jdee-db-active-breakpoint-face-colors (cons "#1c1f24" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1c1f24" "#7bc275"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1c1f24" "#484854"))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-files
   (quote
    ("~/org/tracker.org" "~/org/vest_charger.org" "~/org/vest_gun.org")))
 '(org-ellipsis "…")
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(org-pretty-entities t)
 '(package-selected-packages
   (quote
    (dired+ gruvbox-dark-soft-theme all-the-icons-dired org-category-capture request-deferred all-the-icons memoize leuven-theme beacon pdf-tools edit-server flycheck-irony doom-tomorrow-night-theme-theme doom-tomorrow-night-theme company-irony-c-headers ibuffer-projectile company-irony irony-eldoc irony flycheck-pos-tip flycheck abyss-theme spaceline-all-the-icons doom-vibrant-theme doom-themes zerodark-theme sourcerer-theme-theme sourcerer-theme navi-mode outshine outorg visual-regexp-steroids visual-regexp deferred company-quickhelp pos-tip mu4e-maildirs-extension mu4e-alert seoul256-theme vimrc-mode dactyl-mode insert-shebang fish-mode company-shell helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-cscope helm-company helm-c-yasnippet helm-ag ace-jump-helm-line challenger-deep-theme slime-company slime common-lisp-snippets function-args evil-snipe zonokai-theme zenburn-theme zen-and-art-theme yapfify xterm-color xcscope web-mode web-beautify unfill underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stickyfunc-enhance srefactor spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme rainbow-mode rainbow-identifiers railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme pandoc-mode ox-pandoc ht orgit organic-green-theme org-projectile org-present org-pomodoro alert log4e gntp org-download omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mwim mustang-theme multi-term monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow madhat2r-theme lush-theme livid-mode skewer-mode simple-httpd live-py-mode light-soap-theme less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme imenu-list hy-mode htmlize heroku-theme hemisu-theme hc-zenburn-theme haml-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md ggtags gandalf-theme fuzzy flatui-theme flatland-theme firebelly-theme farmhouse-theme evil-magit magit magit-popup git-commit with-editor espresso-theme eshell-z eshell-prompt-extras esh-help engine-mode emmet-mode ein websocket dracula-theme django-theme disaster darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web web-completion-data company-tern dash-functional tern company-statistics company-c-headers company-anaconda company color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode coffee-mode cmake-mode clues-theme clang-format cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet yasnippet apropospriate-theme anti-zenburn-theme anaconda-mode pythonic ample-zen-theme ample-theme alect-themes afternoon-theme ac-ispell auto-complete ws-butler winum which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline smex restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-make helm helm-core google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump popup f s diminish define-word counsel-projectile projectile pkg-info epl counsel swiper ivy column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash async aggressive-indent adaptive-wrap ace-window ace-link avy)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(safe-local-variable-values
   (quote
    ((org-todo-keyword-faces
      ("ANSWER" . "orange")
      ("ARCHIVED" . "blue")
      ("DATE" . "red")
      ("DOING" . "yellow")
      ("DONE" . "green")
      ("HPSM" . "red")
      ("JIRA" . "red")
      ("TODO" . org-warning)
      ("WAITING" . "orange"))
     (org-todo-keyword-faces
      ("TODO" . "red")
      ("WAIT" . "orange")
      ("DONE" . "green"))
     (eval progn
           (require
            (quote projectile))
           (puthash
            (projectile-project-root)
            "make -C /home/brendanz/microchip/harmony/v1_08_01/apps/tcpip/od_charger_wifi/firmware/VoidVestCharger.X --file=nbproject/Makefile-pic32mz_ef_sk__ioexp__freertos.mk" projectile-compilation-cmd-map))
     (c-basic-style . "k&r")
     (semantic-c-obey-conditional-section-parsing-flag))))
 '(send-mail-function (quote mailclient-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(spaceline-all-the-icons-clock-always-visible nil)
 '(spaceline-all-the-icons-flycheck-alternate t)
 '(spaceline-all-the-icons-separator-type (quote none))
 '(spaceline-all-the-icons-slim-render t)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(org-level-1 ((t (:foreground "#83a598" :weight bold :height 1.2))))
 '(org-tag ((t (:foreground "gray" :weight bold)))))
