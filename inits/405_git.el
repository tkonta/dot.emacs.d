;; git

(use-package magit-section
  )

(use-package magit-popup
  :ensure t ; make sure it is installed
  :demand t ; make sure it is loaded
  )

(use-package magit
    :ensure t
    :bind (("C-x g" . magit-status)
           ("C-x M-g" . magit-dispatch-popup)
          )

    :config
    ;; cursorが載っていない状態でのaddedのface
    (set-face-foreground 'magit-diff-added "#00FF00")
    (set-face-background 'magit-diff-added "#000000")
    ;; cursorが載っている状態のaddedのface
    (set-face-foreground 'magit-diff-added-highlight "#00FF00")
    (set-face-background 'magit-diff-added-highlight "gray20")
    ;; cursor載っていない状態のremoved
    (set-face-foreground 'magit-diff-removed "#FF0000")
    (set-face-background 'magit-diff-removed "#000000")
    ;; cursor載っている状態のremoved
    (set-face-foreground 'magit-diff-removed-highlight "#FF0000")
    (set-face-background 'magit-diff-removed-highlight "gray20")
    ;; lineを選択してstageしようとするときのface
    (set-face-background 'magit-diff-lines-boundary "blue")
    )

(use-package git-gutter+
  :config
  (global-git-gutter+-mode)
)

;; magitメモ
;; 差分消し d k
;; remote push F p

