;; resentff 最近開いたファイル履歴を保存

(use-package recentf
  :config
  (setq recentf-max-saved-items 1000)   ;; 履歴保存数
  (setq recentf-auto-cleanup t)         ;; 存在しないファイルは消す
  ;;(setq recentf-auto-cleanup 'never)    ;; 存在しないファイルは消さない
  (setq recentf-exclude '(".recentf"))  ;; .recentf自体は含まない

  (recentf-mode 1)
)
