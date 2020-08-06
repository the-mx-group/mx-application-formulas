{% if grains.os in ('Windows',) %}

install-winmerge:
  chocolatey.installed:
    - name: winmerge

{% endif %}
