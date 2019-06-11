{% set user = salt['pillar.get']('users:primary-user') %}
{% set userInfo = salt['user.info'](user) %}
{% from "app/android-sdk/map.jinja" import android with context %}

Install Android emulator:
  cmd.run:
    - name: {{ android.sdkPath }}/tools/bin/sdkmanager emulator
    - runas: {{ user }}
    - creates: {{ android.sdkPath }}/emulator
    - onlyif: test -d {{ android.sdkPath }}

Ensure users avd directory exists:
  file.directory:
    - name: {{ userInfo.home }}/.android/avd
    - user: {{ user }}
    - group: sdkusers

Create symlink to emulator which appears to be required:
  file.symlink:
    - name: {{ userInfo.home}}/.android/avd/emulator
    - target: {{ android.sdkPath }}/emulator

Add android emulator to primary user mx profile:
  file.append:
    - text: |
        export PATH=$PATH:{{ android.sdkPath }}/emulator
    - name: {{ userinfo.home }}/.mx_profile
