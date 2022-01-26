;; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Users of Emacs versions >= 27 will want to add:
(setq package-enable-at-startup nil)

;; use-packageをインストールする
(straight-use-package 'use-package)
(use-package el-patch
  :straight t)

;; オプションなしで自動的にuse-packageをstraight.elにフォールバックする
;; 本来は (use-package hoge :straight t) のように書く必要がある
(setq straight-use-package-by-default t)

;; init-loaderをインストール&読み込み
(use-package init-loader)

;;package 配布先
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ))


;;load package-list 初回は必ず必要
;; (package-refresh-contents)
;; (when (not package-archive-contents)
;;   (package-refresh-contents))


;;ローカルパーッケージ置き場
(let ((default-directory  "~/.emacs.d/local-packages/"))
  (normal-top-level-add-subdirs-to-load-path))


;; ~/.emacs.d/init/ 以下のファイルを全部読み込む
(init-loader-load "~/.emacs.d/inits")
(custom-set-variables


;; local variableの警告対策
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(completion-styles '(orderless))
 '(safe-local-variable-values '((php-project-root . auto))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
