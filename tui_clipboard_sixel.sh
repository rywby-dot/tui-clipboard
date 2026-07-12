#!/usr/bin/env bash

cliphist list | fzf --no-sort --no-info --delimiter '\t' --with-nth 2.. \
  --preview '
    tmp=$(mktemp)
    printf "%s" {1} | cliphist decode > "$tmp"
    if file -b --mime-type "$tmp" | grep -q "^image/"; then
        chafa -f sixels -s "$(($FZF_PREVIEW_COLUMNS))x$FZF_PREVIEW_LINES" "$tmp"
    else
        bat --color=always --style=plain "$tmp"
    fi
    rm -f "$tmp"
  ' \
  --preview-window=right:50% \
  --bind 'right-click:execute(printf "%s" {1} | cliphist decode | wl-copy)+abort' \
  --bind 'enter:execute(printf "%s" {1} | cliphist decode | wl-copy)+abort' \
  --bind 'ctrl-d:execute(printf "%s" {1} | cliphist delete)+reload(cliphist list)' \
