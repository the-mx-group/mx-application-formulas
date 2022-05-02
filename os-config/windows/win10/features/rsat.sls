{% if "Server" in grains.osfullname %}
enable_rsat:
  cmd.run:
    - name: Get-WindowsOptionalFeature -Online |? {$_.Name -like "*RSAT*" -and $_.State -eq "Disabled"} | Enable-WindowsOptionalFeature -Online
    - shell: powershell
    - unless: # This requires >= 3001
      - fun: cmd.run
        shell: powershell
        args:
          - 'Get-WindowsOptionalFeature -Online |? {$_.Name -like "*RSAT*" -and $_.State -eq "Disabled"} | Select-String -Pattern Disabled'
{% else %}
enable_rsat:
  cmd.run:
    - name: Get-WindowsCapability -Online |? {$_.Name -like "*RSAT*" -and $_.State -eq "NotPresent"} | Add-WindowsCapability -Online
    - shell: powershell
    - unless: # This requires >= 3001
      - fun: cmd.run
        shell: powershell
        args:
          - 'Get-WindowsCapability -Online |? {$_.Name -like "*RSAT*" -and $_.State -eq "NotPresent"} | Select-String -Pattern NotPresent'
{% endif %}
