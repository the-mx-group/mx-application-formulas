{% if grains.os in ('Windows',) %}

install-rapidee:
  chocolatey.installed:
    - name: rapidee
    - package_args: '/NoShortcut'

{% endif %}
