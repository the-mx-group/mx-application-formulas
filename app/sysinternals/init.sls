{% if grains.os in ('Windows',) %}

install_sysinternals:
  chocolatey.installed:
    - name: sysinternals

{% endif %}
