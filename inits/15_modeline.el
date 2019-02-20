;; 下のバー

(use-package smart-mode-line
  :config
  (defvar sml/shorten-directory -1) ;; directory pathはフルで表示されたいので

  (column-number-mode t) ;; 列番号の表示
  (line-number-mode t) ;; 行番号の表示
  ;; 読み込み専用バッファは%で表示
  (setq sml/read-only-char "%%")
  ;; 修正済みバッファは*で表示
  (setq sml/modified-char "*")

  ;; helm-modeとauto-complete-modeのモードライン表示を隠す
  (setq sml/hidden-modes '(" Helm" " company"))

  ;; これがないと表示がはみでる
  (setq sml/extra-filler -10)

  ;; これを入れないとsmart-mode-lineを読み込むたびに
  ;; Loading a theme can run Lisp code.  Really load? (y or n)
  ;; と聞いてくる。
  (setq sml/no-confirm-load-theme t)

  (defvar sml/theme 'dark)
  (sml/setup)


  ;; mode line を flash！！
  (setq ring-bell-function
        (lambda ()
          (let ((orig-fg (face-background 'mode-line)))
            (set-face-background 'mode-line "purple4")
            (run-with-idle-timer 0.1 nil
                                 (lambda (fg) (set-face-background 'mode-line fg))
                                 orig-fg))))

  ;; save時にmode line を光らせる
  (add-hook 'after-save-hook
            (lambda ()
              (let ((orig-fg (face-background 'mode-line)))
                (set-face-background 'mode-line "dark green")
                (run-with-idle-timer 0.1 nil
                                     (lambda (fg) (set-face-background 'mode-line fg))
                                     orig-fg))))

  )


(use-package total-lines
  :config
  (global-total-lines-mode t)
  (defun my-set-line-numbers ()
    (setq-default mode-line-front-space
                  (append mode-line-front-space
                          '((:eval (format " (%d)" (- total-lines 1))))))) ;; 「" (%d)"」の部分はお好みで
  (add-hook 'after-init-hook 'my-set-line-numbers)
  )

