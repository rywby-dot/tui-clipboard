# Private mode

 **! This is not necessarily function. You can NOT use it**

*In private mode text that you copy is NOT saving in cliphist. So you can copy passwords for example*

```
chmod +x private-mode/clipboard_script.sh
chmod +x private-mode/clipboard_switcher.sh
```

# Usage:

Run clipboard_script.sh when you start wl-paste in the autostart section in your wm
```
[autostart]
wl-paste --type text --watch ~/.config/driftwm/clipboard_script.sh
wl-paste --type image --watch ~/.config/driftwm/clipboard_script.sh
```

Run clipboard_switcher.sh to turn ON/OFF private mode
```
~/clipboard/private-mode/clipboard_switcher.sh
```
