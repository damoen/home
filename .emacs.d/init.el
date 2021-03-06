;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (leuven)))
 '(org-download-screenshot-method "gnome-screenshot -a -f %s")
 '(package-selected-packages
   (quote
    (speed-type simpleclip evil shell-pop neotree ## async ox-twbs htmlize)))
 '(safe-local-variable-values
   (quote
    ((org-download-heading-lvl)
     (org-download-image-dir . "~/./assets/images")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; my stuff ----

;; repos


(require 'package) ; melpha
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(add-to-list 'package-archives
    '("melpa" . "http://melpa.org/packages/"))

;; Manually installed packages

;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; load the packaged named xyz.
(load "org-download") ;; best not to include the ending “.el” or “.elc”
(load "ox-twbs") ;; best not to include the ending “.el” or “.elc”
(load "org-bullets.el") ;; best not to include the ending “.el” or “.elc”

;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Prevent new buffers from splitting windows
(setq pop-up-windows nil)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

;; EVIL MODE
(require 'evil)
  (evil-mode 1) 

;; always yank to black hole
(defun bb/evil-delete (orig-fn beg end &optional type _ &rest args)
  (apply orig-fn beg end type ?_ args))
(advice-add 'evil-delete :around 'bb/evil-delete)

;; save desktop on exit
(desktop-save-mode 1)

;; neotree
(add-to-list 'load-path "/root/shared")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; use arrows to nav windows
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

;; window resize
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;;; ORG MODE

;; show everything on startup
(org-set-startup-visibility)

;; disable default inline styling
;(setq org-html-head-include-default-style nil)

;; set overflow to scroll for default inline styling
(setq org-html-head "<style> .pre.src { overflow: scroll; !important} </style>")

;; pretty bullets
;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; org-download (image drag)
(setq-default org-download-image-dir "./assets/images")
;(setq-default org-download-timestamp "") ;does not seem to work
(setq org-download-heading-lvl nil)


;; fontify code in code blocks
(setq org-src-fontify-natively t)


;; <b <TAB> for sh src
(add-to-list 'org-structure-template-alist ;
        '("b" "#+BEGIN_SRC sh\n#+END_SRC" "<src lang=\"sh\">\n\n</src>"))

;; display images
(setq org-display-inline-images t) 
(setq org-redisplay-inline-images t) 
(setq org-startup-with-inline-images "inlineimages")

(setq org-link-escape-chars
  ;;%20 %5B %5D %25
  '(?\[ ?\] ?%)
  )

;; editor syntax highlighting
(setq org-src-fontify-natively t
    org-src-preserve-indentation t
    org-src-tab-acts-natively t)
