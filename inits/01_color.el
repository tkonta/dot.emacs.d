;; カラー設定

(use-package color-theme-solarized
  :config
  (load-theme 'wombat t)

  ;; 透過
  (defun set-alpha (alpha-num)
    "set frame parameter 'alpha"
    (interactive "nAlpha: ")
    (set-frame-parameter nil 'alpha (cons alpha-num '(98))))
  ;; 初期値
  (set-frame-parameter nil 'alpha 98)
  )
