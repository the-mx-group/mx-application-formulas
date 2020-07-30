{% from tpldir ~ "/map.jinja" import rdm with context %}

{{ rdm.package }}:
  {{ rdm.installer }}


{% if grains.os in ('Windows',) %}

pin RDM to the correct version on Windows:
  cmd.exec:
    - name: choco pin --name rdm --version {{ rdm.installer.chocolatey.installed.version }}
    - unless:
      - fun: cmdmod.powershell
        shell: powershell
        args:
          - choco pin list -n rdm | Select-String -Pattern rdm

{% endif %}
