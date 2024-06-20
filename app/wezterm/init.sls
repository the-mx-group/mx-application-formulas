{% from tpldir ~ "/map.jinja" import wezterm with context %}

{% if grains.os in ('Windows',) %}

{%- for package in wezterm.pkgs %}
{{ package }}:
  {{ wezterm.installer }}
{%- endfor %}

{% else %}
Install wezterm packages:
  {{ wezterm.installer }}
{% endif %}
