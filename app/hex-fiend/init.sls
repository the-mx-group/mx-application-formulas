{% if grains.os in ('MacOS',) %}
Caskroom/cask/hex-fiend:
  pkg.installed
{% endif %}
