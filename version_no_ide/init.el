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
  (require 'setup-helm))

(custom-set-variables
 '(package-selected-packages
   (quote
    (auctex sr-speedbar monokai-theme helm volatile-highlights use-package undo-tree counsel-projectile company))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "微软雅黑" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))

(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

(setq make-backup-files nil)

(load-theme 'monokai 1)

(global-linum-mode 1)
(setq column-number-mode 1)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(setq electric-pair-pairs '(
			    (?\{ . ?\})
			    (?\' . ?\')
			    ))

(electric-pair-mode t)

;; Latex Configuration(CTex)
(require 'tex-mik)
(load "~/.emacs.d/elpa/auctex-11.91.0/auctex.el" nil t t)
(load "~/.emacs.d/elpa/auctex-11.91.0/preview.el" nil t t)
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
