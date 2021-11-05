#!/usr/bin/env bash

# SEE https://stackoverflow.com/a/8352939/13194984
# SEE https://stackoverflow.com/questions/41770139/variable-assignment-in-nested-function-call-unexpectedly-changes-local-variable

emacsclient-ensure-p() {
  emacsclient -u -e "(server-running-p)" 2>/dev/null || emacs --daemon
}

epipe-ensure-p() {
  # SEE https://www.emacswiki.org/emacs/EmacsPipe
  # pipe stdin to emacsclient like vim with  "| et - "
  mkdir -p /tmp/epipe
  if [[ "$1" == "-" ]]; then
    tmpfile=$(mktemp "/tmp/epipe/$(date +%m%d-%H%M%S)-XXX")

    # SEE https://superuser.com/a/380778
    gsed 's/\x1b\[[0-9;]*[a-zA-Z]//g' | cat >"$tmpfile"

    [ ! -s "$tmpfile" ] && unset tmpfile && exit 0
  fi
}

etest() {
  emacsclient -u -s test -e "(server-running-p)" 2>/dev/null \
    || emacs -Q --daemon=test --load ~/.config/emacs/core/init-test.el
  emacsclient -q -s test -t "$@"
}
