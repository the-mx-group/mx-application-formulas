{% from "app/vlc/map.jinja" import vlc with context %}

{{ vlc.package }}:
  {{ vlc.installer }}
