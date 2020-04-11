;; perl
(use-package cperl-mode
  :init
  ;; perl tidy
  ;; sudo yum -y install perltidy

  ;; リージョン内のperlソースを整形する。
  (defun perltidy-region ()
    "Run perltidy on the current region."
    (interactive)
    (save-excursion
      (shell-command-on-region (point) (mark) "perltidy -q" nil t)))

  ;; ソースすべてを整形する。
  (defun perltidy-defun ()
    "Run perltidy on the current defun."
    (interactive)
    (save-excursion (mark-defun) (perltidy-region))

    )

  :mode (("\\.pl$" . cperl-mode)
         ("\\.pm$" . cperl-mode))

  :config
  (global-set-key "\C-ct" 'perltidy-region)
  (global-set-key "\C-c\C-t" 'perltidy-defun)

  ;;変数に色をつける
  (setq cperl-highlight-variables-indiscriminately t)

  ;; indent
  (setq-default tab-width 4 indent-tabs-mode t)
  (setq cperl-indent-level 4)
  (setq cperl-merge-trailing-else nil)
  (setq cperl-indent-parens-as-block t)
  (setq cperl-indent-subs-specially nil)
  (setq cperl-electric-backspace-untabify nil) ;; タブを一気に消す
  (setq indent-tabs-mode nil)

  )
