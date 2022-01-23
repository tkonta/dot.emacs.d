;; タグ生成とかしなくても、agを使い関数定義元へジャンプ出来る
(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config
  (setq dumb-jump-selector 'vertico)
  (setq dumb-jump-force-searcher 'rg)
  (dumb-jump-mode 1)
  :ensure
  )

