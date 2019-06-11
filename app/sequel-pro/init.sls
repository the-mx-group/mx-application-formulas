{% if grains.os in ('MacOS',) %}
caskroom/cask/sequel-pro:
  pkg.installed
{% endif %}
