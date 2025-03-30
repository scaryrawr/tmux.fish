function _tmux_get_term_id
    if test "$TERM_PROGRAM" = vscode -o "$VSCODE_INJECTION" = 1
        set dir (basename $PWD | string replace -a '.' '_')
        echo "$dir"
    else if test -n "$TERM_PROGRAM"
        echo $TERM_PROGRAM
    else if test -n "$TERM"
        echo $TERM
    end
end
