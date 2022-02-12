;; Org mode

(use-package org
  :config
  (setq org-directory "/Users/takumi.konta/works/org")
  (setq org-default-notes-file "notes.org")

  (define-key global-map "\C-cc" 'org-capture)

  ;; テキストの自動折返し
  (setq org-startup-truncated nil)

  ;; Org-captureのテンプレート（メニュー）の設定
  (setq org-capture-templates
        '(("n" "Note" entry (file+headline "~/works/org/notes.org" "Notes")
           "* %?\nEntered on %U\n %i\n %a")
          ))

  ;; メモをC-M-^一発で見るための設定
  ;; https://qiita.com/takaxp/items/0b717ad1d0488b74429d から拝借
  (defun show-org-buffer (file)
    "Show an org-file FILE on the current buffer."
    (interactive)
    (if (get-buffer file)
        (let ((buffer (get-buffer file)))
          (switch-to-buffer buffer)
          (message "%s" file))
      (find-file (concat "~/works/org/" file))))
  (global-set-key (kbd "C-M-^") '(lambda () (interactive)
                                   (show-org-buffer "notes.org")))

  )
