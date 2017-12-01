{% set user = salt['pillar.get']('users:primary-user') %}
{% from "app/android-sdk/map.jinja" import android with context %}

Install Android emulator:
  cmd.run:
    - name: yes | {{ android.sdkPath }}/tools/bin/sdkmanager emulator
    - runas: {{ user }}
    - creates: {{ android.sdkPath }}/emulator
