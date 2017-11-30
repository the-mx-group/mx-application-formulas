{% set user = salt['pillar.get']('users:primary-user') %}
{% from "app/android-sdk/map.jinja" import android with context %}

Install Android Nougat platform:
  cmd.run:
    - name: yes | {{ android.sdkPath }}/tools/bin/sdkmanager "platforms;android-25"
    - runas: {{ user }}

Install Android Lollipop platform:
  cmd.run:
    - name: yes | {{ android.sdkPath }}/tools/bin/sdkmanager "platforms;android-21"
    - runas: {{ user }}
