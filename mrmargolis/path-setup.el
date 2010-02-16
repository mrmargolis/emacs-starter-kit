;; Manually set PATH for use by eshell, rspec-mode, etc.
(let ((path))
  (setq path (concat "/Users/mrmargolis/.rvm/ree-1.8.7-20090928/bin:"
                     "/usr/local/git/bin:"
                     "~/bin:"
                     "/usr/local/usr:"
                     "/usr/local/bin:"
                     "/usr/bin:"
                     "/bin"))
(setenv "PATH" path))
;; used for magit, otherwise it doesn't find git for some reason
(setq exec-path (append exec-path '("/usr/local/git/bin")))
