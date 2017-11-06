;; <指的是远程代码，以=分隔
;; >指的是本地文件
(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://elpa.emacs-china.org/melpa/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)

;; initial ui
(require 'initial-ui)

;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (auctex sr-speedbar monokai-theme helm-gtags helm volatile-highlights use-package undo-tree iedit counsel-projectile company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "微软雅黑" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))

;; Latex Configuration(CTex)
(require 'tex-mik)
(load "~/.emacs.d/elpa/auctex-11.90.2/auctex.el" nil t t)
(load "~/.emacs.d/elpa/auctex-11.90.2/preview.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-view-program-list '(("SumatraPDF" "SumatraPDF %o")))
(setq TeX-view-program-selection '((output-pdf "SumatraPDF")))
(setq TeX-global-PDF-mode t TeX-engine 'xelatex)

(add-hook 'LaTeX-mode-hook (lambda ()
                             (turn-off-auto-fill)
                             (linum-mode 1)
                             (outline-minor-mode 1)
                             (setq TeX-show-compilation nil)
                             (setq TeX-clean-confirm nil)
                             (setq TeX-save-query nil)
                             (setq TeX-global-PDF-mode t
                                   TeX-engine 'xetex)
                             (add-to-list 'TeX-command-list
                                          '("XeLaTeX" "%'xelatex%(mode)%' %t"
                                            TeX-run-TeX nil t))
                             (setq TeX-command-default "XeLaTeX")
                             ))
