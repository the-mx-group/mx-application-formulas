{% from "app/microsoft-remote-desktop/map.jinja" import microsoft-remote-desktop with context %}

{{ microsoft-remote-desktop.package }}:
  {{ microsoft-remote-desktop.installer }}
