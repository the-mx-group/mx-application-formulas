{% if grains.os in ('MacOS',) %}
homebrew/cask/hex-fiend:
  pkg.installed
{% endif %}
