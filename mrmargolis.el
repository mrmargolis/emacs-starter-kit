;;Use command as meta
(setq mac-command-modifier 'meta)


;;show line numbers on left side of buffers
(global-linum-mode 1)



;;look in vendor dir and mrmargolis dir for add ons 
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(add-to-list `load-path (concat dotfiles-dir "/mrmargolis"))



