#!/usr/bin/env sh

tmux new-session -d -s xyz -c ./src/github.com/UkiahSmith/note
tmux setenv -t xyz GOPATH ~/go
tmux new-window -c ./src/github.com/UkiahSmith/note
tmux new-window -c ./src/github.com/UkiahSmith/note
tmux new-window -c ./src/github.com/UkiahSmith/note
tmux rename-widow -t 1 Control

tmux select-window -t 1
tmux attach-session -E -t xyz
