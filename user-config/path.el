;; -*- mode: emacs-lisp -*-
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/Cellar/pyenv-virtualenv/1.0.0/shims:~/.pyenv/shims:~/.gvm/bin:~/erlang/19.1/bin:~/bin:~/go/bin"))
(setq exec-path (append exec-path '("/usr/local/Cellar/pyenv-virtualenv/1.0.0/shims")))
(setq exec-path (append exec-path '("~/.pyenv/shims")))
(setq exec-path (append exec-path '("~/.gvm/bin")))
(setq exec-path (append exec-path '("~/erlang/19.1/bin")))
(setq exec-path (append exec-path '("~/bin")))
(setq exec-path (append exec-path '("~/go/bin")))
(exec-path-from-shell-copy-env "GOPATH")
