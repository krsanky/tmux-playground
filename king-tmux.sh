#!/usr/bin/env sh

tmux new-session -d -s king -c $HOME/go/src/github.com/kong/kubernetes-ingress-controller 
tmux setenv -t king GOPATH ~/go
tmux new-window -c $HOME/go/src/github.com/kong/kubernetes-ingress-controller -t king
tmux new-window -c $HOME/go/src/github.com/kong/kubernetes-ingress-controller -t king
tmux new-window -c $HOME/go/src/github.com/kong/kubernetes-ingress-controller -t king

for _pane in $(tmux list-panes -s -t king -F '#{pane_id}'); do \
  tmux send-keys -t ${_pane} "export GOPATH=~/go" Enter
  tmux send-keys -t ${_pane} "export GO111MODULE=off" Enter
  tmux send-keys -t ${_pane} "clear" Enter
  tmux clear-history -t ${_pane}
done

tmux select-window -t 1
tmux attach-session -E -t king
