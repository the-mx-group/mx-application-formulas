{% from tpldir ~ "/map.jinja" import wezterm with context %}

{{ wezterm.package }}:
  {{ wezterm.installer }}

{%- if grains['os_family'] in ('Arch',) %}

ttf-nerd-fonts-symbols-mono:
  pkg.installed

{%- endif %}
