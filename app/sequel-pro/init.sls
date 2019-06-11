{% if grains.os in ('MacOS',) %}
homebrew/cask/sequel-pro:
  pkg.installed
{% endif %}
