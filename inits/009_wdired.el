;; diredで直接ファイル名編集

(use-package wdired
  :config
  (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
)


