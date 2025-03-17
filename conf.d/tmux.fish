if not status is-interactive
    return
end

if not test $TMUX_AUTOSTART
    return
end

# Don't try to start tmux if we're already inside a tmux session
if set -q TMUX
    return
end

# Things break in VS Code if tmux is started.
if test "$TERM_PROGRAM" = vscode
    return
end

set -l tmux_session_name (_tmux_get_session_name)

# Check if the session already exists before creating a new one
if not tmux has-session -t "$tmux_session_name" 2>/dev/null
    tmux new-session -d -s "$tmux_session_name"
end

tmux attach-session -t "$tmux_session_name"

# Kill the fish session so exiting tmux exists fish
kill $fish_pid
