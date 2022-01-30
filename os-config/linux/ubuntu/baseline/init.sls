Enable ipv6 privacy extensions:
  file.blockreplace:
    - name: /etc/NetworkManager/NetworkManager.conf
    - marker_start: "# START Mx NetworkManager config -DO-NOT-EDIT-"
    - marker_end: "# END Mx NetworkManager config"
    - append_if_not_found: True
    - append_newline: True
    - content: "[connection]\nipv6.ip6-privacy=2"

# Let all interfaces handed off by netplan use MAC
# This avoids issues with cloned VMs having duplicate IDs,
# let alone other issues
Use MAC as DHCP identifier for all netplan ints:
  file.managed:
    - name: /etc/netplan/98-dhcp-use-mac-all.yaml
    - source: salt://os-config/linux/ubuntu/files/98-dhcp-use-mac-all.yaml
    - user: root
    - group: root
    - mode: 0644
    - onlyif:
      - fun: cmd.run
        - dpkg -l | grep netplan.io

{% set user = salt['pillar.get']('users:primary-user') %}
Ensure primary user is in adm group:
  group.present:
    - name: adm
    - addusers:
      - {{ user }}

# Polkit uses this group for admins, since admin group was removed
Ensure primary user is in sudo group:
  group.present:
    - name: sudo
    - addusers:
      - {{ user }}

Install common tools that we want everywhere:
  pkg.installed:
    - pkgs:
      - smartmontools
