enable_photoviewer:
  module.run:
    - name: reg.import_file
    - source: salt://app/os-config/windows/win10/files/photoviewer.reg
    - unless:
      - fun: reg.value_exists
        hive: HKCR
        key: Applications\photoviewer.dll\shell\open
        vname: MuiVerb
