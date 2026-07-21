# Fast and simple clipboard manager in terminal

<img width="640" height="360" alt="ScreenShot-2026-07-21_20-13-56" src="https://github.com/user-attachments/assets/51b493d3-0eaf-4d4b-a6d9-5e40bf41a9a7" />
<img width="640" height="360" alt="ScreenShot-2026-07-21_20-14-18" src="https://github.com/user-attachments/assets/7e454f75-5299-4876-ae9f-d7ade8434c5a" />


**Two lists:**
```
On the left       |  On the right
is the cliphist   |  is additional information.
history itself    |  Images, long text
```
Both lists can be scrolled. The left one is `searchable` (just start typing).

Works with every terminal. Shows pictures using chafa in **Kitty, Sixel, ASCII, iTerm2**, etc. Has syntax highlighting.

**Editor** - Press ctrl+a to open the editor where you can edit the text to be saved.

https://github.com/user-attachments/assets/e0b963c7-7ce4-40b5-badc-1e3d016c5d69

Make sure you add EDITOR to your ~/.zshsc, ~/.bashrc, etc
```
export EDITOR="nvim"
export VISUAL="nvim"
```
In the left list, ` Image 1920x1080` is highlighted in pink, and `links` are highlighted in blue.

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

*or just download the file and use it like a script*


# Usage
```
tuicl
```
*or just run the script:*
```
./tui_clipboard.sh
```
Press `ctrl+h` to open `help menu`

<img width="640" height="360" alt="image" src="https://github.com/user-attachments/assets/3809a3be-8a86-469b-8b89-09a448019372" />


# Private Mode

*In private mode, copied text is not saved to cliphist. This can be useful when copying passwords, for example. See [README_PrivateMode.md](private-mode/README_PrivateMode.md).*
