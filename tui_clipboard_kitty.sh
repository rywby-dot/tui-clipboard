#!/usr/bin/env bash

export KITTY_CLIP_IMAGE_ID=$$

cliphist list | fzf --no-sort --no-info --delimiter '\t' --with-nth 2.. \
  --preview '
    tmp=$(mktemp)
    printf "%s" {1} | cliphist decode > "$tmp"

    echo -en "\033_Ga=d,d=I,i=${KITTY_CLIP_IMAGE_ID},q=2\033\\"

    if file -b --mime-type "$tmp" | grep -q "^image/"; then
        kitten icat \
          --transfer-mode=memory \
          --unicode-placeholder \
          --stdin=no \
          --scale-up \
          --image-id="$KITTY_CLIP_IMAGE_ID" \
          --place="${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0" \
          "$tmp" 2>/dev/null \
          | sed "\$d" \
          | sed "\$s/\$/\x1b[m/"
    else
        bat --color=always --style=plain "$tmp"
    fi

    rm -f "$tmp"
  ' \
  --preview-window=right:50% \
  --bind 'enter:execute-silent(printf "%s" {1} | cliphist decode | wl-copy)+abort' \
  --bind 'ctrl-d:execute-silent(printf "%s" {1} | cliphist delete)+reload(cliphist list)' \
  --bind 'right-click:execute(printf "%s" {1} | cliphist decode | wl-copy)+abort' \

echo -en "\033_Ga=d,d=I,i=${KITTY_CLIP_IMAGE_ID},q=2\033\\" \
  > /dev/tty 2>/dev/null || true
