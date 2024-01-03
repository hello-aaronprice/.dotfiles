#!/usr/bin/env bash

# chmod +x filename

languages=$(echo "golang c typescript rust python bash powershell" | tr " " "\n") 
core_utils=$(echo "find xargs sed awk ls grep"| tr " " "\n")

selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "QUERY: " query

if echo "$languages" | grep -qs $selected; then
    tmux split-window -p 33 -h bash -c "curl cheat.sh/$selected/$(echo "$query" | tr " " "+") | less" 
else
    tmux split-window -p 33 -h bash -c "curl cheat.sh/$selected~$query | less" 
fi 