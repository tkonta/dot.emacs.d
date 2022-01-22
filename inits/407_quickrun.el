;; バッファ内でコード実行
(use-package quickrun
  :config
  ;;リージョン実行自動判別
  (defun quickrun-sc (start end)
	(interactive "r")
	(if mark-active
		(quickrun :start start :end end)
	  (quickrun)))

  (global-set-key (kbd "<f5>") 'quickrun-sc)
  )
