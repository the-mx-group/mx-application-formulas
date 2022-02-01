{% from "app/tightvnc-viewer/map.jinja" import tightvncviewer with context %}

{{ tightvncviewer.package }}:
  {{ tightvncviewer.installer }}
