{% set user = salt['pillar.get']('users:primary-user') %}
{% from "app/android-sdk/map.jinja" import android with context %}

Install Android emulator:
  cmd.run:
    - name: yes | {{ android.sdkPath }}/tools/bin/sdkmanager emulator
    - runas: {{ user }}
    - creates: {{ android.sdkPath }}/emulator

Ensure users avd directory exists:
  file.directory:
    - name: {{ userInfo.home }}/.android/avd
    - user: {{ user }}
    - group: sdkusers

Create symlink to emulator which appears to be required:
  file.symlink:
    - name: {{ userInfo.home}}/.android/avd/emulator
    - target: {{ android.sdkPath }}/emulator
