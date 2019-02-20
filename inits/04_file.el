;; ファイル関係


(defun my/get-curernt-path ()
  (if (equal major-mode 'dired-mode)
      default-directory
    (buffer-file-name)))

;; 現在のバッファのファイル名をクリップボードにコピー
(defun my/copy-current-path ()
  (interactive)
  (let ((fPath (my/get-curernt-path)))
    (when fPath
      (message "stored path: %s" fPath)
      (kill-new (file-truename fPath)))))

(global-set-key (kbd "C-c 0") 'my/copy-current-path)


