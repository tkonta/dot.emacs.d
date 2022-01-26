;; 基本的なキーバインド設定

;; バッファの行き来
(global-set-key (kbd "M-[") 'switch-to-prev-buffer)
(global-set-key (kbd "M-]") 'switch-to-next-buffer)

;; 現在のバッファを閉じる
;; (global-set-key (kbd "M-.") 'kill-this-buffer)

;; killのバッファーに入れないバージョン
(defun delete-word (arg)
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun backward-delete-word (arg)
  (interactive "p")
  (delete-word (- arg)))

(global-set-key (read-kbd-macro "M-h") 'delete-word)
