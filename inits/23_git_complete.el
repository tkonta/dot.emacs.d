;; git-complete gitの履歴から補完してくれる
;;https://qiita.com/zk_phi/items/642b1e7dd12b44ea83ce

(require 'git-complete)
(global-unset-key (kbd "C-c C-c")) ;; 一応unbindしておきましょう
(global-set-key (kbd "C-c C-c") 'git-complete)
