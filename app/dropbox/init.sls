{% from "app/dropbox/map.jinja" import dropbox with context %}

{{ dropbox.package }}:
  {{ dropbox.installer }}
