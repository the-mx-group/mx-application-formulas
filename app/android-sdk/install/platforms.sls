{% set user = salt['pillar.get']('users:primary-user') %}
{% from "app/android-sdk/map.jinja" import android with context %}

Install Nougat:
  cmd.run:
    - name: yes | {{ android.sdkPath }}/tools/bin/sdkmanager sdkmanager "platforms;android-25"
    - runas: {{ user }}

Install Lollipop:
  cmd.run:
    - name: yes | {{ android.sdkPath }}/tools/bin/sdkmanager sdkmanager "platforms;android-21"
    - runas: {{ user }}
