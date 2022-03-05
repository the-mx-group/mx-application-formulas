{% if grains.os in ('Windows',) %}

VisualStudio2022Professional:
  chocolatey.installed

{% endif %}
