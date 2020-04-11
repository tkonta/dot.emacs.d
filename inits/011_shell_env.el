;; shellの環境変数を共有

(use-package exec-path-from-shell
  :config
  (let ((envs '("PATH")))
    (exec-path-from-shell-copy-envs envs))
)
