


(relisp-start-slave "/Users/fullofcaffeine/workspace/code/org-catalog-files/relisp_slave_server.rb")

(defun catalog-ebooks () (interactive)
        (setenv "LANG" "en_US.UTF-8")
        (setenv "LC_ALL" "en_US.UTF-8")
        (setenv "LC_CTYPE" "en_US.UTF-8")
;        (shell-command-to-string  "ruby
;        /Users/fullofcaffeine/workspace/code/org-catalog-files/catalog.rb"))
        (setq ebooks (shell-command-to-string "/Users/fullofcaffeine/.rvm/bin/rvm ruby-1.9.3-p194 do ruby /Users/fullofcaffeine/workspace/code/org-catalog-files/catalog.rb"))

 (let ((result))
      (dolist (el (ruby-eval ebooks))
        (setq filename (gethash 'file el))
        (setq path     (gethash 'path el))
        (set-buffer (find-file-noselect "/Users/fullofcaffeine/org/data/dynamic_reference/library.org"))
        (end-of-buffer)
        (insert "\n")
        (insert (concat "* " filename " :library:book:ebook:catalog:" ))
        (insert "\n")
        (insert (concat "file:" path))
        (indent-region (point-min) (point-max))
        )
      )
 )



