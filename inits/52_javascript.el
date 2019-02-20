;; javascript
(setq js-indent-level 2)

(use-package js2-mode
  :mode (("\\.js$" . js2-mode)
	 )

  :init
  (add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 2)))

  :config
  )


;; vue
(use-package vue-mode
  :config
  )

(use-package vue-html-mode
  :config
  )

