# {% set current_path = salt['environ.get']('PATH', '/bin:/usr/bin') %}

Packages required by pacaur:
  pkg.installed:
    - pkgs:
      - expac
      - yajl
      - git

# Make sure there iss nothing already there:
Remove existing tmp pacaur:
  file.absent:
    - name: /tmp/pacaur


Build cower if not present:
  cmd.run:
    - unless: which cower
    - runas: nobody
    - env:
      - PATH: {{ [current_path, '/usr/bin/core_perl']|join(':') }}
    - name: |
        mkdir -p /tmp/pacaur/cower
        cd /tmp/pacaur/cower
        curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
        makepkg PKGBUILD --skippgpcheck

Install the built cower:
  cmd.run:
    - unless: which cower
    - name: |
        cd /tmp/pacaur/cower
        pacman -U *.tar.xz --noconfirm --needed


Build pacaur if not present:
  cmd.run:
    - unless: which pacaur
    - runas: nobody
    - env:
      - PATH: {{ [current_path, '/usr/bin/core_perl']|join(':') }}
    - name: |
        mkdir -p /tmp/pacaur/pacaur
        cd /tmp/pacaur/pacaur
        curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
        makepkg PKGBUILD

Install the built pacaur:
  cmd.run:
    - unless: which pacaur
    - name: |
        cd /tmp/pacaur/pacaur
        pacman -U *.tar.xz --noconfirm --needed


#Clean up after ourselves:
/tmp/pacaur:
  file.absent

#create a user for pacaur to run as
pacaur-builder:
  user.present:
    - createhome: True
    - fullname: User for salt-pacaur builds

# allow it to sudo with no pwd (else, pacaur won't let us install)
/etc/sudoers.d/pacaur-builder:
  file.managed:
    - contents: "pacaur-builder ALL=(root) NOPASSWD: /usr/bin/pacman"
