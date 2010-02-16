;;use tabbar 2 (found it in debian emacs-goodies package)
(require 'tabbar)
(tabbar-mode 1)

(defun tabbar-buffer-groups ()
   "Return the list of group names the current buffer belongs to.
 This function is a custom function for tabbar-mode's tabbar-buffer-groups.
 This function group all buffers into 3 groups:
 Those Dired, those user buffer, and those emacs buffer.
 Emacs buffer are those starting with “*”."
   (list
    (cond
     ((string-equal "*" (substring (buffer-name) 0 1))
      "Emacs Buffer"
      )
     ((eq major-mode 'dired-mode)
      "Dired"
      )
     (t
      "User Buffer"
      )
     ))) ;; from Xah Lee
(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

(global-set-key (kbd "C-M-[")  'tabbar-backward)
(global-set-key (kbd "C-M-]")  'tabbar-forward)

