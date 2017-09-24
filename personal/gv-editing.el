;;; gv-cutom.el --- setup editing
;;; Commentary:
;;; some more customization over prelude

;;; Code:

;;----------------------------------------
;; packages required
;;----------------------------------------
(prelude-require-package 'duplicate-thing)
(prelude-require-package 'highlight-symbol)

;;----------------------------------------
;; disable whitespace mode - helpful but looks ugly
;;----------------------------------------
(setq prelude-whitespace nil)

;;
(defun kill-default-buffer ()
  "Kill the currently active buffer -- set to C-x k so that users are not asked which buffer they want to kill."
  (interactive)
  (let (kill-buffer-query-functions) (kill-buffer)))

(global-set-key (kbd "C-x k") 'kill-default-buffer)

;;----------------------------------------
;; package duplicate-thing
;;----------------------------------------
(global-set-key (kbd "M-c") 'duplicate-thing)

;;;----------------------------------------------------------------------
;;; highlight symbol at point
;;;----------------------------------------------------------------------
(highlight-symbol-nav-mode)

(add-hook 'prog-mode-hook (lambda () (highlight-symbol-mode)))
(add-hook 'org-mode-hook (lambda () (highlight-symbol-mode)))

(setq highlight-symbol-idle-delay 0.2
      highlight-symbol-on-navigation-p t)

(global-set-key [(control shift mouse-1)]
                (lambda (event)
                  (interactive "e")
                  (goto-char (posn-point (event-start event)))
                  (highlight-symbol-at-point)))

(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)
