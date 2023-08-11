Install i3 and related tools:
  pkg.installed:
    - pkgs:
      - i3 # metapackage
      - i3status
      - i3lock
      - i3blocks
      - gnome-keyring
      - mako-notifier
      - pavucontrol
      - pipewire # newer audio/video sharing subsystem
      - pipewire-pulse # replaces pulseaudio
      - rofi
      - scrot # screenshots
      - xclip # screenshots
      - thunar
      - thunar-volman
      - xdg-user-dirs

Install Alacritty PPA:
  pkgrepo.managed:
    - ppa: aslatter/ppa

Install Alacritty:
  pkg.latest:
    - name: alacritty
    - refresh: True
