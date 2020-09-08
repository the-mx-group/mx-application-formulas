{% if grains.os in ('Windows',) %}

sql-server-management-studio:
  chocolatey.installed

{% endif %}
