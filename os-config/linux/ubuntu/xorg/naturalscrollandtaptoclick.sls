xorg-naturalscoll-and-taptoclick:
  file.managed:
    - name: /etc/X11/xorg.conf.d/30-touchpad.conf
    - source: salt://os-config/linux/ubuntu/files/xorg-naturalscroll-and-taptoclick.conf
    - user: root
    - group: root
    - mode: '0644'
