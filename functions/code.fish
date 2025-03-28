function code --wraps code
  if _tmux_is_inside
    # If we restore, we may have newer environment variables in the tmux session
    _tmux_load_env
  end

  env -u TMUX -u TMUX_PANE command code $argv
end