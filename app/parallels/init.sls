{% if grains.os in ('MacOS',) %}
caskroom/cask/parallels:
  pkg.installed
{% endif %}
