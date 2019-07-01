;; wgrep 検索結果バッファを直接編集

(use-package wgrep-ag
  :config
  ;; eでwgrepモードにする
  (setf wgrep-enable-key "e")
  ;; wgrep終了時にバッファを保存
  (setq wgrep-auto-save-buffer t)
  ;; read-only bufferにも変更を適用する
  (setq wgrep-change-readonly-file t)
)

(use-package wgrep-helm

  :config
  ;; eでwgrepモードにする
  (setf wgrep-enable-key "e")
  ;; wgrep終了時にバッファを保存
  (setq wgrep-auto-save-buffer t)
  ;; read-only bufferにも変更を適用する
  (setq wgrep-change-readonly-file t)
)
