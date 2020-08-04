{% if grains.os in ('Windows',) %}

install_sysinternals:
  chocolatey.upgraded:
    - name: sysinternals

{% endif %}
