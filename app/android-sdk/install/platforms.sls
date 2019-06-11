{% set user = salt['pillar.get']('users:primary-user') %}
{% from "app/android-sdk/map.jinja" import android with context %}

Install Android platform-tools:
  cmd.run:
    - name: {{ android.sdkPath }}/tools/bin/sdkmanager "platform-tools"
    - runas: {{ user }}
    - creates: {{ android.sdkPath }}/platform-tools
    - onlyif: test -d {{ android.sdkPath }}


Install Android Nougat platform:
  cmd.run:
    - name: {{ android.sdkPath }}/tools/bin/sdkmanager 'platforms;android-25'
    - runas: {{ user }}
    - creates: {{ android.sdkPath }}/platforms/android-25
    - onlyif: test -d {{ android.sdkPath }}

Install Android Lollipop platform:
  cmd.run:
    - name: {{ android.sdkPath }}/tools/bin/sdkmanager 'platforms;android-21'
    - runas: {{ user }}
    - creates: {{ android.sdkPath }}/platforms/android-21
    - onlyif: test -d {{ android.sdkPath }}
