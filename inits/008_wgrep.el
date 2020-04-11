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

  ;;helmの検索結果でC-c C-eで編集モードに移行。
  ;; C-c C-e: Apply the changes to file buffers.
  ;; C-c C-u: All changes are unmarked and ignored.
  ;; C-c C-d: Mark as delete to current line (including newline).
  ;; C-c C-r: Remove the changes in the region (these changes are not applied to the files. Of course, the remaining changes can still be applied to the files.)
  ;; C-c C-p: Toggle read-only area.
  ;; C-c C-k: Discard all changes and exit.
  ;; C-x C-q: Exit wgrep mode.

  :config
  ;; eでwgrepモードにする
  (setf wgrep-enable-key "e")
  ;; wgrep終了時にバッファを保存
  (setq wgrep-auto-save-buffer t)
  ;; read-only bufferにも変更を適用する
  (setq wgrep-change-readonly-file t)
)
