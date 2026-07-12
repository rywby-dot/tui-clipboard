#!/usr/bin/env bash

umask 077
cliphist list | fzf \
    --exact \
    --no-sort \
    --no-info \
    --delimiter=$'\t' \
    --with-nth='2..' \
    --preview-border=rounded \
    --no-scrollbar \
    --preview-window='right:50%' \
    --bind 'right-click:execute(printf "%s" {1} | cliphist decode | wl-copy)+abort' \
    --bind 'enter:execute(printf "%s" {1} | cliphist decode | wl-copy)+abort' \
    --bind 'ctrl-d:execute(printf "%s" {1} | cliphist delete)+reload(cliphist list)' \
    --preview '
      tmp=$(mktemp) || exit

      cleanup() {
        rm -f -- "$tmp"
      }

      trap cleanup EXIT
      trap "cleanup; exit" HUP INT TERM

      printf "%s" {1} | cliphist decode > "$tmp" || exit

      MAX_SIZE=$((50 * 1024 * 1024))   # 50 MiB
        if [[ $(stat -c %s -- "$tmp") -gt $MAX_SIZE ]]; then
          size=$(du -h -- "$tmp" | cut -f1)
          printf "⚠  file too large to preview (%s)\n" "$size"
          exit
        fi

    # If you DO NOT use kitty, you can DELETE this line
    printf "\033_Ga=d,d=A\033\\"

      case $(file -b --mime-type -- "$tmp") in
        image/*)
          chafa -s "${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}" -- "$tmp"
          ;;
        *)
          bat --color=always --style=plain --paging=never -- "$tmp"
          ;;
      esac
    '
