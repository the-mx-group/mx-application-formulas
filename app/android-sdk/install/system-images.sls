{% set user = salt['pillar.get']('users:primary-user') %}
{% from "app/android-sdk/map.jinja" import android with context %}

Install Android Nougat system image:
  cmd.run:
    - name: yes | {{ android.sdkPath }}/tools/bin/sdkmanager "system-images;android-25;google_apis;x86_64"
    - runas: {{ user }}

Install Android Lollipop system image:
  cmd.run:
    - name: yes | {{ android.sdkPath }}/tools/bin/sdkmanager "system-images;android-21;google_apis;x86_64"
    - runas: {{ user }}
