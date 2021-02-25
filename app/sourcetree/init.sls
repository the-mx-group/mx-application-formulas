{% from tpldir ~ "/map.jinja" import sourcetree with context %}

{% if grains.os in ('Windows',) %}

{%- for package in sourcetree.pkgs %}
{{ package }}:
  {{ sourcetree.installer }}
{%- endfor %}

{% else %}
Install Sourcetree packages:
  {{ sourcetree.installer }}
{% endif %}
