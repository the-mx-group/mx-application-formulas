{% if grains.os in ('MacOS',) %}
caskroom/cask/hex-fiend:
  pkg.installed
{% endif %}
