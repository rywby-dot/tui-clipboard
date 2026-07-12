# Fast and simple clipboard manager in terminal

<img width="960" height="540" alt="ScreenShot-2026-07-12_16-17-28" src="https://github.com/user-attachments/assets/2d3701df-cffd-4292-a81f-73178f8fdd44" />

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
chmod +x tui_clipboard_sixel.sh
chmod +x tui_clipboard_noimage.sh
chmod +x tui_clipboard_kitty.sh
```
or just download the file


# Usage
just run the script
```
./tui_clipboard_*.sh
```

# Private Mode

*In private mode text that you copy is NOT saving in cliphist. So you can copy passwords to example. See here https://github.com/rywby-dot/tui-clipboard/blob/main/private-mode/README_PrivateMode.md*


# Image protocol: Sixel

<img width="480" height="270" alt="ScreenShot-2026-07-12_16-17-16" src="https://github.com/user-attachments/assets/7696a4c0-6162-47fa-9c2f-4d014e712c99" />

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

<img width="480" height="270" alt="ScreenShot-2026-07-12_16-18-02" src="https://github.com/user-attachments/assets/d90f5ef3-54df-4240-b8af-09d313727906" />

Recomended: kitty
```
kitty -1 --class tui-clipboard bash -c '~/tui-clipboard/tui_clipboard_kitty.sh'
```


# Image protocol: none

<img width="480" height="270" alt="ScreenShot-2026-07-12_16-18-28" src="https://github.com/user-attachments/assets/52bb3b01-94fb-40a4-b5ca-f7f94974875a" />

Not recomended (for example: alacritty)
```
alacritty --class tui-clipboard -e bash -c '~/tui-clipboard/tui_clipboard_noimage.sh'
```
