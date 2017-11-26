{% if grains.os in ('MacOS',) %}
Caskroom/cask/meld:
  pkg.installed
{% endif %}
