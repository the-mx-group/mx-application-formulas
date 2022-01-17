{% if grains.os in ('Windows',) %}

install-rvtools:
  chocolatey.installed:
    - name: rvtools

{% endif %}
