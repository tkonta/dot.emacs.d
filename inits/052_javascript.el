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
(use-package add-node-modules-path
  :config
  )


(use-package vue-mode
  :config
  (eval-after-load 'vue-mode
  '(add-hook 'vue-mode-hook #'add-node-modules-path))

  (flycheck-add-mode 'javascript-eslint 'vue-mode)
  (flycheck-add-mode 'javascript-eslint 'vue-html-mode)
  (flycheck-add-mode 'javascript-eslint 'css-mode)
  (add-hook 'vue-mode-hook 'flycheck-mode)

  )

(use-package vue-html-mode
  :config
  )



