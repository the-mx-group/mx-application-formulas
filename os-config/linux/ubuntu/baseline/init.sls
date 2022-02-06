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
