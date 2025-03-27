# tmux.fish

Simple tmux wrapper.

Tries to associate your $TERM_PROGRAM with tmux sessions.

Will attempt to reattach to detached sessions associated with the terminal, or create a new one if all sessions are attached.

To enable:

```fish
set -Ux TMUX_AUTOSTART true
```

To disable:

```fish
set -Ue TMUX_AUTOSTART
```

## Dependencies

Depends on [jorgebucaran/replay.fish](https://github.com/jorgebucaran/replay.fish).

## Installation

```fish
fisher install jorgebucaran/replay.fish scaryrawr/tmux.fish
```
