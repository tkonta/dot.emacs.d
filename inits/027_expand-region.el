;; リージョンを賢く判定

(use-package expand-region
  :config
  (push 'er/mark-outside-pairs er/try-expand-list)
  (global-set-key (kbd "C-M-SPC") 'er/expand-region)
)
