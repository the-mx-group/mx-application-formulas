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
      - efibootmgr
      - efivar
      - fwupd
      - intel-ucode
      - smartmontools
      - wget
