#!/usr/bin/env sh

PROJDIR="$HOME/go/src/github.com/kong/kubernetes-ingress-controller"

if [ ! -d "$PROJDIR" ]; then
    >&2 echo "target directory does not exist: $PROJDIR"
    exit -1
fi

tmux new-session -d -s king -c $PROJDIR -n Control
tmux new-window -c $PROJDIR -t king
tmux new-window -c $PROJDIR -t king
tmux new-window -c $PROJDIR/docs -t king -n Docs

for _pane in $(tmux list-panes -s -t king -F '#{pane_id}'); do \
  tmux send-keys -t ${_pane} "export GOPATH=~/go" Enter
  tmux send-keys -t ${_pane} "export GO111MODULE=off" Enter
  tmux send-keys -t ${_pane} "clear" Enter
  tmux clear-history -t ${_pane}
done

tmux select-window -t Control
tmux attach-session -E -t king
