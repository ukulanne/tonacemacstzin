#!/bin/emacs --script

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Anne Summers            ;;
;; ukulanne@gmail.com      ;;
;; August 21, 2019         ;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Time-stamp: <2019-08-22 09:29:58 panda>

;; — Function: (file-name-all-completions-aix file-ls)
;; - Advice-add:
;;   Call first system level file-name-all-completions and pass the result to file-name-all-completions-aix 

(defun file-name-all-completions-aix (file-ls)
  "This function returns a list of all possible completions for a file whose name starts with partial-filename in directory directory without the trailing slash added to regular files on AIX "
  (mapcar (function
           (lambda (file)
             (cond
              ((and (string-equal "/" (substring file -1)) (file-directory-p (substring file 0 -1))) file)
              ( t (substring file 0 -1))
              )))
          file-ls))

;; Add this to your .emacs file
;; First it will compile the elisp code and then
;; It will overload the existing emacs lisp file-name-all-completions 
;; with file-name-all-completions-aix:
;;
;; (byte-compile-file "~/.emacs.d/file-name-all-completions-aix/file-name-all-completions-aix.el" t)
;; (eval-after-load "file-name-all-completions-aix"
;;  (advice-add  #'file-name-all-completions :filter-return #'file-name-all-completions-aix))
