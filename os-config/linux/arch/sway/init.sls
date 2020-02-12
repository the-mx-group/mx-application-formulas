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
      - ranger
      - rofi
      - sddm
      - slurp
      - swayidle
      - swaylock
      - termite
      - termite-terminfo
      - tmux
      - waybar

configure-sddm-theme:
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
