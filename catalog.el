(defun catalog-ebooks () (interactive)
  (setq pr (relisp-start-slave "/Users/fullofcaffeine/workspace/code/org-catalog-ebooks/relisp_slave_server.rb"))



;use the code below when you only want to catalog a specific location, without copying the files
;(setq ebooks (shell-command-to-string "/Users/fullofcaffeine/.rvm/bin/rvm ruby-1.9.3-p194 do ruby /Users/fullofcaffeine/workspace/code/org-catalog-ebooks/catalog.rb catalog"))

  (setq ebooks (shell-command-to-string "/Users/fullofcaffeine/.rvm/bin/rvm ruby-1.9.3-p194 do ruby /Users/fullofcaffeine/workspace/code/org-catalog-ebooks/catalog.rb"))
  
  
  (if (string-match "Error:\\(.*\\)$" ebooks) (error  (match-string 1 ebooks)))

  
        (set-buffer (find-file-noselect "/Users/fullofcaffeine/org/data/dynamic_reference/library.org"))
 (let ((result))
      (dolist (el (ruby-eval ebooks))
        (setq filename (gethash 'file el))
        (setq path     (gethash 'path el))
        (end-of-buffer)
        (insert "\n")
        (insert (concat "* " filename " :library:book:ebook:catalog:" ))
        (insert "\n")
        (insert (concat "[[file:" path "]]"))
        (indent-region (point-min) (point-max))
        )
      )
 (if (boundp 'pr) (kill-process pr))
 )



