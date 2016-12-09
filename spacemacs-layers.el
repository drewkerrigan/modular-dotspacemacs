;; -*- mode: emacs-lisp -*-
(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."

  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     javascript
     ;; erlang
     ansible
     markdown
     syntax-checking
     auto-completion
     haskell
     go
     git
     osx
     html
     org
     colors
     themes-megapack
     ;; javascript
     python
     shell-scripts
     elixir
     lua
     yaml
     spacemacs-layouts
     deft
     )
   dotspacemacs-additional-packages '(flymake
                                      flymake-cursor)
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '(auto-highlight-symbol)
   dotspacemacs-install-packages 'used-only))
