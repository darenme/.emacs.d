;; cl - Common Lisp Extension
(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  ;; 这行初始化包必须要
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

					; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      company
		      smex
		      ;; --- Better Editor ---
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      popwin
		      ;; --- Major Mode ---
		      ;; js2-mode
		      ;; --- Minor Mode ---
		      ;; nodejs-repl
		      ;; exec-path-from-shell
		      ;; --- Themes ---
		      ;; monokai-theme
		      ;; solarized-theme
		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; config for hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; config for smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; config for js2-mod for js files
;; (setq auto-mode-alist
;;      (append
;;      '(("\\.js\\'" . js2-mode))
;;      auto-mode-alist))

;; config for popwin
(require 'popwin)
(popwin-mode 1)

;; swiper增强minibuffer
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(provide 'init-packages)
