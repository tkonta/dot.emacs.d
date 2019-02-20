;; タグ生成とかしなくても、関数定義元へジャンプ出来る
(use-package dumb-jump
  :config
  (setq dumb-jump-mode t)
  (setq dumb-jump-selector 'helm) ;; 候補選択をivyに任せます
  (setq dumb-jump-use-visible-window nil)

(add-hook 'dumb-jump-hook
  (lambda ()
    ;;(define-key dired-mode-map (kbd "C-o") 'other-window-or-split) ;; jump other window
    (local-unset-key (kbd "C-M-p")) ;; elscrenn用
    ))


  )

