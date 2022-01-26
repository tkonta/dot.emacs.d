;; php

(use-package php-cs-fixer
  :init
  (add-hook 'before-save-hook 'php-cs-fixer-before-save)

  :config
  (setq php-cs-fixer-config-option "/Users/takumi.konta/works/.php_cs.php")
  )

(use-package flycheck-phpstan
  :init

  :config
  (defun my-php-mode-setup ()
    "My PHP-mode hook."
    (require 'flycheck-phpstan)
    (flycheck-mode t))

  (add-hook 'php-mode-hook 'my-php-mode-setup)
  (setq-default phpstan-executable "/Users/takumi.konta/.anyenv/envs/phpenv/shims/phpstan"))


(use-package phpactor :ensure t)
(use-package company-phpactor :ensure t)

(use-package php-mode
  :mode (("\\.php$" . php-mode)
         ("\\.ctp$" . php-mode))
  ;;
  :hook ((php-mode . (lambda () (set (make-local-variable 'company-backends)
       '(;; list of backends
         company-phpactor
         company-files
         ))))
         )
  )

(add-hook 'php-mode-hook
          (lambda ()
            (make-local-variable 'eldoc-documentation-function)
            (setq eldoc-documentation-function
                  'phpactor-hover)))

(with-eval-after-load 'php-mode
  (define-key php-mode-map (kbd "M-.") #'phpactor-goto-definition)
  (define-key php-mode-map (kbd "M-?") #'phpactor-find-references)
  (define-key php-mode-map (kbd "M-,") #'php-transient-menu))

(define-transient-command php-transient-menu ()
  "Php"
  [["Class"
    ("cc" "Copy" phpactor-copy-class)
    ("cn" "New" phpactor-create-new-class)
    ("cr" "Move" phpactor-move-class)
    ("ci" "Inflect" phpactor-inflect-class)
    ("n"  "Namespace" phpactor-fix-namespace)]
   ["Properties"
    ("a"  "Accessor" phpactor-generate-accessors)
    ("pc" "Constructor" phpactor-complete-constructor)
    ("pm" "Add missing props" phpactor-complete-properties)
    ("r" "Rename var locally" phpactor-rename-variable-local)
    ("R" "Rename var in file" phpactor-rename-variable-file)]
  ["Extract"
    ("ec" "constant" phpactor-extract-constant)
    ("ee" "expression" phpactor-extract-expression)
    ("em"  "method" phpactor-extract-method)]
  ["Methods"
    ("i" "Implement Contracts" phpactor-implement-contracts)
    ("m"  "Generate method" phpactor-generate-method)]
  ["Navigate"
    ("x" "List refs" phpactor-list-references)
    ("X" "Replace refs" phpactor-replace-references)
    ("."  "Goto def" phpactor-goto-definition)]
  ["Phpactor"
    ("s" "Status" phpactor-status)
    ("u" "Install" phpactor-install-or-update)]])


(use-package company-php
  :defer t
  :ensure t)

(use-package phpunit
  :straight (:host github :repo "tkonta/phpunit.el" :branch "master")
  :ensure t
  :after php-mode
  :config
  (setq phpunit-configuration-file "phpunit.xml")
  (setq phpunit-root-directory (projectile-project-root)))
