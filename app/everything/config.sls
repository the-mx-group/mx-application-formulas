everything_sane_english_config:
  file.managed:
    - name: C:\Program Files\Everything\Everything.ini
    - source: salt://app/everything/Everything.ini
    - win_perms:
      Administrators:
        perms: full_control
      SYSTEM:
        perms: full_control
      everyone:
        perms: read_execute
    - require:
      - chocolatey: install_everything
