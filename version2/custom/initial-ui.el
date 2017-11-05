;; 快速打开配置文件
(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

;; 禁止生成备份文件
(setq make-backup-files nil)

;; 自动加载monokai主题
(load-theme 'monokai 1)

;; 显示行号
(global-linum-mode 1)
(setq column-number-mode 1)

;; 括号配对
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(setq electric-pair-pairs '(
                            (?\{ . ?\})
                            (?\' . ?\')
;;                            (?\< . ?\>)
                            ))
(electric-pair-mode t)

;; 关闭滑动栏
(scroll-bar-mode -1)

(setq c-default-style "linux"
      c-basic-offset 8)
(c-set-offset 'substatement-open 0)

(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(provide 'initial-ui)
