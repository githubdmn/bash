
#!/usr/bin/env bash
# ~/bin/dev.sh
SESSION=code
BASE=~/projects

# window name : directory
WINDOWS=(
  "js:codejs"
  "java:codejava"
  "py:codepy"
  "go:codego"
  "bash:bash"
  "db:database"
)

# If the session already exists, just attach
tmux has-session -t "$SESSION" 2>/dev/null && exec tmux attach -t "$SESSION"

first=1
for entry in "${WINDOWS[@]}"; do
  name="${entry%%:*}"
  dir="$BASE/${entry##*:}"
  # mkdir -p "$dir"

  if [ "$first" -eq 1 ]; then
    tmux new-session -d -s "$SESSION" -n "$name" -c "$dir"
    first=0
  else
    tmux new-window -t "$SESSION:" -n "$name" -c "$dir"
  fi

  # Left pane: nvim, right pane: regular shell
  tmux send-keys -t "$SESSION:$name" 'nvim .' C-m
  tmux split-window -h -t "$SESSION:$name" -c "$dir"
  tmux select-pane -t "$SESSION:$name" -L   # focus back on nvim
done

tmux select-window -t "$SESSION:js"
exec tmux attach -t "$SESSION"
