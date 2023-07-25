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
      #- alacritty # argh, not available on ubuntu
      - thunar
      - thunar-volman
      - tmux
      - waybar
      - xdg-user-dirs
      - xwayland # sadly
