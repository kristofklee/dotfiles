#function gup
#{
  # subshell for `set -e` and `trap`
  (
    set -e # fail immediately if there's a problem

    # use `git-up` if installed
    if type git-up > /dev/null 2>&1
    then
      exec git-up
    fi

    # fetch upstream changes
    git fetch

    BRANCH=$(git describe --contains --all HEAD)
    if [ -z "$(git config branch.$BRANCH.remote)" -o -z "$(git config branch.$BRANCH.merge)" ]
    then
      echo "\"$BRANCH\" is not a tracking branch." >&2
      exit 1
    fi

    # create a temp file for capturing command output
    TEMPFILE="`mktemp -t gup.XXXXXX`"
    trap '{ rm -f "$TEMPFILE"; }' EXIT

    # if we're behind upstream, we need to update
    if git status | grep "# Your branch" > "$TEMPFILE"
    then

      # extract tracking branch from message
      UPSTREAM=$(cat "$TEMPFILE" | cut -d "'" -f 2)
      if [ -z "$UPSTREAM" ]
      then
        echo Could not detect upstream branch >&2
        exit 1
      fi

      # can we fast-forward?
      CAN_FF=1
      grep -q "can be fast-forwarded" "$TEMPFILE" || CAN_FF=0

      # stash any uncommitted changes
      git stash | tee "$TEMPFILE"
      [ "${PIPESTATUS[0]}" -eq 0 ] || exit 1

      # take note if anything was stashed
      HAVE_STASH=0
      grep -q "No local changes" "$TEMPFILE" || HAVE_STASH=1

      if [ "$CAN_FF" -ne 0 ]
      then
        # if nothing has changed locally, just fast foward.
        git merge --ff "$UPSTREAM"
      else
        # rebase our changes on top of upstream, but keep any merges
        git rebase -p "$UPSTREAM"
      fi

      # restore any stashed changes
      if [ "$HAVE_STASH" -ne 0 ]
      then
        git stash pop
      fi

    fi

  )
#}
