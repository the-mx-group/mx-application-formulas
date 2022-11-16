Install sway and related tools:
  pkg.installed:
    - pkgs:
      - sway
      - gnome-keyring
      - grim
      - i3status
      - libsecret
      - mako
      - pavucontrol
      - pipewire # newer audio/video sharing subsystem
      - pipewire-pulse # replaces pulseaudio
      - ranger
      - rofi
      - sddm
      - slurp
      - swayidle
      - swaylock
      - alacritty
      - thunar
      - thunar-volman
      - tmux
      - waybar
      - xdg-user-dirs
      - xorg-xwayland # sadly

set-sddm-theme:
  file.managed:
    - name: /etc/sddm.conf.d/theme.conf
    - contents: |
        [Theme]
        Current=maldives

enable-sddm-service:
  service.running:
    - name: sddm
    - enable: True
    - watch:
      - file: set-sddm-theme
