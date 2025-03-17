function _tmux_find_detached_session
    # List sessions and find one that's detached
    set -f term_id (_tmux_get_term_id)
    for session in (tmux list-sessions 2>/dev/null | grep "$term_id")
        # Extract session name (part before the colon)
        set -l session_name (echo $session | cut -d: -f1)
        # Check if session is detached
        if echo $session | grep -v '(attached)'
            echo $session_name
        end
    end
end
