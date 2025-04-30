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
        for i in (seq 1 100)
            set -f tmux_session_name "$term_id-$i"
            if not tmux has-session -t "$tmux_session_name" 2>/dev/null
                break
            end
        end
    end

    echo $tmux_session_name
end
