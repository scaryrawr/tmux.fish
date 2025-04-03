function _tmux_get_session_name
    # Check for existing sessions first
    set -f existing_sessions (_tmux_find_detached_session)

    # If we have existing sessions, use the first one
    if test (count $existing_sessions) -gt 0
        set -f tmux_session_name $existing_sessions[1]
    else
        # Create a new session with a unique name based on the terminal and timestamp
        set -f term_id (_tmux_get_term_id)
        if test -z "$term_id"
            return
        end
        set -f tmux_session_name "$term_id"
    end

    echo $tmux_session_name
end
