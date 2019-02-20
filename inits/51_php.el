;; php


(use-package php-mode
  :mode (("\\.php$" . php-mode)
         ("\\.ctp$" . php-mode))

  :init
  ;;(add-hook 'php-hook 'php-cs-fixer)


  ;; リージョン内のphpソースを整形する。
  (defun php-code-seikei-region ()
    "Run php-cs-fixer on the current region."
    (interactive)
    (save-excursion
      (shell-command-on-region (point) (mark) "perl ~/bin/run_php_cs_fixer.pl  2>/dev/null" nil t)))


  ;; phpファイルすべてを整形する。
  (defun php-code-seikei-defun ()
    "Run php-cs-fixer on the current defun."
    (interactive)
    (save-excursion (mark-defun) (php-code-seikei-region)))


  :config
  (global-set-key "\C-cF" 'php-code-seikei-defun)
  (global-set-key "\C-cr" 'php-code-seikei-region)

  )



;; (use-package phpunit
;;   :Init
;;   (setq phpunit-configuration-file "phpunit.xml")
;;   (setq phpunit-root-directory "/docker/master//var/www/taraf")
;;   )
