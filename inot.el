;; ================================
;; Configuração estilo VSCode
;; ================================

;; Desabilitar tela inicial
(setq inhibit-startup-message t)

;; Mostrar números de linha e coluna
(global-display-line-numbers-mode 1)
(column-number-mode 1)

;; Destacar linha atual
(global-hl-line-mode 1)

;; Mostrar pares de parênteses
(electric-pair-mode 1)

;; Remover menus e barras (mais clean)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; ================================
;; Pacotes - MELPA e use-package
;; ================================
(require 'package)
(setq package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; ================================
;; Tema visual moderno
;; ================================
(use-package doom-themes
  :config
  (load-theme 'doom-one t))

;; ================================
;; Explorer de diretórios (VSCode sidebar)
;; ================================
(use-package neotree
  :bind ([f8] . neotree-toggle)
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

(use-package all-the-icons
  :if (display-graphic-p))

;; ================================
;; Autocompletar (Company + LSP)
;; ================================
(use-package company
  :init
  (global-company-mode 1))

(use-package lsp-mode
  :hook ((prog-mode . lsp))
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil))

(use-package lsp-ui :commands lsp-ui-mode)

;; ================================
;; Git (Magit)
;; ================================
(use-package magit
  :bind ("C-x g" . magit-status))

;; ================================
;; Terminal integrado
;; ================================
(use-package vterm
  :commands vterm
  :config
  (setq vterm-max-scrollback 10000))

;; ================================
;; Seleção e múltiplos cursores
;; ================================
(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

;; ================================
;; Melhor navegação (Ivy/Counsel)
;; ================================
(use-package ivy
  :init (ivy-mode 1))

(use-package counsel
  :after ivy
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-s" . swiper)))

;; ================================
;; Syntax Highlighting extra
;; ================================
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode))

;; ================================
;; Atalhos práticos VSCode-like
;; ================================
(global-set-key (kbd "C-S-l") 'goto-line)          ;; Ir para linha
(global-set-key (kbd "M-<up>") 'previous-line)     ;; Navegar rápido ↑
(global-set-key (kbd "M-<down>") 'next-line)       ;; Navegar rápido ↓
(global-set-key (kbd "C-d") 'kill-whole-line)      ;; Deletar linha
