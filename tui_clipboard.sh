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

copy_clipboard() (
local mime tmp
tmp=$(mktemp) || exit
trap 'rm -f -- "$tmp"' EXIT

printf "%s" "$1" | cliphist decode > "$tmp" || exit

mime=$(file -b --mime-type -- "$tmp") || exit
if [[ $mime == inode/x-empty ]] ||
   [[ $mime == application/octet-stream ]] && LC_ALL=C grep -Iq '' "$tmp"; then
mime=text/plain
fi

wl-copy --type "$mime" < "$tmp"
)

if [[ ${1:-} == --list ]]; then
list_clipboard
exit
fi

if [[ ${1:-} == --copy && -n ${2+x} ]]; then
copy_clipboard "$2"
exit
fi

SCRIPT_PATH=$(realpath -- "$0") || exit
printf -v SCRIPT_PATH_Q '%q' "$SCRIPT_PATH"

list_clipboard | SHELL=$BASH fzf \
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
trap "rm -f -- \"$tmp\"" EXIT

MAX_SIZE=$((50 * 1024 * 1024))   # 50 MiB
printf "%s" {1} | cliphist decode | head -c "$((MAX_SIZE + 1))" > "$tmp" || exit

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
bat --color=always --style=plain --paging=never \
    --wrap=character --terminal-width="$FZF_PREVIEW_COLUMNS" -- "$tmp"
;;
esac
' \
--bind 'ctrl-a:execute[
tmp=$(mktemp) || exit
trap "rm -f -- \"$tmp\"" EXIT
printf "%s" {1} | cliphist decode > "$tmp" || exit
"${VISUAL:-${EDITOR:-vi}}" "$tmp" || exit
wl-copy < "$tmp"
]+abort' \
--bind 'enter:execute('"$SCRIPT_PATH_Q"' --copy {1})+abort' \
--bind 'ctrl-d:execute(printf "%s" {1} | cliphist delete)+reload('"$SCRIPT_PATH_Q"' --list)' \
--bind 'ctrl-h:execute(printf "%s\n" \
"ctrl+h      - open this menu" \
"ctrl+a      - open editor" \
"ctrl+d      - delete entry" \
"enter       - copy and exit" \
"ctrl+c      - exit" \
"esc         - exit" | fzf \
--ansi \
--no-input \
--no-info \
--no-scrollbar \
--layout=reverse \
--border=sharp \
--height=100% \
--margin=30%,25% \
--pointer="" \
--bind="ctrl-h:abort,esc:abort,enter:abort")' \
