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

## Environment Variables

The following environment variables control tmux.fish startup behavior:

- **TMUX_AUTOSTART**: If set to `true`, tmux.fish will attempt to automatically start or attach to a tmux session when a new terminal is opened. Unset or set to any other value to disable autostart.

- **TMUX_SSHAUTO_START**: If set to `true`, tmux.fish will attempt to start or attach to a tmux session automatically when inside an SSH session. This is useful for remote workflows. Unset or set to any other value to disable SSH autostart.

- **TMUX**: This variable is set by tmux itself when you are already inside a tmux session. tmux.fish checks this to avoid nesting tmux sessions.

- **TMUX_AUTOEXIT**: If set to `true`, tmux.fish will automatically exit the current fish process after attaching to a tmux session. By default, it inherits the value of `TMUX_AUTOSTART` if not explicitly set. This is useful for ensuring that only the tmux session remains active in the terminal, preventing duplicate shells.


You can set or unset these variables using the `set` command in fish, for example:

```fish
set -Ux TMUX_AUTOSTART true
set -Ux TMUX_SSHAUTO_START true
```

Unset with:

```fish
set -Ue TMUX_AUTOSTART
set -Ue TMUX_SSHAUTO_START
```
