# Fast and simple clipboard manager in terminal

<img width="960" height="540" alt="ScreenShot-2026-07-12_21-36-19" src="https://github.com/user-attachments/assets/bd4fd718-bd02-4b0e-9428-77ed01696911" />

Works with every terminal. Shows pictures using chafa in Kitty, Sixel, ASCII, iTerm2, etc.

This script works on Wayland. To save clipboard contents to `cliphist`, add these commands to your Wayland compositor's autostart configuration:

```
wl-paste --type text --watch cliphist store
wl-paste --type image --watch cliphist store
```

The exact autostart syntax depends on your compositor. Both commands must remain running in the background while your Wayland session is active.

The image icon in the clipboard list requires a [Nerd Font](https://www.nerdfonts.com/). Without one, it may be displayed as an empty square.

# Dependencies
```
chafa
bat
fzf
cliphist
wl-clipboard
file
sed
bash
```
**Arch**
```
sudo pacman -S bash cliphist fzf wl-clipboard file bat chafa
```
**Void**
```
sudo xbps-install -S bash cliphist fzf wl-clipboard file bat chafa
```
**Other distros** - should be the same

# Install
```
git clone https://github.com/rywby-dot/tui-clipboard.git
cd tui-clipboard
make install
```
**Make sure `~/.local/bin` is included in your `PATH`.**
**Add**
```
export PATH="$HOME/.local/bin:$PATH"
```
**to your ~/.zshrc, ~/.bashrc etc.**

Uninstall:
```
make uninstall
```

or just download the file and use it like a script


# Usage
```
tuicl
```
or just run the script
```
./tui_clipboard.sh
```

# Private Mode

*In private mode, copied text is not saved to cliphist. This can be useful when copying passwords, for example. See [README_PrivateMode.md](private-mode/README_PrivateMode.md).*


# Usage pt2

Recommended: foot (Sixel)
```
foot -a tui-clipboard bash -c '/path/to/tui-clipboard/tui_clipboard.sh'
```
or using footserver
```
footserver &
footclient -a tui-clipboard bash -c '/path/to/tui-clipboard/tui_clipboard.sh'
```
<img width="480" height="270" alt="ScreenShot-2026-07-12_21-45-16" src="https://github.com/user-attachments/assets/32067a48-db3a-4e43-952a-233cc83f9bb4" />


Recommended: Kitty (Kitty)
```
kitty -1 --class tui-clipboard bash -c '/path/to/tui-clipboard/tui_clipboard.sh'
```
<img width="480" height="270" alt="ScreenShot-2026-07-12_21-44-44" src="https://github.com/user-attachments/assets/4c088de8-a5ce-43d9-99e0-33c64d7395bc" />


Not recommended: terminals without image support, for example Alacritty. Images will render as ASCII art.
```
alacritty --class tui-clipboard -e bash -c '/path/to/tui-clipboard/tui_clipboard.sh'
```
<img width="480" height="270" alt="ScreenShot-2026-07-12_21-43-07" src="https://github.com/user-attachments/assets/87217b66-648a-49f4-9c9a-d660490f54ed" />
