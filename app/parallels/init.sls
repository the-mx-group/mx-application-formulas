{% if grains.os in ('MacOS',) %}
Caskroom/cask/parallels:
  pkg.installed
{% endif %}
