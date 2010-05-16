
;;org mode
(add-to-list 'load-path (concat dotfiles-dir "/vendor/org-6.34c/lisp"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/org-6.34c/contrib/lisp"))
(require 'org-install)

;;a lot of this config comes from http://doc.norang.ca/org-mode.html
;;hide leading stars in org mode
(setq org-hide-leading-stars t)
(setq org-directory "~/Dropbox/org")
(setq org-mobile-directory "/Volumes/org/")
(setq org-mobile-inbox-for-pull "~/Dropbox/org/inbox.org")

;; ;; Standard key bindings
;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cb" 'org-iswitchb)    
; Use IDO for target completion
(setq org-completion-use-ido t)
; Targets include this file and any file contributing to the agenda - up to 5 levels deep
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 5) (nil :maxlevel . 5))))
; Targets start with the file name - allows creating level 1 tasks
(setq org-refile-use-outline-path (quote file))
; Targets complete in steps so we start with filename, TAB shows the next level of targets etc
(setq org-outline-path-complete-in-steps t)
; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

(setq org-default-notes-file "~/Dropbox/org/refile.org")
;;;  Load Org Remember Stuff
(require 'remember)
(org-remember-insinuate)

;; I use C-M-r to start org-remember
;;; (global-set-key (kbd "C-M-r") 'org-remember)

;; C-c C-c stores the note immediately
(setq org-remember-store-without-prompt t)

;; I don't use this -- but set it in case I forget to specify a location in a future template
(setq org-remember-default-headline "Tasks")

;; 3 remember templates for TODO tasks, Notes, and Phone calls
(setq org-remember-templates (quote (("todo" ?t "* TODO %?\n  %u\n  %a" nil bottom nil)
                                     ("note" ?n "* %? :NOTE:\n  :CLOCK:\n  :END:\n  %U\n  %a" nil bottom nil)
                                     )))
    
