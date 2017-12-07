{% set user = salt['pillar.get']('users:primary-user') %}
{% set userinfo = salt['user.info'](user) %}
{% from "app/android-sdk/map.jinja" import android with context %}

Install Android build tools:
  cmd.run:
    - name: yes | {{ android.sdkPath }}/tools/bin/sdkmanager "build-tools;27.0.1"
    - runas: {{ user }}
    - creates: {{ android.sdkPath }}/build-tools/27.0.1

Ensure primary user bash_profile exists:
  file.managed:
    - name: {{ userinfo.home }}/.mx_profile
    - user: {{ user }}
    - replace: false

Add nvm to primary user bash_profile:
  file.append:
    - text: |
        #Android build tools 27.0.1
        export PATH=$PATH:{{ android.sdkPath}}/build-tools/27.0.1
    - name: {{ userinfo.home }}/.mx_profile
