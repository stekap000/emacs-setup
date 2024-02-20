(add-hook 'emacs-startup-hook 'toggle-frame-maximized)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(setq display-line-numbers-type 'relative)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq ring-bell-function 'ignore)
(toggle-frame-fullscreen)

(global-set-key (kbd "C-.") 'compile)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" "18d1131ad6ff8e8e34287d6de9299faba4f1b03874278463fb6f38e3abe65bdc" default))
 '(package-selected-packages '(gruber-darker-theme zig-mode naysayer-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'gruber-darker t)
;;(load-theme 'naysayer t)

(defun my-c-mode-common-hook ()
 ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
 (c-set-offset 'substatement-open 0)
 ;; other customizations can go here

 (setq c++-tab-always-indent t)
 (setq c-basic-offset 4)                  ;; Default is 2
 (setq c-indent-level 4)                  ;; Default is 2

 (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
 (setq tab-width 4)
 (setq indent-tabs-mode t)  ; use spaces only if nil
 )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
