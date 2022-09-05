;; vim: se ft=lisp:

;; $MSwin10\user\Emacs\init.el
;;  cpi $MSwin10\user\Emacs\init.el $Env:AppData\.emacs.d\init.el
;;  or symlink to  ~\AppData\Roaming\.emacsd\init.el  ($MSwin10\symlinks.ps1)
;;  or can be called by  $MSwin10\user\Emacs\initPoint.el

;; $Env:AppData\.emacs.d  directory
;; don't symlink it from Dropbox - some packages will fail to load
;; robocopy /mir $Env:AppData\.emacs.d $ITstack\MSwin-emacsd-RC /NP

;; I began here by adapting code from
;;  literatemacs  https://github.com/joseph8th/literatemacs - with thanks

;;;; 1 bootstrap  straight.el
;; 0 requires  $Env:AppData\.emacs.d\early-init.el  to undefine  package-enable-at-startup

;; 1 install straight.el
(defvar bootstrap-version)
(setq package-enable-at-startup nil)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; 2 install use-package
(straight-use-package 'use-package)

;; 3 configure use-package to use straight.el by default
(use-package straight
   :custom (straight-use-package-by-default t))

; ;;;; 1 bootstrap  use-package
; (require 'package)

; ;;; set package archives
; (setq package-check-signature nil)  ; because GNU ELPA keeps choking on the sigs
; (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
; (setq package-enable-at-startup nil)

; (package-initialize)
; (unless package-archive-contents
;     (package-refresh-contents))

; ;;; bootstrap use-package
; (unless (package-installed-p 'use-package)
;     (package-refresh-contents)
;     ;; this extra line was needed
;     (package-install 'use-package))

; (setq use-package-verbose t)
; (setq use-package-always-ensure t)
; (eval-when-compile (require 'use-package))
; (use-package auto-compile
;     :config (auto-compile-on-load-mode))
; (setq load-prefer-newer t)

; ;;;; 2 use-package-ensure
; ;; ensure all packages are installed
; (require 'use-package-ensure)
; (setq use-package-always-ensure t)

;;;; 2 auto-package-update
(use-package auto-package-update
    :config
    (setq auto-package-update-delete-old-versions t)
    (setq auto-package-update-hide-results t)
    (setq auto-package-update-show-preview t)
    (auto-package-update-maybe))

;;;; 3 Custom auto-created
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e8882a809fb14f2307410a659846a06bfa58a2279ffb1f5aca0c3aecbcb6aaee" default))
 '(package-selected-packages
   '(orderless marginalia vertico which-key rainbow-delimiters gruvbox-theme rainbow-mode ts auto-compile use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;; 4 settings
;; autopair
(electric-pair-mode 1)

;; Dired+
(use-package which-key)

;; Evil
(setq evil-default-state 'emacs)
(setq evil-shift-width 0)
(use-package evil)
(evil-mode 1)

;; general.el
(use-package general)

;; set locale to UTF8
(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; ts.el - more convenient date and time library
(use-package ts)

;;; directories files
;; auto-revert to disk on file change
(global-auto-revert-mode t)

;; recentf
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(run-at-time nil (* 5 60) 'recentf-save-list)

;;; Emacs
;; which-key
(use-package which-key)
(which-key-mode)

;;; layout
;; gruvbox-theme
(use-package gruvbox-theme)
  (load-theme 'gruvbox-dark-medium t)

;; highlight corresponding parentheses when cursor is on one
(show-paren-mode t)

;; highlight nested parentheses
(use-package rainbow-delimiters
    :config
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; no menu along the top
(menu-bar-mode -1)
;; no shortcut buttons along the top
(tool-bar-mode 0)

;; show color codes
(use-package rainbow-mode
    :config
    (setq rainbow-x-colors nil)
    (add-hook 'prog-mode-hook 'rainbow-mode))

;;; minibuffer - Marginalia
(use-package marginalia
    ; :load-path "elpa/marginalia-20220721.1833"
    :general
    (:keymaps 'minibuffer-local-map
              "M-A" 'marginalia-cycle)
    :custom
    (marginalia-max-relative-age 0)
    (marginalia-align 'right)
    :init
    (marginalia-mode))

;;; minibuffer - Orderless
(setq orderless-matching-styles '(orderless-flex))
(use-package orderless
    :ensure t
    :custom
    (completion-styles '(orderless basic))
    (completion-category-overrides '((file (styles basic partial-completion)))))

;;; minibuffer - vertico
(use-package vertico
  :init
  (vertico-mode)
  (setq vertico-count 16) ; number of candidates to display
  (setq vertico-resize t)
  (setq vertico-cycle nil) ; Go from last to first candidate and first to last (cycle)?
  :general
  (:keymaps 'vertico-map
            "<tab>" #'vertico-insert  ; insert selected candidate into text area
            "<escape>" #'minibuffer-keyboard-quit  ; close minibuffer
            "C-M-n" #'vertico-next-group
            "C-M-p" #'vertico-previous-group)
  )

