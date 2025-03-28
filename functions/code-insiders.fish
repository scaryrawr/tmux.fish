function code-insiders --wraps code-insiders
  if _tmux_is_inside
    # If we restore, we may have newer environment variables in the tmux session
    _tmux_load_env
  end

  # If we're in VS Code, we don't need to strip the TMUX variables
  if not test "$VSCODE_INJECTION" = 1
    env -u TMUX -u TMUX_PANE command code-insiders $argv
  else
    command code-insiders $argv
  end
end