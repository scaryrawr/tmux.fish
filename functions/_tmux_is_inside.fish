function _tmux_is_inside
    # Check if we are inside a tmux session
    if test -n "$TMUX"
        return 0
    else
        return 1
    end
end