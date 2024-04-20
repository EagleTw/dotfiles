;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Yi-Ping Pan"
      user-mail-address "yipingp@outlook.com")

;; Auto maximized when open
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq default-frame-alist '((width . 90) (height . 40)))

;; line number
(global-display-line-numbers-mode)

;; Changeline if too long
(global-visual-line-mode)

;; Trailing whitespace
(setq-default show-trailing-whitespace t)

;; Column 80
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; kill-buffer with :q
;;(global-set-key [remap evil-quit] 'kill-buffer-and-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Appearence
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq doom-font (font-spec :family "IntelOne Mono" :"size 15"))
;(setq doom-theme 'doom-oceanic-next)
(setq doom-theme 'wombat)
;(setq doom-theme 'catppuccin)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(use-package hl-todo
  :hook ((prog-mode . hl-todo-mode)
         (markdown-mode . hl-todo-mode)
         (org-mode . hl-todo-mode))
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("DONE"     . "#00A36C")
          ("NOTE"     . "#D8BFD8")
          ("REMINDER" . "#CCCCFF")
          ("DOING"    . "#A569BD")
          ("TODO"       warning bold)
          ("WAIT"       font-lock-keyword-face bold)
          ("FIXME"      error bold)
          ("HACK"       font-lock-constant-face bold)
          ("DEPRECATED" font-lock-doc-face bold))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar notes-home (getenv "NOTES_HOME"))

;; Handle error if NOTES_HOME is not set
(unless notes-home
  (error "NOTES_HOME environment variable is not set"))

(setq org-directory notes-home)

;; C-c C-t followed by the selection key, the entry is switched to this state
;; S-<left> S-<right> to change state
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(s)" "WAIT(w)" "|" "DONE(d!)" "CANCELED(c!)")
        (sequence "REPORT(r)" "BUG(b)" "ANALYZED(a)" "|" "FIXED(f)")))

;; Enable logging of done tasks, and log stuff into the LOGBOOK drawer by
(after! org
  (setq org-log-done 'time) ; timestamp added when marked done
  (setq org-log-into-drawer t))

(setq org-agenda-files
      (list (concat notes-home "/README.org")
            (concat notes-home "/ielts_study/01_planner.org")
            (concat notes-home "/snps/snps_task.org")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LSP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar clangd-binary (getenv "MY_CLANGD"))

(if clangd-binary
    (progn
      (setq lsp-clients-clangd-executable clangd-binary)
      (message "Custom Clangd path is set to %s" clangd-binary))
  (message "Default Clangd path is set"))

;; Lsp performance tune
;; https://emacs-lsp.github.io/lsp-mode/page/performance/
(setq read-process-output-max (* 4 1024 1024)) ;; 4mb
(setq lsp-idle-delay 0.500)
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
