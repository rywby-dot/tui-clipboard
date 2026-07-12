# Fast and simple clipboard manager in terminal

<img width="960" height="540" alt="ScreenShot-2026-07-12_21-36-19" src="https://github.com/user-attachments/assets/bd4fd718-bd02-4b0e-9428-77ed01696911" />

Works with every terminal. Shows pictures using chafa in kitty, sixel, acsii, iterm etc.

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
chmod +x tui_clipboard.sh
```
```
chmod +x private-mode/clipboard_script.sh
chmod +x private-mode/clipboard_switch.sh
```
or just download the file


# Usage
just run the script
```
./tui_clipboard.sh
```

# Private Mode

*In private mode text that you copy is NOT saving in cliphist. So you can copy passwords to example. See here https://github.com/rywby-dot/tui-clipboard/blob/main/private-mode/README_PrivateMode.md*


# Usage pt2
Recomended: foot (sixel)
```
foot -a tui-clipboard bash -c '~/tui-clipboard/tui_clipboard.sh'
```
or using footserver
```
footserver &
footclient -a tui-clipboard bash -c '~/tui-clipboard/tui_clipboard.sh'
```
<img width="480" height="270" alt="ScreenShot-2026-07-12_21-45-16" src="https://github.com/user-attachments/assets/32067a48-db3a-4e43-952a-233cc83f9bb4" />


Recomended: kitty (kitty)
```
kitty -1 --class tui-clipboard bash -c '~/tui-clipboard/tui_clipboard_kitty.sh'
```
<img width="480" height="270" alt="ScreenShot-2026-07-12_21-44-44" src="https://github.com/user-attachments/assets/4c088de8-a5ce-43d9-99e0-33c64d7395bc" />


Not recomended: terminals without image support, for example alacritty. Image will render as ASCII art
```
alacritty --class tui-clipboard -e bash -c '~/tui-clipboard/tui_clipboard.sh'
```
<img width="480" height="270" alt="ScreenShot-2026-07-12_21-43-07" src="https://github.com/user-attachments/assets/87217b66-648a-49f4-9c9a-d660490f54ed" />

