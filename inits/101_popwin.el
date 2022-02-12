;; popwin
(use-package popwin
  :init
  (popwin-mode 1)
  (setq pop-up-windows nil)
  (setq anything-samewindow nil)
  (push '("*Completions*" :height 0.4) popwin:special-display-config)
  (push '("*compilation*" :height 0.4 :noselect t :stick t) popwin:special-display-config)
  (push '("*Help*" :height 0.5 :noselect t :stick t) popwin:special-display-config)
  (push '("*quickrun*" :height 0.5 :stick t) popwin:special-display-config)
  (push '("\*grep\*" :regexp t :height 0.5 :stick t) popwin:special-display-config)
  )
