function _tmux_get_session_name
    # Check for existing sessions first
    set -f existing_sessions (_tmux_find_detached_session)

    # If we have existing sessions, use the first one
    if test -n "$existing_sessions"
        set -f tmux_session_name $existing_sessions[0]
    else
        # Create a new session with a unique name based on the terminal and timestamp
        set -f stamp (date +'%s')
        set -f tmux_session_name "$TERM_PROGRAM-$stamp"
    end

    echo $tmux_session_name
end
