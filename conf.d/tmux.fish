# Not needed in non-interactive shells
status is-interactive || exit

# Not configure to autostart
test "$TMUX_AUTOSTART" = true || exit

# Don't try to start tmux if we're already inside a tmux session
if _tmux_is_inside
  # but... do try to set the environment variables
  _tmux_load_env
  exit
end

set -l tmux_session_name (_tmux_get_session_name)

# Check if the session already exists before creating a new one
if not tmux has-session -t "$tmux_session_name" 2>/dev/null
    tmux new-session -d -s "$tmux_session_name"
end

# VS Code has some special environment variables that need to be set to use code command in tmux in codespaces
if test "$TERM_PROGRAM" = "vscode"
  for line in (env | grep VSCODE)
    set -l name (echo $line | cut -d= -f1)
    set -l value (echo $line | cut -d= -f2-)
    tmux setenv -t "$tmux_session_name" $name "$value"
  end

  # In codespaces, the PATH has a specific path to code command for the server
  tmux setenv -t "$tmux_session_name" PATH "$PATH"
end

tmux attach-session -t "$tmux_session_name" 1>/dev/null && kill $fish_pid
