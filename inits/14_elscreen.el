;; elscreen

(use-package elscreen
  :config
  ;; プレフィックスキー
  ;(setq elscreen-prefix-key (kbd "C-t"))

  ;; タブの先頭に[X]を表示しない
  (setq elscreen-tab-display-kill-screen nil)
  ;; header-lineの先頭に[<->]を表示しない
  (setq elscreen-tab-display-control nil)
  ;; バッファ名・モード名からタブに表示させる内容を決定する(デフォルト設定)
  (setq elscreen-buffer-to-nickname-alist
        '(("^dired-mode$" .
           (lambda ()
             (format "Dired(%s)" dired-directory)))
          ("^Info-mode$" .
           (lambda ()
             (format "Info(%s)" (file-name-nondirectory Info-current-file))))
          ("^mew-draft-mode$" .
           (lambda ()
             (format "Mew(%s)" (buffer-name (current-buffer)))))
          ("^mew-" . "Mew")
          ("^irchat-" . "IRChat")
          ("^liece-" . "Liece")
          ("^lookup-" . "Lookup")))
  (setq elscreen-mode-to-nickname-alist
        '(("[Ss]hell" . "shell")
          ("compilation" . "compile")
          ("-telnet" . "telnet")
          ("dict" . "OnlineDict")
          ("*WL:Message*" . "Wanderlust")))


  (global-set-key (kbd "<f9>") 'elscreen-toggle)
  (global-set-key (kbd "C-.") 'elscreen-kill)
  (global-set-key (kbd "C-t") 'elscreen-next)

  (elscreen-start)

  (require 'revive)
  (require 'elscreen-persist)
  (elscreen-persist-mode 1)

  )

;; elscreen 復元
;; (use-package elscreen-persist
;;   :load-path "~/.emacs.d/local-packages/elscreen-persist"
;;   :config
;;   (elscreen-persist-mode 1)
;;   )

