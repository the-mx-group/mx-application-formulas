Install sway and related tools:
  pkg.installed:
    - pkgs:
      - sway
      - gnome-keyring
      - grim
      - i3status
      - mako-notifier
      - pavucontrol
      - pipewire # newer audio/video sharing subsystem
      - pipewire-pulse # replaces pulseaudio
      - ranger
      - rofi
      - slurp
      - swayidle
      - swaylock
      - thunar
      - thunar-volman
      - tmux
      - waybar
      - xdg-user-dirs
      - xwayland # sadly

Install Alacritty PPA:
  pkgrepo.managed:
    - ppa: aslatter/ppa

Install Alacritty:
  pkg.latest:
    - name: alacritty
    - refresh: True
