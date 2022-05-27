{% from tpldir ~ "/map.jinja" import rdm with context %}

{{ rdm.package }}:
  {{ rdm.installer }}
