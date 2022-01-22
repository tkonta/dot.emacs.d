;;; タブバーモードを有効にする
(tab-bar-mode 1)

(define-key global-map (kbd "C-]") 'tab-bar-switch-to-next-tab)
;;(define-key global-map (kbd "C-[") 'tab-bar-switch-to-prev-tab)
