{% if grains.os in ('Windows',) %}

install-wiztree:
  chocolatey.installed:
    - name: wiztree

{% endif %}
