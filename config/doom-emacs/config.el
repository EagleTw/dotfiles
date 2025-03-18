;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General User Information
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq user-full-name "Yi-Ping Pan"
      user-mail-address "yipingp@outlook.com")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Environment Detection
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq work-computer-p (string= (or (getenv "MYCOMPUTER") "") "WORK"))

(if work-computer-p
    (message "Running on WORK computer, using minimal setup")
  (message "Running on HOME computer, using full setup"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Performance Tweaks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq gc-cons-threshold (* 200 1024 1024)  ; 200MB
      gc-cons-percentage 0.6)

;; Performance improvements for large files & syntax checking
(global-so-long-mode 1)  ;; Avoid performance issues in large files
(setq flycheck-check-syntax-automatically '(save))

;; Improve LSP performance
(setq read-process-output-max (* 4 1024 1024)) ;; 4MB
(setq lsp-log-io nil) ; Avoid performance hits from excessive logging

(after! evil-escape
  (setq evil-escape-key-sequence nil)) ;; Disable escape sequence detection

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UI & Appearance
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq doom-theme 'gruber-darker)

(setq doom-font (font-spec :family "JetBrains Mono" :size 18))

;; Window size on startup
(setq default-frame-alist '((width . 100) (height . 40)))

;; Line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;; Highlight column 80
(setq-default display-fill-column-indicator-column 80)
(global-display-fill-column-indicator-mode 1)

;; Enable soft word wrap (useful for prose writing)
(global-visual-line-mode t)

;; Remove GUI elements for minimal work setup
(when work-computer-p
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode Setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar notes-home (getenv "NOTES_HOME"))

;; Handle missing NOTES_HOME
(unless notes-home
  (error "NOTES_HOME environment variable is not set"))

(setq org-directory notes-home)

(after! org
  (setq org-log-done 'time) ; Log task completion times
  (setq org-log-into-drawer t) ; Store logs in a dedicated drawer
  (setq org-agenda-files
        (directory-files-recursively notes-home "\\.org")))

(unless work-computer-p
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((haskell . t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Development: LSP & Clangd Setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar clangd-binary (getenv "MY_CLANGD"))

(if clangd-binary
    (progn
      (setq lsp-clients-clangd-executable clangd-binary)
      (message "Custom Clangd path is set to %s" clangd-binary))
  (message "Using default Clangd path"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Copilot Setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package! copilot
  :commands copilot-mode
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keybindings & Miscellaneous
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default tab-width 4)
