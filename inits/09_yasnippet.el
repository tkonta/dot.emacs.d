;; スニペット管理

(use-package yasnippet
  :config
  (yas-global-mode 1)

  ;;; スニペット名をidoで選択する
  (setq yas-prompt-functions '(yas-ido-prompt))
)
