{% if grains.os in ('Windows',) %}

install-urlrewrite:
  chocolatey.installed:
    - name: urlrewrite

{% endif %}
