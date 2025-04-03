function _tmux_load_env
  set -l sh_env (tmux showenv -s)
  replay "$sh_env"
end