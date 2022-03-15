# Let all interfaces handed off by netplan use MAC
# This avoids issues with cloned VMs having duplicate IDs,
# let alone
Use MAC as DHCP identifier for all netplan ints:
  file.managed:
    - name: /etc/netplan/98-dhcp-use-mac-all.yaml
    - source: salt://os-config/linux/ubuntu/files/98-dhcp-use-mac-all.yaml
    - user: root
    - group: root
    - mode: 0644
    - onlyif:
      - dpkg -l | grep netplan.io
