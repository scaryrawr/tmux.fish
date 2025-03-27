function _tmux_load_env
  set -l sh_env (tmux showenv -st (tmux display-message -p '#S'))
  replay "$sh_env"
end