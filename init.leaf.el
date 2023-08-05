;;; init.el --- my init.el
;;; Commentary:
;; 
;;; Code:
;;

;; emacs29で解決予定のエラー回避
;; https://emacs.stackexchange.com/questions/74289/emacs-28-2-error-in-macos-ventura-image-type-invalid-image-type-svg
;; (setq image-types '(svg png gif tiff jpeg xpm xbm pbm))

(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
           (file-name-directory (or load-file-name byte-compile-current-file))))))

(eval-and-compile
  (customize-set-variable
   'package-archives '(("org"   . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("gnu"   . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    (leaf hydra :ensure t)
    (leaf el-get :ensure t)
    (leaf blackout :ensure t)

    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))


;; leaf

(leaf leaf
  :config
  (leaf leaf-convert :ensure t)
  (leaf leaf-tree
    :ensure t
    :custom ((imenu-list-size . 30)
             (imenu-list-position . 'left))))

(leaf macrostep
  :ensure t
  :bind (("C-c e" . macrostep-expand)))


(leaf env
  :doc "環境設定"
  :config
  (leaf leaf-convert
    :doc "start up 画面を表示しない"
    :setq ((inhibit-startup-message . t)))

  (leaf toolbar
    :doc "ツールバーとスクロールバーを消す"
    :custom ((if)
	     (display-graphic-p)
	     (progn)

	     (tool-bar-mode)
	     (scroll-bar-mode)))

  (leaf menubar
    :doc "メニューバーを消す"
    :custom ((menu-bar-mode)))

  (leaf vbell
    :setq ((visible-bell . t)
	   (ring-bell-function quote ignore)))

  (leaf backup-files
    :doc "ロックファイル / バックアップファイルを作成しない"
    (leaf backup-files
      :setq ((create-lockfiles)
	     (make-backup-files)
	     (delete-auto-save-files)
	     (auto-save-default))))

  (leaf leaf-convert
    :doc "バックアップファイルはカレントディレクトリではなく~/.emacs.d/backups 以下に保存する"
    :config
    (setq backup-directory-alist `(("." \,
				    (concat user-emacs-directory "backups")))))

  (leaf leaf-convert
    :doc "vbell off"
    :setq ((visible-bell . t)
	   (ring-bell-function quote ignore)))

  (leaf leaf-convert
    :doc "ミニバッファの履歴を保存"
    :setq ((savehist-mode . 1)))

  (leaf leaf-convert
    :setq-default ((tab-width . 4)
		 (indent-tabs-mode)))

  (leaf leaf-convert
    :doc "現在行に色をつける"
    :config
    (global-hl-line-mode 1))

  (leaf leaf-convert
    :doc " 同じ内容を履歴に記録しないようにする"
    :setq ((history-delete-duplicates . t)))

  (leaf leaf-convert
    :config
    (setenv "LANG" "en_US.UTF-8"))

  (leaf leaf-convert
    :doc "右から左に読む言語に対応させないことで描画高速化"
    :setq-default ((bidi-display-reordering)))

  (leaf leaf-convert
    :doc "対応する括弧の表示"
    :config
    (show-paren-mode 1))

  (leaf leaf-convert
    :doc "ウィンドウの記録"
    :config
    (desktop-save-mode 1))

  (leaf recentf
    :doc "最近開いたファイル履歴を保存"
    :custom ((recentf-max-saved-items . 1000)
	   (recentf-auto-cleanup . t)
	   (recentf-exclude quote
			    (".recentf")))
    :config
    (recentf-mode 1))

  (leaf warnings
    :doc "起動時の警告を抑制"
    :setq ((inhibit-startup-message . t)))

  (leaf row-number
    :doc "行番号表示"
    :config
    (global-display-line-numbers-mode t)))



(leaf leaf-convert
  :doc "macクリップボードの共有"
  :preface
  (defun copy-from-osx nil
    (shell-command-to-string "pbpaste"))

  (defun paste-to-osx (text &optional push)
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
	(process-send-string proc text)
	(process-send-eof proc))))

  :setq ((interprogram-cut-function quote paste-to-osx)
	 (interprogram-paste-function quote copy-from-osx)))


(leaf leaf-convert
  :doc ""switch meta between Option and Command""
  :init (setq mac-command-modifier 'meta)
  :preface
  (defun mac-switch-meta nil
    "switch meta between Option and Command"
    (interactive)
    (if (eq mac-option-modifier nil)
        (progn
          (setq mac-option-modifier 'meta)
          (setq mac-command-modifier 'hyper))

      (progn
        (setq mac-option-modifier nil)
        (setq mac-command-modifier 'meta)))))


(leaf leaf-convert
  :doc "バッファの行き来"
  :bind (("M-[" . switch-to-prev-buffer)
	 ("M-]" . switch-to-next-buffer)))

(leaf undo-tree
  :doc "undo redo"
  :ensure t
  :config
  (global-undo-tree-mode t)
  :custom ((undo-tree-auto-save-history . nil))
  )


(leaf smartparens
  :doc "カッコの処理"
  :ensure t
  ;:hook (after-init-hook . smartparens-global-strict-mode) ; strictモードを有効化
  :require smartparens-config
  :custom ((electric-pair-mode . nil))) ; electirc-pair-modeを無効化


(leaf leaf-convert
  :doc "タブバーモードを有効にする"
  :bind (("C-]" . tab-bar-switch-to-next-tab))
  :config
  (tab-bar-mode 1))


(leaf leaf-convert
  :doc "diredで直接ファイル名編集"
  :require wdired
  :config
  (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode))


(leaf ripgrep
  :doc "高速grep"
  :ensure t
)

(leaf yaml-mode
  :doc "yaml"
  :ensure t
)

(leaf color-theme
  :config
  (leaf idea-darkula-theme
    :ensure t
    :config (load-theme 'idea-darkula t))
  (leaf solarized-theme
    :ensure t
    :disabled t
    :config (load-theme 'solarized-dark t))
 )

(leaf visual-regexp-steroids
  :doc "視覚的正規表現"
  :custom ((vr/engine quote python)))


(leaf easy-kill
  :doc "キリングしないでコピー"
  :ensure t
  :bind (("M-w" . easy-kill)))


(leaf vertico-setting
  :config
  (leaf vertico
    :doc "ミニバッファインターフェース"
    :ensure t
    )

  (leaf orderless
    :doc "検索の向上 前方一致以外にもヒット"
    :ensure t
    )
  )


(leaf highlight-indent-guides
  :doc "インデント位置を強調"
  :ensure t
  :blackout t
  :hook (((prog-mode-hook yaml-mode-hook) . highlight-indent-guides-mode))
  :custom (
           (highlight-indent-guides-method . 'character)
           (highlight-indent-guides-auto-enabled . t)
           (highlight-indent-guides-responsive . t)
           (highlight-indent-guides-character . ?\|)))


(leaf rainbow-delimiters
  :doc "カッコの対応を強調"
  :ensure t
  :hook
  ((prog-mode-hook       . rainbow-delimiters-mode)))



(leaf company
  :doc "補完"
  :ensure t
  :leaf-defer nil
  :blackout company-mode
  :bind ((company-active-map
          ("M-n" . nil)
          ("M-p" . nil)
          ("C-s" . company-filter-candidates)
          ("C-n" . company-select-next)
          ("C-p" . company-select-previous)
          ("C-i" . company-complete-selection))
         (company-search-map
          ("C-n" . company-select-next)
          ("C-p" . company-select-previous)))
  :custom ((company-tooltip-limit         . 12)
           (company-idle-delay            . 0) ;; 補完の遅延なし
           (company-minimum-prefix-length . 1) ;; 1文字から補完開始
           (company-transformers          . '(company-sort-by-occurrence))
           (global-company-mode           . t)
           (company-selection-wrap-around . t)))


(leaf flycheck
  :ensure t
  :hook (prog-mode-hook . flycheck-mode)
  :custom ((flycheck-display-errors-delay . 0.3)
           (flycheck-indication-mode . 'left-margin)) ;terminalで使うので、fringeではなくmarginに警告を表示
  :config (add-hook 'flycheck-mode-hook #'flycheck-set-indication-mode) ; flycheckのみでmarginを使用
    (leaf flycheck-inline
      :ensure t
      :hook (flycheck-mode-hook . flycheck-inline-mode)))


(leaf lsp-mode
  :doc "言語ごとの解析サーバーと連携"
  :ensure t
  :commands (lsp lsp-deferred)
  :config
  :custom ((lsp-keymap-prefix                  . "C-c l")
           (lsp-log-io                         . t)
           (lsp-keep-workspace-alive           . nil)
           (lsp-document-sync-method           . 2)
           (lsp-response-timeout               . 5)
           (lsp-enable-file-watchers           . nil))
  :hook (lsp-mode-hook . lsp-headerline-breadcrumb-mode)
  :init (leaf lsp-ui
          :ensure t
          :after lsp-mode
          :custom ((lsp-ui-doc-enable            . t)
                   (lsp-ui-doc-position          . 'at-point)
                   (lsp-ui-doc-header            . t)
                   (lsp-ui-doc-include-signature . t)
                   (lsp-ui-doc-max-width         . 150)
                   (lsp-ui-doc-max-height        . 30)
                   (lsp-ui-doc-use-childframe    . nil)
                   (lsp-ui-doc-use-webkit        . nil)
                   (lsp-ui-peek-enable           . t)
                   (lsp-ui-peek-peek-height      . 20)
                   (lsp-ui-peek-list-width       . 50))
          :bind ((lsp-ui-mode-map ([remap xref-find-definitions] .
                                   lsp-ui-peek-find-definitions)
                                  ([remap xref-find-references] .
                                   lsp-ui-peek-find-references))
                 (lsp-mode-map ("C-c s" . lsp-ui-sideline-mode)
                               ("C-c d" . lsp-ui-doc-mode)))
          :hook ((lsp-mode-hook . lsp-ui-mode))))



(leaf dashboard
  :ensure t
  :require t
  :config
  (dashboard-setup-startup-hook))


(leaf neotree
  :init
  (setq-default neo-keymap-style 'concise)
  :bind (("C-," . neotree-toggle))
  :custom ((neo-persist-show . t)
           (neo-create-file-auto-open . t)
           (neo-smart-open . t))
  :config
  (with-eval-after-load 'neotree
    (add-hook 'neo-after-create-hook
              (lambda (&rest _)
                (display-line-numbers-mode -1)))))

  (leaf warnings
    :doc "起動時の警告を抑制"
    :setq ((inhibit-startup-message . t)))




(provide 'init)
;;; init.el ends here


