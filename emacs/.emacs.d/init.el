;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'geiser)
(setq-default geiser-repl-use-other-window nil)
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
 '(default ((t (:family "Space Mono"
                        :foundry "CF  "
                        :slant normal
                        :weight normal
                        :height 98
                        :width normal))))
 '(whitespace-space ((t (:foreground "gray")))))

(setq-default inhibit-splash-screen t)
(setq-default fill-column 80)
(add-hook 'prog-mode-hook 'ruler-mode)
(setq-default indent-tabs-mode nil)
(add-hook 'prog-mode-hook 'whitespace-mode)
