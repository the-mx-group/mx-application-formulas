{% if grains.os in ('MacOS',) %}
Caskroom/cask/parallels-desktop:
  pkg.installed
{% endif %}
