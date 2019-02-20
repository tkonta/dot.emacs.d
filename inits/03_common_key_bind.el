;; 基本的なキーバインド設定


;; "C-t" でフレームを切り替える初。期値はtranspose-chars
(define-key global-map (kbd "C-S-t") 'other-frame)

;; diredモード時のキープレフィックスを無効に
(add-hook 'dired-mode-hook
  (lambda ()
    ;;(define-key dired-mode-map (kbd "C-o") 'other-window-or-split) ;; jump other window
    (local-unset-key (kbd "C-t")) ;; elscrenn用
    ))
