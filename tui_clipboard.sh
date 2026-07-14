#!/usr/bin/env bash

umask 077

highlight_links() {
perl -pe '
s{\[\[ binary data [^]]* (\d+x\d+) \]\]$}{"\e[38;2;240;192;192m Image ${1}\e[0m"}ge;
s{\b(?:(?:https?|ftp|file)://|mailto:)[^\s<>"\x27\e]+}{"\e[38;2;192;192;240m${&}\e[0m"}ge;
'
}

list_clipboard() {
cliphist list | highlight_links
}

if [[ ${1:-} == --list ]]; then
list_clipboard
exit
fi

SCRIPT_PATH=$(realpath -- "$0") || exit

list_clipboard | fzf \
--ansi \
--exact \
--no-sort \
--no-info \
--delimiter=$'\t' \
--with-nth='2..' \
--preview-border=sharp \
--no-scrollbar \
--layout=reverse \
--preview-window='right:50%' \
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
' \
--bind 'ctrl-a:execute[
tmp=$(mktemp) || exit
trap "rm -f -- \"$tmp\"" EXIT HUP INT TERM
printf "%s" {1} | cliphist decode > "$tmp" || exit
"${VISUAL:-${EDITOR:-vi}}" "$tmp" || exit
wl-copy < "$tmp"
]+abort' \
--bind 'right-click:execute(printf "%s" {1} | cliphist decode | wl-copy)+abort' \
--bind 'enter:execute(printf "%s" {1} | cliphist decode | wl-copy)+abort' \
--bind 'ctrl-d:execute(printf "%s" {1} | cliphist delete)+reload('"$SCRIPT_PATH"' --list)'
