enable_telnet:
  cmd.run:
    - name: Enable-WindowsOptionalFeature -Online -Featurename TelnetClient
    - shell: powershell
    - unless:
      - fun: cmd.run
        shell: powershell
        args:
          - '(Get-WindowsOptionalFeature -Online -FeatureName TelnetClient).State | Select-String -Pattern Enabled'
