{% if grains.os in ('MacOS',) %}
Caskroom/cask/sequel-pro:
  pkg.installed
{% endif %}
