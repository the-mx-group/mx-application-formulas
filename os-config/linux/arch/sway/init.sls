Install sway and related tools:
  pkg.installed:
    - pkgs:
      - sway
      - gnome-keyring
      - grim
      - i3status
      - libsecret
      - lightdm
      - lightdm-webkit-theme-litarvan
      - mako
      - pavucontrol
      - ranger
      - rofi
      - slurp
      - swayidle
      - swaylock
      - termite
      - termite-terminfo
      - tmux
      - waybar

Set webkit greeter for lightdm:
  ini.options_present:
    - name: /etc/lightdm/lightdm.conf
    - sections:
      - LightDM:
        - greeter-session: lightdm-webkit2-greeter

Set litarvan theme for webkit lightdm:
  ini.options_present:
    - name: /etc/lightdm/lightdm-webkit.conf
    - sections:
      - greeter:
        - webkit_theme: litarvan

