{% from "app/wireshark/map.jinja" import wireshark with context %}

{{ wireshark.package }}:
  {{ wireshark.installer }}
