# {% set current_path = salt['environ.get']('PATH', '/bin:/usr/bin') %}
{% set aurtool = { 'name': 'yay', 'pkgname': 'yay-bin' } %}

Packages required by aur tool:
  pkg.installed:
    - pkgs:
      - pacman
      - go
      - git

# Make sure there iss nothing already there:
Remove existing tmp aur build:
  file.absent:
    - name: /tmp/aurbuild


Build AUR tool if not present:
  cmd.run:
    - unless: which {{ aurtool.name }}
    - runas: nobody
    - env:
      - PATH: {{ [current_path, '/usr/bin/core_perl']|join(':') }}
    - name: |
        mkdir -p /tmp/aurbuild/{{ aurtool.pkgname }}
        cd /tmp/aurbuild/{{ aurtool.pkgname }}
        curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h={{ aurtool.pkgname }}
        makepkg PKGBUILD

Install the built {{ aurtool.name }}:
  cmd.run:
    - unless: which {{ aurtool.name }}
    - name: |
        cd /tmp/aurbuild/{{ aurtool.pkgname }}
        pacman -U *.tar.zst --noconfirm --needed


#Clean up after ourselves:
/tmp/aurbuild:
  file.absent

#create a user for aur build tools to run as
aur-builder:
  user.present:
    - createhome: True
    - fullname: User for salt-aur builds

# allow it to sudo with no pwd (else, aur tools won't let us install)
/etc/sudoers.d/aur-builder:
  file.managed:
    - contents: "aur-builder ALL=(root) NOPASSWD: /usr/bin/pacman"
