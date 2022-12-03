;;; virtualenv-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "virtualenv" "virtualenv.el" (0 0 0 0))
;;; Generated autoloads from virtualenv.el

(autoload 'virtualenv-workon "virtualenv" "\
Activate a virtual environment for python.
Optional argument ENV if non-nil, either use the string given as
the virtual environment or if not a string then query the user.

\(fn &optional ENV)" t nil)

(autoload 'virtualenv-deactivate "virtualenv" nil t nil)

(autoload 'virtualenv-minor-mode "virtualenv" "\
Toggle Virtualenv minor mode on or off.

This is a minor mode.  If called interactively, toggle the
`Virtualenv minor mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `virtualenv-minor-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\\{virtualenv-minor-mode-map}

\(fn &optional ARG)" t nil)

(register-definition-prefixes "virtualenv" '("virtualenv-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; virtualenv-autoloads.el ends here
