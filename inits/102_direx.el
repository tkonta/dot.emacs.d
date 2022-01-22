;; direx
(use-package direx)
(setq direx:leaf-icon "  " direx:open-icon "📂" direx:closed-icon "📁")
(push '(direx:direx-mode :position left :width 35 :dedicated t)
      popwin:special-display-config)
;; use direx-project.el
;; https://blog.shibayu36.org/entry/2013/02/12/191459
(bind-key
"C-x C-j"
 (defun direx:jump-to-project-directory ()
   "If in project, launch direx-project otherwise start direx."
  (interactive)
  (let ((result (ignore-errors
                  (direx-project:jump-to-project-root-other-window)
                  t)))
    (unless result
      (direx:jump-to-directory-other-window)))
  ))
