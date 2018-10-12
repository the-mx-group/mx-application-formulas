{% if not salt['file.directory_exists']('c:\ProgramData\chocolatey') %}

Run chocolatey bootstrap if choco is not installed:
  module.run:
    - name: chocolatey.bootstrap

{% endif %}
