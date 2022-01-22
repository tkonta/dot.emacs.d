(use-package consult
  :after vertico
  :config
  ;; C-uを付けるとカーソル位置の文字列を使うmy-consult-lineコマンドを定義する
  (defun my-consult-line (&optional at-point)
    "Consult-line uses things-at-point if set C-u prefix."
    (interactive "P")
    (if at-point
        (consult-line (thing-at-point 'symbol))
      (consult-line)))

  ;; C-s（isearch-forward）をmy-consult-lineコマンドに割り当てる
  (global-set-key (kbd "C-s") 'my-consult-line)

  ;; C-s/C-rで行を移動できるようにする
  (with-eval-after-load 'vertico
    (define-key vertico-map (kbd "C-r") 'vertico-previous)
    (define-key vertico-map (kbd "C-s") 'vertico-next))


  ;; goto-lineのキーバインドをconsult-goto-lineにしてしまう
  (global-set-key [remap goto-line] 'consult-goto-line)

  ;; ripgrepによる検索
  (global-set-key (kbd "C-c s") 'consult-ripgrep)

  ;; バッファグループの検索
  (defcustom consult-buffer-sources
    '(consult--source-hidden-buffer
      consult--source-buffer
      consult--source-file
      consult--source-bookmark
      consult--source-project-buffer
      consult--source-project-file)
    "Sources used by `consult-buffer'.

See `consult--multi' for a description of the source values."
    :type '(repeat symbol))
  (global-set-key (kbd "C-c b") 'consult-buffer)

  ;; project.elを使ってプロジェクトルートを取得する関数をセットする
  (setq consult-project-root-function
        (lambda ()
          (when-let (project (project-current))
            (car (project-roots project)))))

  ;; consult-find
  (global-set-key (kbd "C-c f") 'consult-find)

  )
