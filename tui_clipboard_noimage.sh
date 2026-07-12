#!/usr/bin/env bash
cliphist list | fzf --no-sort --no-info --delimiter '\t' --with-nth 2.. \
  --preview '
    tmp=$(mktemp)
    echo {} | cliphist decode > "$tmp"
    if file -b --mime-type "$tmp" | grep -q "^image/"; then
        chafa -f symbols -s "$(($FZF_PREVIEW_COLUMNS))x$FZF_PREVIEW_LINES" "$tmp"
    else
        bat --color=always --style=plain "$tmp"
    fi
    rm -f "$tmp"
  ' \
  --preview-window=right:50% \
  --bind 'enter:execute(echo {} | cliphist decode | wl-copy)+abort'
