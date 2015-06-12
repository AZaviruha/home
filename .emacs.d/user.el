;; Custom Emacs

;; Preparation
;; cd ~/.emacs.d/vendor/tern/
;; sudo npm i
;; sudo ln -s -T /home/azaviruha/.emacs.d/vendor/tern/bin/tern /usr/bin/tern

(load "~/.emacs.d/themes.el")

;; Place downloaded elisp files in this directory. You'll then be able
;; to load them.
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/vendor/tern/")
(add-to-list 'load-path "~/.emacs.d/vendor/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)


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


; ================================================================== ;
; =========================== Generic IDE ========================== ;
; ================================================================== ;
;; Auto-complete mode
;; should be loaded after yasnippet so that they can work together
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(global-auto-complete-mode t)
;; ;; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
;; ;; case sensitivity is important when finding matches
(setq ac-ignore-case nil)


; ================================================================== ;
; =========================== JavaScript =========================== ;
; ================================================================== ;
(add-hook 'js-mode-hook  'js2-minor-mode)
;; (add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern-mode
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))


(evil-define-key 'insert tern-mode-keymap 
  (kbd "M-.")   'tern-find-definition 
  (kbd "C-SPC") (lambda () 
				 (interactive)
				 (tern-ac-setup)
				 (tern-ac-complete)))

(evil-define-key 'normal tern-mode-keymap 
  (kbd "M-.")   'tern-find-definition 
  (kbd "C-SPC") (lambda () 
				 (interactive)
				 (tern-ac-setup)
				 (tern-ac-complete)))

(evil-define-key 'motion tern-mode-keymap 
  (kbd "M-.")   'tern-find-definition 
  (kbd "C-SPC") (lambda () 
				 (interactive)
				 (tern-ac-setup)
				 (tern-ac-complete)))



;; (define-key evil-insert-state-map (kbd "M-.") 'tern-find-definition)
;; (define-key evil-motion-state-map (kbd "M-.") 'tern-find-definition)
;; (define-key evil-normal-state-map (kbd "M-.") 'tern-find-definition)
