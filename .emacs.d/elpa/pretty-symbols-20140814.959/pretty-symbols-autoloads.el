;;; pretty-symbols-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "pretty-symbols" "pretty-symbols.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from pretty-symbols.el

(autoload 'pretty-symbols-mode "pretty-symbols" "\
Draw multi-character tokens as Unicode glyphs.
For example, in lisp modes draw λ instead of the characters
l a m b d a. The on-disk file keeps the original characters.

This is a minor mode.  If called interactively, toggle the
`Pretty-Symbols mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `pretty-symbols-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

This may sound like a neat trick, but be extra careful: it
changes the line length and can thus lead to surprises with
respect to alignment and layout.

To enable, add to the hooks of the major modes you want pretty
symbols in: (add-hook 'emacs-lisp-mode-hook 'pretty-symbols-mode).

\(fn &optional ARG)" t nil)

(defvar pretty-symbol-patterns (let ((lisps '(emacs-lisp-mode inferior-lisp-mode inferior-emacs-lisp-mode lisp-mode scheme-mode)) (c-like '(c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode))) `((955 lambda "\\<lambda\\>" (,@lisps python-mode inferior-python-mode)) (402 lambda "\\<function\\>" (js-mode)) (8800 relational "!=" (,@c-like)) (8800 relational "/=" (,@lisps)) (8805 relational ">=" (,@c-like ,@lisps)) (8804 relational "<=" (,@c-like ,@lisps)) (8743 logical "&&" (,@c-like)) (8743 logical "\\<and\\>" (,@lisps)) (8744 logical "||" (,@c-like)) (8744 logical "\\<or\\>" (,@lisps)) (172 logical "\\<not\\>" (,@lisps)) (8709 nil "\\<nil\\>" (,@lisps)))) "\
A list of ((character category pattern major-modes) ...).
For each entry in the list, if the buffer's major mode (or one of
its parent modes) is listed in MAJOR-MODES, occurrences of
PATTERN will be shown as CHARACTER instead.

The replacement will only happen if CATEGORY is present in
`pretty-symbol-categories' before this mode is enabled.

Note that a major mode's presence in this list doesn't turn on
pretty-symbols-mode; you have to do so in the major mode's hook.")

(custom-autoload 'pretty-symbol-patterns "pretty-symbols" t)

(defvar pretty-symbol-categories (list 'lambda) "\
A list of the categories in `pretty-symbol-patterns' to enable.

By default, only lambdas (and the equivalents in other languages)
are prettified, so that users can use this minor mode to add their
own patterns, without being saddled with a whole lot of confusing
symbols.

This must be set before `pretty-symbols-mode' is enabled.

The available symbols are:

lambda          Prettify the keyword for lambdas (anonymous functions).
relational      Relational operators: ≠ ≤ ≥
logical         Logical operators: ∧ ∨ ¬

To set this list from your init file:
\(setq pretty-symbol-categories '(lambda relational logical))
")

(custom-autoload 'pretty-symbol-categories "pretty-symbols" t)

(register-definition-prefixes "pretty-symbols" '("pretty-symbol-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; pretty-symbols-autoloads.el ends here
