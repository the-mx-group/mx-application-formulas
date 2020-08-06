{% if grains.os in ('Windows',) %}

install-notepadplusplus:
  chocolatey.installed:
    - name: notepadplusplus.install

{% endif %}
