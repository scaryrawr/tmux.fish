# Not needed in non-interactive shells
status is-interactive || exit

# Not configured to autostart unless TMUX_AUTOSTART or TMUX_SSHAUTO_START+SSH
set -l _tmux_should_autostart 0
if test "$TMUX_AUTOSTART" = true
    set _tmux_should_autostart 1
else if test "$TMUX_SSHAUTO_START" = true
    if set -q SSH_CONNECTION; or set -q SSH_CLIENT; or set -q SSH_TTY
        set _tmux_should_autostart 1
    end
end

if test $_tmux_should_autostart -ne 1
    exit
end

# Don't try to start tmux if we're already inside a tmux session
if _tmux_is_inside
    # but... do try to set the environment variables
    _tmux_load_env
    exit
end

set -l tmux_session_name (_tmux_get_session_name)
if test -z "$tmux_session_name"
    # If we can't get a session name, exit
    exit
end

# Check if the session already exists before creating a new one
if not tmux has-session -t "$tmux_session_name" 2>/dev/null
    tmux new-session -d -s "$tmux_session_name"
end

tmux attach-session -t "$tmux_session_name" 1>/dev/null

# Set TMUX_AUTOEXIT to TMUX_AUTOSTART if not set
if not set -q TMUX_AUTOEXIT
    set -g TMUX_AUTOEXIT $TMUX_AUTOSTART
end

# Only kill the fish process if TMUX_AUTOEXIT is true
if test "$TMUX_AUTOEXIT" = true
    kill $fish_pid
end
