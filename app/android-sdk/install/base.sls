{% set user = salt['pillar.get']('users:primary-user') %}
{% from "app/android-sdk/map.jinja" import android with context %}

{{ android.package }}:
  {{ android.installer }}

{% if android.setSdkOwnership %}

Create group for Android SDK users and add primary user:
  group.present:
    - name: sdkusers
    - addusers:
      - {{ user }}

Ensure ownership of Android SDK:
  file.directory:
    - name: {{ android.sdkPath }}
    - group: sdkusers
    - dir_mode: 2775
    - recurse:
      - group
      - mode
      - ignore_files

{% endif %}


Accept SDK manager licenses:
  cmd.run:
    - name: yes | {{ android.sdkPath }}/tools/bin/sdkmanager --licenses
    - runas: {{ user }}
    - creates: {{ android.sdkPath }}/licenses/android-sdk-license
    - onlyif: test -d {{ android.sdkPath }}
