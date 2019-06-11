{% set user = salt['pillar.get']('users:primary-user') %}
{% set userinfo = salt['user.info'](user) %}
{% from "app/android-sdk/map.jinja" import android with context %}

Install Android build tools:
  cmd.run:
    - name: {{ android.sdkPath }}/tools/bin/sdkmanager 'build-tools;27.0.1'
    - runas: {{ user }}
    - creates: {{ android.sdkPath }}/build-tools/27.0.1
    - onlyif: test -d {{ android.sdkPath }}

Add android build tools to primary user mx profile:
  file.append:
    - text: |
        #Android build tools 27.0.1
        export PATH=$PATH:{{ android.sdkPath}}/build-tools/27.0.1
    - name: {{ userinfo.home }}/.mx_profile
