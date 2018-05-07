Accept sublime GPG key:
  cmd.run:
    - name: curl https://download.sublimetext.com/sublimehq-pub.gpg > /tmp/sublimehq-pub.gpg && pacman-key --add /tmp/sublimehq-pub.gpg && pacman-key --lsign-key 8A8F901A && rm /tmp/sublimehq-pub.gpg
    - unless: pacman-key -l | grep support@sublimetext.com

Ensure sublime repo is enabled in pacman:
  file.append:
    - name: /etc/pacman.conf
    - text: |
        [sublime-text]
        Server = https://download.sublimetext.com/arch/stable/x86_64

sublime-text-dev:
  pkg.installed

