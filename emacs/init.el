; FILE:     ~/.emacs.d/init.el
; AUTHOR:   O** S**

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(setq auto-save-default nil)
(setq make-backup-files nil)

(setq initial-scratch-message nil)

(setq-default message-log-max nil)
(kill-buffer "*Messages*")

(require 'package)
(add-to-list 'package-archives 
    '("MELPA" .
      "http://melpa.org/packages/"))
(package-initialize)

(global-unset-key (kbd "C-w"))
(global-unset-key (kbd "C-x R"))
(global-unset-key (kbd "C-x s"))

(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

(global-set-key (kbd "C-w") 'delete-window)
(global-set-key (kbd "C-x R") 'restart-emacs)
(global-set-key (kbd "C-x t") 'shell)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(set-frame-font "Source Code Pro" nil t)

; Python Auto-complate
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; ----

(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
    projectile hydra flycheck company avy which-key helm-xref dap-mode))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

(setq package-check-signature nil)
(setq package-check-signature 'allow-unsigned)

(setq display-line-numbers (quote relative))
(global-display-line-numbers-mode t)
(add-hook 'treemacs-mode-hook (lambda() (display-line-numbers-mode -1)))

(add-to-list 'default-frame-alist '(height . 35))
(add-to-list 'default-frame-alist '(width . 140))

(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(toggle-frame-maximized)
(electric-pair-mode t)
(mode-icons-mode)

(require 'all-the-icons)
(use-package all-the-icons
  :if (display-graphic-p))

(add-to-list 'auto-mode-alist '("\\.nasm\\'" . nasm-mode))

(setq tab-always-indent 'complete)
(setq c-default-style "linux")
(setq-default tab-width 4)

(global-set-key (kbd "TAB") 'tab-to-tab-stop)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'treemacs)

(use-package treemacs
  :ensure t
  :defer t
  :init
  :config
  (progn
	(setq
	  treemacs-width 30
	 )
	)
  )

(when (display-graphic-p)
  (require 'all-the-icons))

(treemacs)

(treemacs-create-theme "Default"
  :icon-directory "~/.emacs.d/icons/"
  :config
  (progn
    (treemacs-create-icon :file "folder-root.png"   :fallback ""       :extensions (root-open))
    (treemacs-create-icon :file "folder-root-outline.png" :fallback ""       :extensions (root-closed))
	(treemacs-create-icon :file "folder-outline.png" :fallback ""       :extensions (dir-closed))
	(treemacs-create-icon :file "folder.png" :fallback ""       :extensions (dir-open))
	(treemacs-create-icon :file "file.png" :fallback ""       :extensions ("*"))
	))

(treemacs-load-theme "Default")

(treemacs-define-custom-image-icon "~/.emacs.d/icons/toml.png" "toml" "tml")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/c-h.png" "h")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/c.png" "c")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/cmake.png" "CMakeLists.txt" "cmake" "CMakeCache.txt")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/cpp-h.png" "hpp" "hxx")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/cpp.png" "cpp" "cxx")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/csharp.png" "cs")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/css.png" "css")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/json.png" "json" "json5")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/lua.png" "lua")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/markdown.png" "md")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/php.png" "php")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/cython.png" "pyx")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/python.png" "py" "pyz" "pyw")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/readme.png" "README" "README.md" "readme.me")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/vue.png" "vue")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/xaml.png" "xmal" "xml")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/yaml.png" "yml" "yaml")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/config.png" "cfg" "config")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/godot.png" "gd")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/ahk.png" "ahk")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/emacs.png" "el" "elc")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/make.png" "make" "Makefile")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/gitignore.png" "git" "gitignore")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/pyfile.png" "Pipfile" "Pipfile.lock" "requirements.txt")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/bin.png" "o" "out" "app" "so" "exe")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/txt.png" "txt" "text" "log")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/shell.png" "sh" "bash" "zsh" "ksh" "csh" "fish" "ps1" "bat" "nu")
(treemacs-define-custom-image-icon "~/.emacs.d/icons/qt.png" "qt" "qt5" "qml" "QML")

(treemacs-refresh)

;;;; Theme
;; https://github.com/techquila/melancholy-theme

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'melancholy t)


(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp)

(setq load-path (cons (expand-file-name "/dir/with/cmake-mode") load-path))

(require 'cmake-mode)
(require 'rtags)
(cmake-ide-setup)


(require 'cmake-project)
(defun maybe-cmake-project-mode ()
  (if (or (file-exists-p "CMakeLists.txt")
          (file-exists-p (expand-file-name "CMakeLists.txt" (car (project-roots (project-current))))))
      (cmake-project-mode)))

(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(require 'spaceline)
(use-package spaceline
  :ensure t)

(use-package spaceline-config
  :ensure spaceline
  :config
  (spaceline-helm-mode 1)
  (spaceline-emacs-theme)
  (spaceline-toggle-org-clock-on)
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-version-control-on)
  (spaceline-toggle-flycheck-error-on)
  (spaceline-toggle-flycheck-warning-on)
  (spaceline-toggle-flycheck-info-on)
  (spaceline-toggle-hud-on))

(setq-default cursor-type 'bar) 

(use-package format-all
  :bind ("C-c C-f" . format-all-buffer))
(custom-set-variables
 '(package-selected-packages
   '(dashboard lsp-mode yasnippet lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode)))

(setq initial-buffer-choice (lambda () (get-buffer "*scratch*")))
(setq dashboard-banner-logo-title "Acizler için imkânsız, korkaklar için müthiş gözüken şeyler kahramanlar için idealdir.")

(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)

(setq dashboard-items '((recents  . 4)
                        (bookmarks . 5)))

(setq dashboard-startup-banner "~/.emacs.d/icons/atam.png")
(setq dashboard-init-info "~ Mustafa Kemal Atatürk")

(setq dashboard-set-footer nil)

(setq dashboard-item-names '(("Recent Files:" . "Son Açılan Dosyalar:")
                             ("Bookmarks:" . "Yer İmleri:")))

(require 'dashboard)
(dashboard-setup-startup-hook)
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
