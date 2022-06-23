{% if "Server" in grains.osfullname %}
enable_rsat:
  cmd.run:
    - name: Get-WindowsFeature |? {$_.Name -like "*RSAT*" -and $_.InstallState -eq "Available"} | Install-WindowsFeature
    - shell: powershell
    - unless: if ('Get-WindowsFeature |? {$_.Name -like "*RSAT*" -and $_.InstallState -eq "Available"} | Select-String -Pattern Available')
       { Exit(0) } else { Exit(1) }
{% else %}
enable_rsat:
  cmd.run:
    - name: Get-WindowsCapability -Online |? {$_.Name -like "*RSAT*" -and $_.State -eq "NotPresent"} | Add-WindowsCapability -Online
    - shell: powershell
    - unless: if ('Get-WindowsCapability -Online |? {$_.Name -like "*RSAT*" -and $_.State -eq "NotPresent"} | Select-String -Pattern NotPresent')
       { Exit(0) } else { Exit(1) }
{% endif %}
