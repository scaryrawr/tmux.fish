function _tmux_find_detached_session
    # List sessions and find one that's detached
    for session in (tmux list-sessions 2>/dev/null | grep "$TERM_PROGRAM")
        # Extract session name (part before the colon)
        set -l session_name (echo $session | cut -d: -f1)
        # Check if session is detached
        if echo $session | grep -v '(attached)'
            echo $session_name
        end
    end
end
