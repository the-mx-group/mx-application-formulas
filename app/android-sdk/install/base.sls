{% set user = salt['pillar.get']('users:primary-user') %}
{% from "app/android-sdk/map.jinja" import android with context %}

{{ android.package }}:
  {{ android.installer }}

{% if android.setSdkOwnership %}

Create group for SDK users and add primary user:
  group.present:
    - name: sdkusers
    - addusers:
      - {{ user }}

Ensure ownership of SDK:
  file.directory:
    - name: {{ android.sdkPath }}
    - group: sdkusers
    - dir_mode: 775
    - recurse:
      - group
      - mode

{% endif %}
