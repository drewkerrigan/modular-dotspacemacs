;; -*- mode: emacs-lisp -*-
;; Directions from: https://github.com/ten0s/syntaxerl
;;;----------------------------------------
;;; erlang-mode
;;;----------------------------------------
(setq erlang-root-dir "~/erlang/19.1/")
(setq load-path (cons (car (file-expand-wildcards (concat erlang-root-dir "/lib/tools-*/emacs"))) load-path))
(setq erlang-electric-commands nil)
(require 'erlang-start)
(add-hook 'erlang-mode-hook
          '(lambda()
             (imenu-add-to-menubar "Imenu")))
(defvar erlang-compile-extra-opts ; add include directory to default compile path.
  '(bin_opt_info debug_info (i . "../include") (i . "../_build/*/lib") (i . "../_build/*/lib/*/include") (i . "../deps") (i . "../../") (i . "../../../deps") (i . "../../../../../_build/*/lib") (i . "../../../../include")))
(setq erlang-compile-outdir "../ebin") ; define where put beam files.

                                        ; define auto erlang mode for these files/extensions.
(add-to-list 'auto-mode-alist '(".*\\.app\\'"     . erlang-mode))
(add-to-list 'auto-mode-alist '(".*app\\.src\\'"  . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.config\\'"  . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.rel\\'"     . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.script\\'"  . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.escript\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.es\\'"      . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.xrl\\'"     . erlang-mode))
(add-to-list 'auto-mode-alist '(".*\\.yrl\\'"     . erlang-mode))

;;;----------------------------------------
;;; flymake
;;;----------------------------------------
(require 'flymake)
(require 'flymake-cursor) ; http://www.emacswiki.org/emacs/FlymakeCursor
(setq flymake-log-level 3)
(defun flymake-compile-script-path (path)
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list path (list local-file))))
(defun flymake-syntaxerl ()
  (flymake-compile-script-path "~/src/util/syntaxerl/syntaxerl"))
(add-hook 'erlang-mode-hook
          '(lambda()
             (setq erlang-indent-level 4)
             (add-to-list 'flymake-allowed-file-name-masks '("\\.erl\\'"     flymake-syntaxerl))
             (add-to-list 'flymake-allowed-file-name-masks '("\\.hrl\\'"     flymake-syntaxerl))
             (add-to-list 'flymake-allowed-file-name-masks '("\\.xrl\\'"     flymake-syntaxerl))
             (add-to-list 'flymake-allowed-file-name-masks '("\\.yrl\\'"     flymake-syntaxerl))
             (add-to-list 'flymake-allowed-file-name-masks '("\\.app\\'"     flymake-syntaxerl))
             (add-to-list 'flymake-allowed-file-name-masks '("\\.app.src\\'" flymake-syntaxerl))
             (add-to-list 'flymake-allowed-file-name-masks '("\\.config\\'"  flymake-syntaxerl))
             (add-to-list 'flymake-allowed-file-name-masks '("\\.rel\\'"     flymake-syntaxerl))
             (add-to-list 'flymake-allowed-file-name-masks '("\\.script\\'"  flymake-syntaxerl))
             (add-to-list 'flymake-allowed-file-name-masks '("\\.escript\\'" flymake-syntaxerl))
             (add-to-list 'flymake-allowed-file-name-masks '("\\.es\\'"      flymake-syntaxerl))

             ;; should be the last.
             (flymake-mode 1)
             ))
                                        ; see /usr/local/lib/erlang/lib/tools-<Ver>/emacs/erlang-flymake.erl
(defun erlang-flymake-only-on-save ()
  "Trigger flymake only when the buffer is saved (disables syntax
check on newline and when there are no changes)."
  (interactive)

  ;; There doesn't seem to be a way of disabling this; set to the
  ;; largest int available as a workaround (most-positive-fixnum
  ;; equates to 8.5 years on my machine, so it ought to be enough ;-) )
  (setq flymake-no-changes-timeout most-positive-fixnum)
  (setq flymake-start-syntax-check-on-newline nil))
(erlang-flymake-only-on-save)
