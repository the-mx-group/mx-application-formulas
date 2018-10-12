{% if not salt['file.directory_exists']('c:\ProgramData\chocolatey') %}

Run chocolatey bootstrap if choco is not installed:
  chocolatey.bootstrap

{% endif %}
