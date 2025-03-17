function _tmux_get_term_id
    if test -n "$TERM_PROGRAM"
      echo $TERM_PROGRAM
    else if test -n "$TERM"
      echo $TERM
    else
      echo "term"
    end
end