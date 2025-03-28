function code --wraps code
  if _tmux_is_inside
    # If we restore, we may have newer environment variables in the tmux session
    _tmux_load_env
  end

  # If we're in VS Code, we don't need to strip the TMUX variables
  if not test "$VSCODE_INJECTION" = 1
    env -u TMUX -u TMUX_PANE command code $argv
  else
    command code $argv
  end
end