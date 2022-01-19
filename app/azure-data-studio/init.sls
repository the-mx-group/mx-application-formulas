{% set user = salt['pillar.get']('users:primary-user') %}
{% from "app/azure-data-studio/map.jinja" import azuredatastudio with context %}

{{ azuredatastudio.package }}:
  {{ azuredatastudio.installer }}

{% if (azuredatastudio.installer != 'test.nop') %}
  {% if grains.os not in ('Windows') %} #don't install extensions on windows since we'd need the user pw

Install Agent extension:
  cmd.run:
    - name: {{ azuredatastudio.binary }} --install-extension microsoft.agent
    - runas: {{ user }}
    - unless: {{ azuredatastudio.binary }} --list-extensions | grep -i microsoft.agent


Install import extension:
  cmd.run:
    - name: {{ azuredatastudio.binary }} --install-extension microsoft.import
    - runas: {{ user }}
    - unless: {{ azuredatastudio.binary }} --list-extensions | grep -i microsoft.import


Install profiler extension:
  cmd.run:
    - name: {{ azuredatastudio.binary }} --install-extension microsoft.profiler
    - runas: {{ user }}
    - unless: {{ azuredatastudio.binary }} --list-extensions | grep -i microsoft.profiler


Install server-report extension:
  cmd.run:
    - name: {{ azuredatastudio.binary }} --install-extension microsoft.server-report
    - runas: {{ user }}
    - unless: {{ azuredatastudio.binary }} --list-extensions | grep -i microsoft.server-report



Install whoisactive extension:
  cmd.run:
    - name: {{ azuredatastudio.binary }} --install-extension microsoft.whoisactive
    - runas: {{ user }}
    - unless: {{ azuredatastudio.binary }} --list-extensions | grep -i microsoft.whoisactive

  {% endif %}
{% endif %}
