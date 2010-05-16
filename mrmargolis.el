
;;Use command as meta    
;;(setq mac-command-modifier 'meta)


;;show line numbers on left side of buffers
(global-linum-mode 1)
(setq linum-format "%d   ")

;;look in vendor dir and mrmargolis dir for add ons 
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(add-to-list `load-path (concat dotfiles-dir "/mrmargolis"))

;;trying out Steve Yegge's suggestion
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
  
;;OS X style text-scale manipulations
(global-set-key (kbd "s-=") 'text-scale-increase)
(global-set-key (kbd "s--") 'text-scale-decrease) 


;; from http://cvs.savannah.gnu.org/viewvc/emacs/emacs/lisp/misc.el?view=markup
(defun zap-up-to-char (arg char)
  "Kill up to, but not including ARGth occurrence of CHAR.
Case is ignored if `case-fold-search' is non-nil in the current buffer.
Goes backward if ARG is negative; error if CHAR not found.
Ignores CHAR at point."
  (interactive "p\ncZap up to char: ")
  (let ((direction (if (>= arg 0) 1 -1)))
    (kill-region (point)
		 (progn
		   (forward-char direction)
		   (unwind-protect
		       (search-forward (char-to-string char) nil nil arg)
		     (backward-char direction))
		   (point)))))
;; I prefer deleting up to the char
(global-set-key "\M-z" 'zap-up-to-char)



(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t) 
        (backward-char) (insert "\n"))
      (indent-region begin end))
    (message "Ah, much better!"))



;;from http://emacs-fu.blogspot.com/2009/11/copying-lines-without-selecting-them.html
(defadvice kill-ring-save (before slick-copy activate compile) "When called
  interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end)) (message
  "Copied line") (list (line-beginning-position) (line-beginning-position
  2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
    (if mark-active (list (region-beginning) (region-end))
      (list (line-beginning-position)
        (line-beginning-position 2)))))



(add-to-list 'load-path (concat dotfiles-dir "/vendor/apel"))
(load "elscreen" "ElScreen" )
;; create or destroy elscreens
(global-set-key (kbd "s-t"    ) 'elscreen-create)
(global-set-key (kbd "s-w"  ) 'elscreen-kill)  
;; switching between elscreens
(global-set-key (kbd "<s-S-left>") 'elscreen-previous) 
(global-set-key (kbd "<s-S-right>")  'elscreen-next) 
(global-set-key (kbd "s-{") 'elscreen-previous) 
(global-set-key (kbd "s-}")  'elscreen-next) 


;;eproject config
(add-to-list 'load-path (concat dotfiles-dir "/vendor/eproject"))
(require `eproject)
(require `eproject-extras)

 (define-project-type merb-or-rails (generic)
   (look-for "app")
   :relevant-files ("\\.rb$" "\\.yml$" "\\.html$" "\\.erb$" "\\.haml$" "\\Rakefile$" "\\.feature$" "\\.sass$" "\\.js$"))

(global-set-key "\C-c\C-p" 'eproject-revisit-project)



;;yasnippet
(add-to-list 'load-path (concat dotfiles-dir "/vendor/yasnippet"))
(require 'yasnippet) 
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet/snippets")

;;haml and sass support
(require 'haml-mode)
(require 'sass-mode)


;;rinari from github/eschulte so we have newer stuff
(add-to-list 'load-path (concat dotfiles-dir "/vendor/rinari"))
(require 'rinari)
;;try out rhtml mode for rails views instead of nxhtml
(add-to-list 'load-path (concat dotfiles-dir "vendor/rhtml"))
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
     	  (lambda () (rinari-launch)))
(add-hook 'rhtml-mode-hook
     	  (lambda () (setq tab-width 2)))


;;use ssh for tramp
(setq tramp-default-method "ssh")

;;browse kill ring with M-y
(when (require 'browse-kill-ring nil 'noerror)
  (browse-kill-ring-default-keybindings))

;;for debugging emacs
;;(setq debug-on-error t)  


;; spit out an org mode template for a Yesterday/Today status update
;; for standups
(fset 'status-template
   [M-return ?\C-x ?\C-m ?i ?n ?s ?e ?r ?t ?  ?d ?a ?t ?e return return ?* ?* ?  ?Y ?e ?s ?t ?e ?r ?d ?a ?y return ?* ?* ?  ?T ?o ?d ?a ?y])
