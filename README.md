# Emacs resources tonacemacstzin


## Trailing slash on AIX using emacs 26.1

To remove the trailing slashes when opening a file (find-file M-x f) get this file [file-name-all-completions-aix.el](https:///tonacemacstzin/blob/master/file-name-all-completions-aix/file-name-all-completions-aix.el) and put it in your $HOME directory.  

Next do:

`$ mkdir -p ~/.emacs.d/file-name-all-completions-aix`

`$ cp file-name-all-completions-aix.el ~/.emacs.d/file-name-all-completions-aix/file-name-all-completions-aix.el`
 
 Finally, add the following lines to your .emacs file or evaluate them:
 
 ```lisp
 (byte-compile-file "~/.emacs.d/file-name-all-completions-aix/file-name-all-completions-aix.el" t)
 
 (eval-after-load "file-name-all-completions-aix"
  (advice-add  #'file-name-all-completions :filter-return #'file-name-all-completions-aix))
 
 ```

## Emacs fonts colors when running on terminal

I have noticed that on certain terminals, the emacs provided colors cannot be seen correctly with the terminal background. You can stop emacs to showing those colors with `(global-font-lock-mode 0)`
