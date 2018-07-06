;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(pdf-tools-install)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000"
    "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (tango)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(whitespace-style
   (quote (face trailing spaces newline space-mark newline-mark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Latin Modern Mono" :foundry "UKWN"
                :slant normal :weight normal :height 120 :width normal))))
 '(whitespace-space ((t (:foreground "gray")))))

(cua-mode)
(setq-default inhibit-splash-screen t)
(setq-default fill-column 80)
(add-hook 'prog-mode-hook 'ruler-mode)
(setq-default indent-tabs-mode nil)
(add-hook 'find-file-hook 'whitespace-mode)

(add-hook 'scheme-mode-hook
          (lambda ()
            (require 'geiser)
            (setq-default geiser-active-implementations '(guile racket))
            (setq-default geiser-repl-use-other-window nil)
            (setq-default geiser-repl-query-on-kill-p nil)))
(add-hook 'python-mode-hook
          (lambda ()
            (setq fill-column 79)
            (setq comment-fill-column 72)))
; The SBCL binary and command-line arguments
(setq inferior-lisp-program "/usr/local/bin/sbcl --noinform")
