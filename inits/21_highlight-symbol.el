;; 検索文字をハイライトしっぱなしにする
(use-package highlight-symbol
  :config
  ;; (global-undo-tree-mode t)
  ;; (global-set-key (kbd "M-/") 'undo-tree-redo)

  ;; 1秒後自動ハイライトされるようになる
  (setq highlight-symbol-idle-delay 1.0)
  ;; 自動ハイライトをしたいならば
  (add-hook 'prog-mode-hook 'highlight-symbol-mode)
  ;; ソースコードにおいてM-p/M-nでシンボル間を移動
  (add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
  ;; シンボル置換
  (global-set-key (kbd "M-s M-r") 'highlight-symbol-query-replace)

  )
