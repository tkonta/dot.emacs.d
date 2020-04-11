;; projectile
;; プロジェクトを判別して、いい感じにやってくれる
;; ファイル表示(helm-projectile-find-file、C-c p f)
;; プロジェクトで最近開いたファイルを表示・開く(helm-projectile-recentf、C-c p e)
;; プロジェクト内のファイルにGrep(helm-projectile-grep、C-c p s g)


(use-package projectile
  :config

  (projectile-global-mode)
  (setq projectile-completion-system 'helm)

)

(use-package helm-projectile
  :init
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (helm-projectile-on)
)
