sudo apt install labwc alacritty -y
cat << 'EOF' > ~/.config/labwc/rc.xml
<?xml version="1.0" encoding="utf-8"?>
<labwc_config>
  <keyboard>
    <keybind key="C-S-q">
      <action name="Kill" />
    </keybind>
  </keyboard>
  <windowRules>
    <windowRule identifier="*" matchOnce="true" serverDecoration="no">
      <action name="ToggleAlwaysOnBottom" />
      <action name="ToggleFullscreen" />
    </windowRule>
  </windowRules>
</labwc_config>
EOF
cat << 'EOF' | sudo tee /usr/bin/gui
#!/bin/sh
labwc -S alacritty > /dev/null 2>&1
EOF
sudo chmod +x /usr/bin/gui
