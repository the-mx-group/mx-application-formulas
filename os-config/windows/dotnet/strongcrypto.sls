dotnet2_strongcrypto_64:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\v2.0.50727
    - vname: SchUseStrongCrypto
    - vdata: 1
    - vtype: REG_DWORD

dotnet2_strongcrypto_32:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\v2.0.50727
    - vname: SchUseStrongCrypto
    - vdata: 1
    - vtype: REG_DWORD
    - use_32bit_registry: True

dotnet4_strongcrypto_64:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\v4.0.30319
    - vname: SchUseStrongCrypto
    - vdata: 1
    - vtype: REG_DWORD

dotnet4_strongcrypto_32:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\v4.0.30319
    - vname: SchUseStrongCrypto
    - vdata: 1
    - vtype: REG_DWORD
    - use_32bit_registry: True
