;; タグ生成とかしなくても、関数定義元へジャンプ出来る
(use-package flycheck
  :config
  ;;(add-hook 'after-init-hook #'global-flycheck-mode)

  ;; コード変更後、3秒後にチェックする
  (setq flycheck-idle-change-delay 3)
  (global-set-key "\M-n" 'flycheck-next-error)
  (global-set-key "\M-p" 'flycheck-previous-error)
  (define-key global-map (kbd "\C-cd") 'flycheck-list-errors)


  )

