;; 显示行号
(global-linum-mode)
;; 补全所有
(global-company-mode)
;; 不要生成带波浪线后缀的备份文件
(setq make-backup-files nil)
;; 关闭自己生产的保存文件
(setq auto-save-default nil)
;; 显示配对的括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; 高亮显示当前所在的行
;; (global-hl-line-mode)
;;设置一个别名将其简化为只输入 (y or n)
(fset 'yes-or-no-p 'y-or-n-p)
(provide 'init-better-defaults)
