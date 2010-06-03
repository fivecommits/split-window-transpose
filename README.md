# split-window-transpose

## Usage
**split-window-transpose** is a small Emacs Lisp function to convert horizontally-split windows to a vertically-split orientation, and vice-versa.

It can be bound to `C-x t`, not to be confused with `C-x C-t` (`transpose-lines`).

## Installation

You can put this with your Emacs files, such as `.emacs.d`:

    $ cd ~/.emacs.d
    $ git clone git://github.com/fivecommits/split-window-transpose

In your `.emacs` file:

    (load "~/.emacs.d/split-window-transpose/split-window-transpose")
    (define-key ctl-x-map "t" 'split-window-transpose)
