;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Yi-Ping Pan"
      user-mail-address "yipingp@outlook.com")

;; Gargadge collection threshold (default 8kb)
(setq gc-cons-threshold 200 * 1024 * 1024       ;200mb
      gc-cons-percentage 0.6)

;; For performance on SNPS machine
(setq flycheck-check-syntax-automatically '(save))

(global-so-long-mode 1) ;; Avoid performance issues in large files
(xterm-mouse-mode 1)    ;; extern experience

(org-babel-do-load-languages
 'org-babel-load-languages
 '((haskell . t)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Text
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; font setting
(setq doom-font (font-spec :family "JetBrains Mono" :size 18))

;; Changeline if too long
(global-visual-line-mode t)

(setq display-line-numbers 'relative)
(global-display-line-numbers-mode t)

;; Column 80
(setq-default display-fill-column-indicator-column 80)
(global-display-fill-column-indicator-mode 1)

;; kill-buffer with :q
;;(global-set-key [remap evil-quit] 'kill-buffer-and-window)

;; tab
(setq-default tab-width 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Appearence
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto maximized when open
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq default-frame-alist '((width . 100) (height . 40)))

;; Fonts and themes
;(setq doom-theme 'doom-oceanic-next)
;(setq doom-theme 'modus-vivendi)
(setq doom-theme 'gruber-darker)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Copilot
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package! copilot
  ;;hook (prog-mode . copilot-mode)
  :commands copilot-mode
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar notes-home (getenv "NOTES_HOME"))

;; Handle error if NOTES_HOME is not set
(unless notes-home
  (error "NOTES_HOME environment variable is not set"))

(setq org-directory notes-home)

;; Enable logging of done tasks, and log stuff into the LOGBOOK drawer by
(after! org
  (setq org-log-done 'time) ; timestamp added when marked done
  (setq org-log-into-drawer t)
  (setq org-agenda-files
        (directory-files-recursively notes-home "\\.org")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LSP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clangd path for snps development
;; setenv MY_CLANGD ...
(defvar clangd-binary (getenv "MY_CLANGD"))
(if clangd-binary
    (progn
      (setq lsp-clients-clangd-executable clangd-binary)
      (message "Custom Clangd path is set to %s" clangd-binary))
  (message "Default Clangd path is set"))

;; Lsp performance tune
;; https://emacs-lsp.github.io/lsp-mode/page/performance/
(setq read-process-output-max (* 4 1024 1024)) ;; 4mb
;;(setq lsp-idle-delay 0.500)
(setq lsp-log-io nil) ; if set to true can cause a performance hit

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
