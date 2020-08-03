{% if grains.os in ('Windows',) %}

install-grepwin:
  chocolatey.installed:
    - name: wiztree

{% endif %}
