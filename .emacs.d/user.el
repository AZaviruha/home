;; Custom Emacs

;; Place downloaded elisp files in this directory. You'll then be able
;; to load them.
(add-to-list 'load-path "~/.emacs.d/vendor")

;; Themes
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;(add-to-list 'load-path "~/.emacs.d/themes")
;; Uncomment this to increase font size
;; (set-face-attribute 'default nil :height 140)
;(load-theme 'tomorrow-night-bright t)


; ================================================================== ;
; =============================== VIM ============================== ;
; ================================================================== ;
;; (global-set-key "\C-w" 'clipboard-kill-region)
;; (global-set-key "\M-w" 'clipboard-kill-ring-save)
;; (global-set-key "\C-y" 'clipboard-yank)

(global-set-key [(shift delete)] 'clipboard-kill-region)
(global-set-key [(control insert)] 'clipboard-kill-ring-save)
(global-set-key [(shift insert)] 'clipboard-yank)

; NerdCommenter
(require 'evil-nerd-commenter)
(evilnc-default-hotkeys)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(require 'evil)
(evil-mode 1)
