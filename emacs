
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(global-set-key "\C-cl" 'org-store-link)
     (global-set-key "\C-cc" 'org-capture)
     (global-set-key "\C-ca" 'org-agenda)
     (global-set-key "\C-cb" 'org-iswitchb)

;; insert closing time to keep track of when a TODO item is completed
(setq org-log-done 'time)

;; set up capture
(setq org-directory "~/Dropbox/orgfiles")
(setq org-default-notes-file "~/Dropbox/orgfiles/refile.org")

(define-key global-map "\C-cc" 'org-capture)

;; capture templates
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Dropbox/orgfiles/refile.org" "Tasks")
             "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/Dropbox/orgfiles/journal.org")
             "* %?\nEntered on %U\n  %i\n  %a")
        ("n" "Notes" entry (file+datetree "~/Dropbox/orgfiles/notes.org")
             "* %?\nEntered on %U\n  %i\n  %a")))

;;refile targets
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

;;select location via a file-path completion along the outline path
(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps t)

;; working with source code
(org-babel-do-load-languages
 'org-babel-load-languages
 '((js . t)
   (latex . t)
   (dot . t)
))

;;ensures syntax highlighting in source code when exporting to PDF
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;;include minted in LaTeX exports
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

;; native fontification
(setq org-src-fontify-natively t)

;; tabs
(setq org-src-tab-acts-natively t)

(add-to-list 'load-path "~/.emacs.d/evil")  
(require 'evil)  
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (org-edna))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; uses XeLaTeX instead of LaTeX)
(setq org-latex-pdf-process
 '("xelatex -interaction nonstopmode %f"
  "xelatex -interaction nonstopmode %f"))
