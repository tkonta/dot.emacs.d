;; git

(use-package magit
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  ;;コミットメッセージで途中で強制改行を入れない
  (setq git-commit-mode-hook nil)
)


(use-package git-gutter
  :config
  (global-git-gutter-mode t)
)

