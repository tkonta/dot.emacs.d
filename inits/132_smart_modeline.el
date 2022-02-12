(use-package smart-mode-line
  :config
  (setq sml/theme 'dark)
  (setq sml/no-confirm-load-theme t)

  ;; directory pathはフルで表示されたいので
  (defvar sml/shorten-directory -1)

  ;; 読み込み専用バッファは%で表示
  (setq sml/read-only-char "%%")
  ;; 修正済みバッファは*で表示
  (setq sml/modified-char "*")

 ;; helm-modeとauto-complete-modeのモードライン表示を隠す
  (setq sml/hidden-modes '(" imenu-list-minor-mode" " company"))


  (sml/setup)
  (column-number-mode t) ;; 列番号の表示
  (line-number-mode t) ;; 行番号の表示
)

(use-package minions
  :config (minions-mode 1)
  (setq minions-mode-line-lighter "[+]")
  )
