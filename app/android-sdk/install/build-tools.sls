{% set user = salt['pillar.get']('users:primary-user') %}
{% from "app/android-sdk/map.jinja" import android with context %}

Install Android build tools:
  cmd.run:
    - name: yes | {{ android.sdkPath }}/tools/bin/sdkmanager "build-tools;27.0.1"
    - runas: {{ user }}
    - creates: {{ android.sdkPath }}/build-tools/27.0.1

Append build tools to users profile:
  file.append:
    - text: |
        #Android build tools 27.0.1
        export PATH=$PATH:{{ android.sdkPath}}/build-tools/27.0.1
    - name: /Users/{{ user }}/.mx_profile
