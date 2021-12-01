Install OS baseline:
  pkg.installed:
    - name: base

Install Devel headers:
  pkg.group_installed:
    - name: base-devel

Install common items that used to be part of base group:
  pkg.installed:
    - pkgs:
      - device-mapper
      - dhcpcd
      - e2fsprogs
      - inetutils
      - less
      - linux
      - linux-firmware
      - logrotate
      - man-db
      - man-pages
      - nano
      - netctl
      - sysfsutils
      - usbutils
      - which


Install baseline tools for management:
  pkg.installed:
    - pkgs:
      - salt
      - networkmanager
      - linux-headers
      - pkgfile
      - reflector
      - pacman-contrib

Enable ipv6 privacy extensions:
  file.blockreplace:
    - name: /etc/NetworkManager/NetworkManager.conf
    - marker_start: "# START Mx NetworkManager config -DO-NOT-EDIT-"
    - marker_end: "# END Mx NetworkManager config"
    - append_if_not_found: True
    - append_newline: True
    - content: "[connection]\nipv6.ip6-privacy=2"

{% set user = salt['pillar.get']('users:primary-user') %}
Ensure primary user is in adm group:
  group.present:
    - name: adm
    - addusers:
      - {{ user }}

Install common tools that we want everywhere:
  pkg.installed:
    - pkgs:
      - amd-ucode
      - btrfs-progs
      - efibootmgr
      - efivar
      - fwupd
      - gptfdisk
      - intel-ucode
      - parted
      - smartmontools
      - unzip
      - wget
