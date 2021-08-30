(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(use-package evil
  :init      ;; tweak evil's configuration before loading it
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (evil-mode))
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
(use-package general
  :config
  (general-evil-setup t))

(use-package gcmh
     :config
     (gcmh-mode 1))
  ;; Setting garbage collection threshold
  (setq gc-cons-threshold 402653184
        gc-cons-percentage 0.6)

  ;; Profile emacs startup
  (add-hook 'emacs-startup-hook
            (lambda ()
              (message "*** Emacs loaded in %s with %d garbage collections."
                       (format "%.2f seconds"
                               (float-time
                                (time-subtract after-init-time before-init-time)))
                       gcs-done)))

  ;; Silence compiler warnings as they can be pretty disruptive (setq comp-async-report-warnings-errors nil)

;; Silence compiler warnings as they can be pretty disruptive
(if (boundp 'comp-deferred-compilation)
    (setq comp-deferred-compilation nil)
    (setq native-comp-deferred-compilation nil))
;; In noninteractive sessions, prioritize non-byte-compiled source files to
;; prevent the use of stale byte-code. Otherwise, it saves us a little IO time
;; to skip the mtime checks on every *.elc file.
(setq load-prefer-newer noninteractive)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)

(use-package all-the-icons)

(set-face-attribute 'default nil
  :font "CascadiaCode 11"
  :weight 'Regular)
(set-face-attribute 'variable-pitch nil
  :font "CascadiaCode 11"
  :weight 'Regular)
(set-face-attribute 'fixed-pitch nil
  :font "CascadiaCode 11"
  :weight 'Regular)
;; Makes commented text and keywords italics.
;; This is working in emacsclient but not emacs.
;; Your font must have an italic face available.
(set-face-attribute 'font-lock-comment-face nil
  :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
  :slant 'italic)

;; Uncomment the following line if line spacing needs adjusting.
(setq-default line-spacing 0.12)

;; Needed if using emacsclient. Otherwise, your fonts will be smaller than expected.
(add-to-list 'default-frame-alist '(font . "CascadiaCode 11"))
;; changes certain keywords to symbols, such as lambda!
(setq global-prettify-symbols-mode t)

;; zoom in/out like we do everywhere else.
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'textscale-decrease)

(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

(use-package lsp-mode
  :init
  ;; set prefix for lsp command-keymap (few alternatives - "C-l". "C-c l"
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode (e. g. python-mode)
  (XXX-mode . lsp)
  ;; if you want which-key integration
  (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package dashboard
 :init      ;; tweak dashboard config before loading it
 (setq dashboard-set-heading-icons t)
 (setq dashboard-set-file-icons t)
 (setq dashboard-banner-logo-title "EMACS")
 ;;(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
 (setq dashboard-startup-banner "~/.emacs.d/emacs-dash.png")  ;; use custom image as banner
 (setq dashboard-center-content nil) ;; set to 't' for centered content
 (setq dashboard-items ';;((recents . 5)
			 ((agenda . 5 )
			 (bookmarks . 3)
			 ;;(projects . 3)
			 (registers . 3)))
 :config
 (dashboard-setup-startup-hook)
 (dashboard-modify-heading-icons '((recents . "file-text")
			     (bookmarks . "book"))))
;; Ensuring it opens on startup
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

(setq browse-url-browser-function 'eww-browse-url) ; emacs browser
