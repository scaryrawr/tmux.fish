# Not needed in non-interactive shells
status is-interactive || exit

# Not configure to autostart
test "$TMUX_AUTOSTART" = true || exit

# Don't try to start tmux if we're already inside a tmux session
test "$TERM_PROGRAM" = "tmux" && exit

set -l tmux_session_name (_tmux_get_session_name)

# Check if the session already exists before creating a new one
if not tmux has-session -t "$tmux_session_name" 2>/dev/null
    tmux new-session -d -s "$tmux_session_name"
end

tmux attach-session -t "$tmux_session_name" 1>/dev/null && kill $fish_pid
