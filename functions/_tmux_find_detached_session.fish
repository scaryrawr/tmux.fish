function _tmux_find_detached_session
    # List sessions and find one that's detached
    set -f term_id (_tmux_get_term_id)
    tmux list-sessions 2>/dev/null | grep "$term_id" | grep -v '(attached)' | cut -d: -f1
end
