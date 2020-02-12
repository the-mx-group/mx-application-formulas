Install sway and related tools:
  pkg.installed:
    - pkgs:
      - sway
      - gnome-keyring
      - grim
      - i3status
      - libsecret
      - lightdm
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
      - xorg-server # for lightdm

install-luminosity-theme:
  git.cloned:
    - name: https://github.com/rda0/web-greeter-theme-luminosity.git
    - target: /usr/share/lightdm-webkit/themes/luminosity

configure-luminosity-theme:
  file.managed:
    - name: /usr/share/lightdm-webkit/themes/luminosity/config.json
    - source: salt://{{slspath}}/luminosity-config.json

set-lightdm-greeter:
  ini.options_present:
    - name: /etc/lightdm/lightdm.conf
    - sections:
        Seat:*:
          greeter-session: lightdm-webkit2-greeter
          greeter-show-manual-login: true

set-lightdm-theme:
  ini.options_present:
    - name: /etc/lightdm/lightdm-webkit2-greeter.conf
    - sections:
        greeter:
          webkit_theme: luminosity

Enable lightdm login:
  service.running:
    - name: lightdm
    - enable: True
    - watch:
      - git: install-luminosity-theme
      - ini: set-lightdm-theme
      - ini: set-lightdm-greeter
