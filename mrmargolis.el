;;Use command as meta
(setq mac-command-modifier 'meta)


;;show line numbers on left side of buffers
(global-linum-mode 1)
(setq linum-format "   %d")

;;look in vendor dir and mrmargolis dir for add ons 
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(add-to-list `load-path (concat dotfiles-dir "/mrmargolis"))

;;trying out Steve Yegge's suggestion
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)


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




(add-to-list `load-path  "~/.emacs.d/vendor/apel")
(load "elscreen" "ElScreen" )

;; create or destroy elscreens
(global-set-key (kbd "<C-f9>"    ) 'elscreen-create)
(global-set-key (kbd "M-<f9>"  ) 'elscreen-kill)  


;; switching between elscreens
(global-set-key (kbd "<M-S-left>") 'elscreen-previous) 
(global-set-key (kbd "<M-S-right>")  'elscreen-next) 
