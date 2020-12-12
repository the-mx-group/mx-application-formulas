explorer_expandtocurrentfolder_defaultuser:
  reg.present:
    - name: HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
    - vname: NavPaneExpandToCurrentFolder
    - vdata: 1
    - vtype: REG_DWORD

explorer_opentothispc_defaultuser:
  reg.present:
    - name: HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
    - vname: LaunchTo
    - vdata: 1
    - vtype: REG_DWORD

explorer_showontaskbarwherewindowisopen_defaultuser:
  reg.present:
    - name: HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
    - vname: MMTaskbarMode
    - vdata: 2
    - vtype: REG_DWORD

explorer_showhiddenfiles_defaultuser:
  reg.present:
    - name: HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
    - vname: Hidden
    - vdata: 1
    - vtype: REG_DWORD

explorer_showfileextensions_defaultuser:
  reg.present:
    - name: HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
    - vname: HideFileExt
    - vdata: 0
    - vtype: REG_DWORD
