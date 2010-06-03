;;
;; split-window-transpose.el
;;

(defun split-window-transpose (&optional arg)
  "Switch between horizontal and vertical 2-window layouts"
  (interactive "p")
  (if (eq 2 (count-windows))
      (let* ((sel-w (selected-window))
             (fw (frame-width (window-frame sel-w)))
             (ww (window-width))
             (left-top-right-bottom (window-edges sel-w))
             (sel-left (nth 0 left-top-right-bottom))
             (sel-top (nth 1 left-top-right-bottom))
             (is-left-top)
             (vis-w)
             (other-w))
        (progn
          ;; save other buffer
          (defun get-other-window ()
            (walk-windows
             (function (lambda(w)
                 (if (not (equal w (selected-window)))
                     (push w vis-w)))))
             (car vis-w))
          (setq other-b (window-buffer (get-other-window)))

          ;; clear other window
          (delete-other-windows)

          ;; determine which way to transpose
          (if (= fw ww)
              (split-window-horizontally)
            (split-window-vertically))

          ;; determine whether it's left/top or right/bottom
          (if (or (> sel-left 0) (> sel-top 0))
              ;; right bottom
              (progn
                (set-window-buffer (selected-window) other-b)
                (other-window 1))
            (progn
              (setq other-w (get-other-window))
              (set-window-buffer other-w other-b)))))))
