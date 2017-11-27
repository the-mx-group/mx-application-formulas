{% from "app/microsoft-remote-desktop/map.jinja" import rdp with context %}

{{ rdp.package }}:
  {{ rdp.installer }}
