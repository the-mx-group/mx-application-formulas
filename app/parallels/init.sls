{% if grains.os in ('MacOS',) %}
homebrew/cask/parallels:
  pkg.installed
{% endif %}
