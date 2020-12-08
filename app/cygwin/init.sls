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

# Example state
#install_rsync:
#  cyg.installed:
#    - name: rsync
#    - mirrors: {{ cygwin.mirrors }}

# Use a pillar like below to specify mirrors to avoid timeouts
# It will try to pull from each mirror, limit to 1 to shorten execution
#cygwin:
#  mirrors:
#    - 'http://mirrors.kernel.org/sourceware/cygwin': ""
#    - 'http://mirror.steadfast.net/cygwin': ""
#    - 'http://mirror.cs.vt.edu/pub/cygwin/cygwin': ""
#    - 'http://cygwin.osuosl.org': ""

{% endif %}
