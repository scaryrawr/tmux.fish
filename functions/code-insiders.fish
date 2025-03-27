function code-insiders --wraps code-insiders
  if _tmux_is_inside
    # If we restore, we may have newer environment variables in the tmux session
    _tmux_load_env
  end

  command code-insiders $argv
end