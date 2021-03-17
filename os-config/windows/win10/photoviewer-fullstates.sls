photoviewer_reg_01:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open
    - vname: MuiVerb
    - vdata: '@photoviewer.dll,-3043'
    - vtype: REG_SZ

photoviewer_reg_02:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\Software\Classes\Applications\photoviewer.dll\shell\open\command
    - vdata: '%SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %1'
    - vtype: REG_EXPAND_SZ

photoviewer_reg_03:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open\DropTarget
    - vname: Clsid
    - vdata: '{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}'
    - vtype: REG_SZ

photoviewer_reg_04:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Bitmap
    - vname: ImageOptionFlags
    - vdata: 1
    - vtype: REG_DWORD

photoviewer_reg_05:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Bitmap
    - vname: FriendlyTypeName
    - vdata: '@%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll,-3056'
    - vtype: REG_EXPAND_SZ

photoviewer_reg_06:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Bitmap\DefaultIcon
    - vdata: '%SystemRoot%\\System32\\imageres.dll,-70'
    - vtype: REG_SZ

photoviewer_reg_07:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Bitmap\shell\open\command
    - vdata: '%SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %1'
    - vtype: REG_EXPAND_SZ

photoviewer_reg_08:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Bitmap\shell\open\DropTarget
    - vname: Clsid
    - vdata: '{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}'
    - vtype: REG_SZ

photoviewer_reg_09:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print
    - vname: NeverDefault
    - vtype: REG_SZ

photoviewer_reg_10:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print\command
    - vdata: '%SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %1'
    - vtype: REG_EXPAND_SZ

photoviewer_reg_11:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print\DropTarget
    - vname: Clsid
    - vdata: '{60fd46de-f830-4894-a628-6fa81bc0190d}'
    - vtype: REG_SZ

photoviewer_reg_12:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.JFIF
    - vname: EditFlags
    - vdata: 65536
    - vtype: REG_DWORD

photoviewer_reg_13:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.JFIF
    - vname: ImageOptionFlags
    - vdata: 1
    - vtype: REG_DWORD

photoviewer_reg_14:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.JFIF
    - vname: FriendlyTypeName
    - vdata: '@%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll,-3055'
    - vtype: REG_EXPAND_SZ

photoviewer_reg_15:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.JFIF\DefaultIcon
    - vdata: '%SystemRoot%\\System32\\imageres.dll,-72'
    - vtype: REG_SZ

photoviewer_reg_16:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.JFIF\shell\open
    - vname: MuiVerb
    - vdata: '@%ProgramFiles%\Windows Photo Viewer\photoviewer.dll,-3043'
    - vtype: REG_EXPAND_SZ

photoviewer_reg_17:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.JFIF\shell\open\command
    - vdata: '%SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %1'
    - vtype: REG_EXPAND_SZ

photoviewer_reg_18:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.JFIF\shell\open\DropTarget
    - vname: Clsid
    - vdata: '{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}'
    - vtype: REG_SZ

photoviewer_reg_19:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Jpeg
    - vname: EditFlags
    - vdata: 65536
    - vtype: REG_DWORD

photoviewer_reg_20:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Jpeg
    - vname: ImageOptionFlags
    - vdata: 1
    - vtype: REG_DWORD

photoviewer_reg_21:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Jpeg
    - vname: FriendlyTypeName
    - vdata: '@%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll,-3055'
    - vtype: REG_EXPAND_SZ

photoviewer_reg_22:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Jpeg\DefaultIcon
    - vdata: '%SystemRoot%\\System32\\imageres.dll,-72'
    - vtype: REG_SZ

photoviewer_reg_23:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Jpeg\shell\open
    - vname: MuiVerb
    - vdata: '@%ProgramFiles%\Windows Photo Viewer\photoviewer.dll,-3043'
    - vtype: REG_EXPAND_SZ

photoviewer_reg_24:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Jpeg\shell\open\command
    - vdata: '%SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %1'
    - vtype: REG_EXPAND_SZ

photoviewer_reg_25:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Jpeg\shell\open\DropTarget
    - vname: Clsid
    - vdata: '{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}'
    - vtype: REG_SZ

photoviewer_reg_26:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Gif
    - vname: ImageOptionFlags
    - vdata: 1
    - vtype: REG_DWORD

photoviewer_reg_27:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Gif
    - vname: FriendlyTypeName
    - vdata: '@%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll,-3057'
    - vtype: REG_EXPAND_SZ

photoviewer_reg_28:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Gif\DefaultIcon
    - vdata: '%SystemRoot%\\System32\\imageres.dll,-83'
    - vtype: REG_SZ

photoviewer_reg_29:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Gif\shell\open\command
    - vdata: '%SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %1'
    - vtype: REG_EXPAND_SZ

photoviewer_reg_30:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Gif\shell\open\DropTarget
    - vname: Clsid
    - vdata: '{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}'
    - vtype: REG_SZ

photoviewer_reg_31:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Png
    - vname: ImageOptionFlags
    - vdata: 1
    - vtype: REG_DWORD

photoviewer_reg_32:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Png
    - vname: FriendlyTypeName
    - vdata: '@%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll,-3057'
    - vtype: REG_EXPAND_SZ

photoviewer_reg_33:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Png\DefaultIcon
    - vdata: '%SystemRoot%\\System32\\imageres.dll,-71'
    - vtype: REG_SZ

photoviewer_reg_34:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Png\shell\open\command
    - vdata: '%SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %1'
    - vtype: REG_EXPAND_SZ

photoviewer_reg_35:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Png\shell\open\DropTarget
    - vname: Clsid
    - vdata: '{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}'
    - vtype: REG_SZ

photoviewer_reg_36:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Wdp
    - vname: EditFlags
    - vdata: 65536
    - vtype: REG_DWORD

photoviewer_reg_37:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Wdp
    - vname: ImageOptionFlags
    - vdata: 1
    - vtype: REG_DWORD

photoviewer_reg_38:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Wdp\DefaultIcon
    - vdata: '%SystemRoot%\\System32\\wmphoto.dll,-400'
    - vtype: REG_SZ

photoviewer_reg_39:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Wdp\shell\open
    - vname: MuiVerb
    - vdata: '@%ProgramFiles%\Windows Photo Viewer\photoviewer.dll,-3043'
    - vtype: REG_EXPAND_SZ

photoviewer_reg_40:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Wdp\shell\open\command
    - vdata: '%SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %1'
    - vtype: REG_EXPAND_SZ

photoviewer_reg_41:
  reg.present:
    - name: HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Wdp\shell\open\DropTarget
    - vname: Clsid
    - vdata: '{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}'
    - vtype: REG_SZ

photoviewer_reg_42:
  reg.present:
    - name: HKEY_CLASSES_ROOT\SystemFileAssociations\image\shell\Image Preview\command
    - vdata: '%SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %1'
    - vtype: REG_EXPAND_SZ

photoviewer_reg_43:
  reg.present:
    - name: HKEY_CLASSES_ROOT\SystemFileAssociations\image\shell\Image Preview\DropTarget
    - vname: '{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}'
    - vtype: REG_SZ

photoviewer_reg_44:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities
    - vname: ApplicationDescription
    - vdata: '@%ProgramFiles%\\Windows Photo Viewer\\photoviewer.dll,-3069'
    - vtype: REG_SZ

photoviewer_reg_45:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities
    - vname: ApplicationName
    - vdata: '@%ProgramFiles%\\Windows Photo Viewer\\photoviewer.dll,-3009'
    - vtype: REG_SZ

photoviewer_reg_46:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations
    - vname: .cr2
    - vdata: 'PhotoViewer.FileAssoc.Tiff'
    - vtype: REG_SZ

photoviewer_reg_47:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations
    - vname: .jpg
    - vdata: 'PhotoViewer.FileAssoc.Jpeg'
    - vtype: REG_SZ

photoviewer_reg_48:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations
    - vname: .wdp
    - vdata: 'PhotoViewer.FileAssoc.Wdp'
    - vtype: REG_SZ

photoviewer_reg_49:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations
    - vname: .jfif
    - vdata: 'PhotoViewer.FileAssoc.JFIF'
    - vtype: REG_SZ

photoviewer_reg_50:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations
    - vname: .dib
    - vdata: 'PhotoViewer.FileAssoc.Bitmap'
    - vtype: REG_SZ

photoviewer_reg_51:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations
    - vname: .png
    - vdata: 'PhotoViewer.FileAssoc.Png'
    - vtype: REG_SZ

photoviewer_reg_52:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations
    - vname: .jxr
    - vdata: 'PhotoViewer.FileAssoc.Wdp'
    - vtype: REG_SZ

photoviewer_reg_53:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations
    - vname: .bmp
    - vdata: 'PhotoViewer.FileAssoc.Bitmap'
    - vtype: REG_SZ

photoviewer_reg_54:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations
    - vname: .jpe
    - vdata: 'PhotoViewer.FileAssoc.Jpeg'
    - vtype: REG_SZ

photoviewer_reg_55:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations
    - vname: .jpeg
    - vdata: 'PhotoViewer.FileAssoc.Jpeg'
    - vtype: REG_SZ

photoviewer_reg_56:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations
    - vname: .gif
    - vdata: 'PhotoViewer.FileAssoc.Gif'
    - vtype: REG_SZ

photoviewer_reg_57:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations
    - vname: .tif
    - vdata: 'PhotoViewer.FileAssoc.Tiff'
    - vtype: REG_SZ

photoviewer_reg_58:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations
    - vname: .tiff
    - vdata: 'PhotoViewer.FileAssoc.Tiff'
    - vtype: REG_SZ
