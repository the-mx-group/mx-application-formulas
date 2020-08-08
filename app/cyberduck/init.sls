{% if grains.os in ('Windows','MacOS') %}

{% from "app/cyberduck/map.jinja" import cyberduck with context %}

{{ cyberduck.package }}:
  {{ cyberduck.installer }}

{% endif %}
