(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)

  :custom
  (doom-modeline-buffer-file-name-style 'truncate-with-project)
      (doom-modeline-icon t)
      (doom-modeline-major-mode-icon nil)
      (doom-modeline-minor-modes nil)
      :hook
      (after-init . doom-modeline-mode)
      :config
      (line-number-mode 0)
      (column-number-mode 0)
      (doom-modeline-def-modeline 'main
        '(bar window-number matches buffer-info remote-host buffer-position parrot selection-info)
        '(misc-info persp-name lsp github debug minor-modes input-method major-mode process vcs checker)))


