(when (require 'powerline nil t)

  (defun arrow-right-xpm (color1 color2)
    "Return an XPM right arrow string representing."
    (format "/* XPM */
static char * arrow_right[] = {
\"20 18 2 1\",
\". c %s\",
\"  c %s\",
\"      ......        \",
\".      ......       \",
\"..      ......      \",
\"...      ......     \",
\"....      ......    \",
\".....      ......   \",
\"......      ......  \",
\".......      ...... \",
\"........      ......\",
\"........      ......\",
\".......      ...... \",
\"......      ......  \",
\".....      ......   \",
\"....      ......    \",
\"...      ......     \",
\"..      ......      \",
\".      ......       \",
\"      ......        \"};"  color1 color2))

  (defun arrow-left-xpm (color1 color2)
    "Return an XPM right arrow string representing."
    (format "/* XPM */
static char * arrow_right[] = {
\"20 18 2 1\",
\". c %s\",
\"  c %s\",
\"        ......      \",
\"       ......      .\",
\"      ......      ..\",
\"     ......      ...\",
\"    ......      ....\",
\"   ......      .....\",
\"  ......      ......\",
\" ......      .......\",
\"......      ........\",
\"......      ........\",
\" ......      .......\",
\"  ......      ......\",
\"   ......      .....\",
\"    ......      ....\",
\"     ......      ...\",
\"      ......      ..\",
\"       ......      .\",
\"        ......      \"};"  color2 color1))


  (defconst color1 "DarkSlateGray")
  (defconst color2 "DarkCyan")
  (defconst color3 "Gray24")
  (defconst color4 "Gray16")

  (defvar arrow-right-1 (create-image (arrow-right-xpm color1 color2) 'xpm t :ascent 'center))
  (defvar arrow-right-2 (create-image (arrow-right-xpm color2 "None") 'xpm t :ascent 'center))
  (defvar arrow-left-1  (create-image (arrow-left-xpm color2 color1) 'xpm t :ascent 'center))
  (defvar arrow-left-2  (create-image (arrow-left-xpm "None" color2) 'xpm t :ascent 'center))

  (setq-default mode-line-format
                (list  '(:eval (concat (propertize " %b " 'face 'mode-line-color-1)
                                       (propertize " " 'display arrow-right-1)))
                       '(:eval (concat (propertize " %m %Z " 'face 'mode-line-color-2)
                                       (propertize " " 'display arrow-right-2)))

                       '(:eval (propertize " " 'display '((space :align-to (- right-fringe 23)))))

                       '(:eval (concat (propertize " " 'display arrow-left-2)
                                       (propertize " %p " 'face 'mode-line-color-2)))
                       '(:eval (concat (propertize " " 'display arrow-left-1)
                                       (propertize "%4l:%2c  " 'face 'mode-line-color-1)))
                       ))

  (make-face 'mode-line-color-1)
  (set-face-attribute 'mode-line-color-1 nil
                      :foreground "#Fff"
                      :background color1)

  (make-face 'mode-line-color-2)
  (set-face-attribute 'mode-line-color-2 nil
                      :foreground "#fff"
                      :background color2)

  (set-face-attribute 'mode-line nil
                      :foreground "#fff"
                      :background color3
                      :box nil)

  (set-face-attribute 'mode-line-inactive nil
                      :foreground "#fff"
                      :background color4)

  )
