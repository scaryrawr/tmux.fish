function _tmux_get_session_name
    # Check for existing sessions first
    set -f existing_sessions (_tmux_find_detached_session)

    # If we have existing sessions, use the first one
    if test -n "$existing_sessions"
        set -f tmux_session_name $existing_sessions[1]
    else
        # Create a new session with a unique name based on the terminal and timestamp
        set -f stamp (date +'%s')
        set -f term_id (_tmux_get_term_id)
        set -f tmux_session_name "$term_id-$stamp"
    end

    echo $tmux_session_name
end
