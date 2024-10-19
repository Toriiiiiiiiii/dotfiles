(package-initialize)

;; Use custom file to prevent overwriting config
(setq custom-file "~/.emacs.custom.el")
(load custom-file)

(setq compilation-window-height 10)

(add-to-list 'default-frame-alist '(font . "Iosevka"))
(add-to-list 'load-path "~/.emacs.local/")

(load-file "~/.emacs.rc/rc.el")

(setq-default inhibit-splash-screen t
	      tab-width 4
	      indent-tabs-mode nil)

;; Disable unwanted elements
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; Enable line numbers
(global-display-line-numbers-mode)

;; Simple C mode for faster editing of C/C++ files.
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

;; Petl mode for editing Petl files.
(require 'petl-mode)

;; Odin mode for editing Odin files.
(require 'odin-mode)

;; IDO Mode
(rc/require 'smex 'ido-completing-read+)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

(global-set-key (kbd "M-x") 'smex)

;; Make window split horizontally instead of vertically
(setq split-width-threshold nil)

;; Colour theme
(load-file "~/git/nordic-night/nordic-night-theme.el")
(load-theme 'nordic-night t)

(setq display-line-numbers-type 'relative)
