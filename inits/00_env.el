;; emacs基本設定

;; start up 画面を表示しない
(setq inhibit-startup-message t)

;;ツールバーとスクロールバーを消す
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;vbell off
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; clip board
(setq x-select-enable-clipboard t)

;; ミニバッファの履歴を保存
(savehist-mode 1)

;; 行番号表示
(global-linum-mode -1)

;; ロックファイル / バックアップファイルを作成しない
(setq create-lockfiles nil)
(setq make-backup-files nil)
(setq delete-auto-save-files nil)
(setq auto-save-default nil)

;; バックアップファイルはカレントディレクトリではなく
;; ~/.emacs.d/backups 以下に保存する
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))

;; 対応する括弧を表示してくれる
(show-paren-mode 1)

;;行末の空白をハイライト
(setq-default show-trailing-whitespace t)

;; tab
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; 自動インデントオフ
(electric-indent-mode 0)

;; region
(setenv "LANG" "en_US.UTF-8")
