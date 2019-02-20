;;---
;;golang

;; go get github.com/rogpeppe/godef
;; go get -u github.com/nsf/gocode
;; go get -u github.com/golang/lint/golint
;; go get github.com/kisielk/errcheck
;; go get -u github.com/jstemmer/gotags
;; go get golang.org/x/tools/cmd/goimports


;;補完
;(add-hook 'go-mode-hook 'flycheck-mode)

(setq gofmt-command "goimports")   ; 追加
(add-hook 'before-save-hook 'gofmt-before-save)


(add-hook 'go-mode-hook (lambda()
                          (require 'flymake-go)
                          (require 'go-autocomplete)
                          (setq display-buffer-function 'popwin:display-buffer)
                          (push '("^\*go-direx:" :regexp t :position left :width 0.3 :dedicated t)
                                popwin:special-display-config)
                          (define-key go-mode-map (kbd "C-x j") 'go-direx-pop-to-buffer)
                          (local-set-key (kbd "M-.") 'godef-jump)
                          ;(local-set-key (kbd "M-.") 'godef-jump-other-window)
                          (setq indent-tabs-mode nil)    ; タブを利用
                          (setq c-basic-offset 4)        ; tabサイズを4にする
                          (setq tab-width 4)
                          ))
