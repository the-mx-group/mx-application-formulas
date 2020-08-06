{% if grains.os in ('Windows',) %}
include:
  - .install
  - .config

{% endif %}
