(package-initialize)

;; Fullscreen at startup.
(add-hook 'emacs-startup-hook 'toggle-frame-maximized)

(require 'package)

;; Add different package archives here.
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Uncomment for automatic refresh at start. (faster if it stays commented)
;;(package-refresh-contents)

;; Install all needed packages for this configuration.
(setq required-packages '(gruber-darker-theme company))
(dolist (package required-packages)
	(unless (package-installed-p package)
		(package-install package)))

;; Turn on company mode after init.
(add-hook 'after-init-hook 'global-company-mode)

;; Load preferred theme.
(load-theme 'gruber-darker t)

;; Automatically update buffers on file change.
(global-auto-revert-mode)

;; No unnecessary distractions.
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(toggle-frame-fullscreen)

;; Default block commenting style.
(defun default-comment-block-style ()
  (setq comment-start "// ")
  (setq comment-end ""))
(add-hook 'prog-mode-hook 'default-comment-block-style)

;; Display line numbers when in programming mode.
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Some random options.
(setq display-line-numbers-type 'relative)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)

;; Specifically for c mode.
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
	(c-set-offset 'case-label '+) ; use case that is indented within switch
 )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; Set up key bindings.
(global-set-key (kbd "C-.") 'compile)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 ;;'(custom-enabled-themes '(naysayer))
 '(custom-safe-themes
   '("e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" "18d1131ad6ff8e8e34287d6de9299faba4f1b03874278463fb6f38e3abe65bdc" default))
 '(package-selected-packages '(company gruber-darker-theme zig-mode naysayer-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
