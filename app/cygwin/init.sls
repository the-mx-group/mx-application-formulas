{% if grains.os in ('Windows',) %}

install_cygwin:
  chocolatey.installed:
    - name: cygwin
    - package_args: '/InstallDir:C:\cygwin64'

cygwin_fstab:
  file.managed:
    - name: C:\cygwin64\etc\fstab
    - source: salt://app/cygwin/fstab
    - require:
      - chocolatey: install_cygwin

{% endif %}
