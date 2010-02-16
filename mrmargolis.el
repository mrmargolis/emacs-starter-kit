;;Use command as meta
(setq mac-command-modifier 'meta)

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

;;look in vendor dir and mrmargolis dir for add ons 
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(add-to-list `load-path (concat dotfiles-dir "/mrmargolis"))
 
;; Save backups in one place
;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
(defvar autosave-dir
  (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
(make-directory autosave-dir t)
 
(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))
 
(defun make-auto-save-file-name ()
  (concat autosave-dir
          (if buffer-file-name
              (concat "#" (file-name-nondirectory buffer-file-name) "#")
            (expand-file-name
             (concat "#%" (buffer-name) "#")))))
 
;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))



;;show line numbers on left side of buffers
(global-linum-mode 1)
