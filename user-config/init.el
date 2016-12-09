;; -*- mode: emacs-lisp -*-
(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (if (file-readable-p "~/.spacemacs.d/user-config/path.el") (load "~/.spacemacs.d/user-config/path.el"))
  (if (file-readable-p "~/.spacemacs.d/user-config/overrides.el") (load "~/.spacemacs.d/user-config/overrides.el"))
  (if (file-readable-p "~/.spacemacs.d/user-config/os.el") (load "~/.spacemacs.d/user-config/os.el"))
  (if (file-readable-p "~/.spacemacs.d/user-config/erlang.el") (load "~/.spacemacs.d/user-config/erlang.el"))
  (if (file-readable-p "~/.spacemacs.d/user-config/functions.el") (load "~/.spacemacs.d/user-config/functions.el"))
  )
