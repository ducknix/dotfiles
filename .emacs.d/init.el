(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(setq custom-safe-themes t)

(setq-default message-log-max nil)
(kill-buffer "*Messages*")

(setq auto-save-default nil)
(setq make-backup-files nil)

(require 'package)
(setq package-check-signature t)

(require 'package)

(add-to-list 'package-archives 
    '("MELPA" .
      "http://melpa.org/packages/"))

(package-initialize)

(global-unset-key (kbd "C-W"))
(global-unset-key (kbd "C-x R"))
(global-unset-key (kbd "C-x S"))
(global-unset-key (kbd "C-c T"))
(global-unset-key (kbd "C-c s"))
(global-unset-key (kbd "C-c h"))

(global-set-key (kbd "C-w") 'delete-window)
(global-set-key (kbd "C-x R") 'restart-emacs)
(global-set-key (kbd "C-x t") 'shell)
(global-set-key (kbd "C-c T") 'treemacs)
(global-set-key (kbd "C-c s") 'hs-show-block)
(global-set-key (kbd "C-c h") 'hs-hide-block)

(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)


(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq package-check-signature nil)
(setq package-check-signature 'allow-unsigned)

(setq display-line-numbers (quote relative))
(global-display-line-numbers-mode t)

(require 'multiple-cursors)
(global-set-key (kbd "C-x F") 'mc/edit-lines)
(global-set-key (kbd "C-x <down>") 'mc/mark-next-like-this)
(global-set-key (kbd "C-x <up>") 'mc/mark-previous-like-this)
;;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(require 'good-scroll)
(good-scroll-mode 1)
(setq scroll-conservatively 10000)

(sml/setup)
(sml/apply-theme 'atom-one-dark)

(set-frame-font "Hack Nerd Font 10" nil t)
(set-face-bold-p 'bold "Hack Nerd Font")

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


(require 'centaur-tabs)
(centaur-tabs-mode t)

(global-set-key (kbd "C-c <left>")  'centaur-tabs-backward)
(global-set-key (kbd "C-c <right>") 'centaur-tabs-forward)

;;(centaur-tabs-change-fonts "Hack Nerd Font Mono" 99)
(centaur-tabs-change-fonts "SauceCodePro Nerd Font Mono" 120)

(centaur-tabs-headline-match)

(setq centaur-tabs-style "bar"
      centaur-tabs-height 32
      centaur-tabs-set-icons t
      centaur-tabs-set-bar 'left
      centaur-tabs-set-modified-marker t
      centaur-tabs-modified-marker ""
      centaur-tabs-label-fixed-length 12
      centaur-tabs-gray-out-icons 'buffer)

(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
;;
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-startup-banner "~/.emacs.d/gmeensers.png")
(setq dashboard-banner-logo-title "Emacs but shotgun"
      dashboard-init-info "KV41-BCZQ3-KMK")

(setq dashboard-footer-icon (all-the-icons-octicon "star"
                                                   :height 0
                                                   :v-adjust -0.05
                                                   :face 'font-lock-keyword-face))

;(setq dashboard-footer-messages '("\t\t\t\t\t\tBir alçak buna gülebilir ancak biraz da kayboldum, yoruldum ama kaçmadım.\n\t\t\t\t\t\t\t\t\tSavaş yanlısı saçlarından" "Kardeş, sen de bizdensin, gel yanaş" "Ben susarsam içki kokan tüm kadınlar şevke gelir" "İnsanım, hayalleri olan basit bi' insanım" "\t\t\t\t\t\t\t  Kuşların ötmesi mi şiirlerin bitmesi mi?\n\t\t\t\t\t\t\tHangi mevsimdeyiz, bunu bilmiyorum bilmelisin" "Naber? Sadece yaşamaya devam ediyorum" "Yersiz bi' öpücük gibiyim alırsın özgürsen zevk" "Ve kan ve hayat ve duygular bana mutluluk"))

(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)))

(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-set-footer nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5586a5db9dadef93b6b6e72720205a4fa92fd60e4ccfd3a5fa389782eab2371b" "49acd691c89118c0768c4fb9a333af33e3d2dca48e6f79787478757071d64e68" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "ed68393e901a88b9feefea1abfa9a9c5983e166e4378c71bb92e636423bd94fd" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" default))
 '(package-check-signature nil)
 '(package-selected-packages
   '(format-all pdf-tools atom-one-dark-theme smart-mode-line-atom-one-dark-theme smart-mode-line-powerline-theme smart-mode-line virtualenv pipenv jedi lsp-latex pretty-symbols markdown-preview-mode rtags cmake-ide highlight-parentheses neotree centaur-tabs treemacs-tab-bar helm lsp-mode yasnippet irony treemacs powerline-evil doom-themes ample-theme all-the-icons dashboard good-scroll multiple-cursors gnu-elpa-keyring-update restart-emacs)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq initial-scratch-message "")

(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

(setq inhibit-startup-buffer-menu t)

(add-hook 'window-setup-hook 'delete-other-windows)

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))


(load-theme 'doom-material-dark t)
(neotree)

(setq neo-window-fixed-size nil)
(setq neo-window-width 100)

(require 'highlight-parentheses)

(define-globalized-minor-mode global-highlight-parentheses-mode highlight-parentheses-mode
  (lambda nil (highlight-parentheses-mode t)))

(global-highlight-parentheses-mode t)

(require 'rtags)
(cmake-ide-setup)

(require 'lsp-latex)
(with-eval-after-load "tex-mode"
 (add-hook 'tex-mode-hook 'lsp)
 (add-hook 'latex-mode-hook 'lsp))

(with-eval-after-load "yatex"
 (add-hook 'yatex-mode-hook 'lsp))

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(electric-pair-mode)

(use-package pipenv
  :hook (python-mode . pipenv-mode)
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended))

(setq pipenv-with-flycheck nil)

(add-hook 'prog-mode-hook #'hs-minor-mode)

