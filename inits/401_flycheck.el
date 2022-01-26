;; 構文エラーチェック

(use-package flycheck
  :ensure t
  :hook (after-init . global-flycheck-mode)
  :config

  ;; コード変更後、1秒後にチェックする
  (setq flycheck-idle-change-delay 3)

  :bind (:map flycheck-mode-map
              ("M-n" . flycheck-next-error)
              ("M-p" . flycheck-previous-error)))

(use-package flycheck-color-mode-line
  :ensure t
  :config
  (eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
  )
