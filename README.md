# Fast and simple clipboard manager in terminal

<img width="960" height="540" alt="ScreenShot-2026-07-12_09-20-56" src="https://github.com/user-attachments/assets/4f0ce22d-f51a-422d-aacc-8aae9722e5df" />

# Dependences
```
chafa
bat
fzf
cliphist
wl-clipboard
file
sed
grep
xdg-utils
bash
```
**Arch**
```
sudo pacman -S bash cliphist fzf wl-clipboard xdg-utils file bat kitty foot chafa
```
**Void**
```
sudo xbps-install -S bash cliphist fzf wl-clipboard xdg-utils file bat kitty foot chafa
```
**Other distros** - should be the same

# Install
```
git clone https://github.com/rywby-dot/tui-clipboard.git
cd tui-clipboard
chmod +x tui-clipboard/tui_clipboard_sixel.sh
chmod +x tui-clipboard/tui_clipboard_noimage.sh
chmod +x tui-clipboard/tui_clipboard_kitty.sh
```
or just download the file


# Usage
just run the script
```
./tui_clipboard_*.sh
```

# Image protocol: Sixel

<img width="480" height="270" alt="ScreenShot-2026-07-12_09-21-13" src="https://github.com/user-attachments/assets/668525f2-e69b-49ff-b360-77c38bd74302" />

Recomended: foot
```
foot -a tui-clipboard bash -c '~/tui-clipboard/tui_clipboard_sixel.sh'
```
or using footserver
```
footserver &
footclient -a tui-clipboard bash -c '~/tui-clipboard/tui_clipboard_sixel.sh'
```


# Image protocol: kitty

<img width="480" height="270" alt="ScreenShot-2026-07-12_09-26-18" src="https://github.com/user-attachments/assets/7cfc0cba-1e31-46bd-b37a-4c5a5745d693" />

Recomended: kitty
```
kitty -1 --class tui-clipboard zsh -c '~/tui-clipboard/tui_clipboard_kitty.sh'
```


# Image protocol: none

<img width="480" height="270" alt="ScreenShot-2026-07-12_09-22-59" src="https://github.com/user-attachments/assets/c2f55598-110f-423c-b69d-11ab1ce23102" />

Not recomended (for example: alacritty)
```
alacritty --class tui-clipboard -e bash -c '~/tui-clipboard/tui_clipboard_noimage.sh'
```
