{% set user = salt['pillar.get']('users:primary-user') %}

Caskroom/cask/eclipse-jee:
  pkg.installed

install Eclipse Ivy plugin:
  cmd.run:
    - name: /Applications/Eclipse.app/Contents/MacOS/eclipse -clean -purgeHistory -application org.eclipse.equinox.p2.director -noSplash -repository http://www.apache.org/dist/ant/ivyde/updatesite -installIU "org.apache.ivy"
    - runas: {{ user }}
    - unless: find /Applications/Eclipse.app/Contents/Eclipse/ -name "org.apache.ivy_*" | grep '.*'

install Eclipse IvyDE plugin:
  cmd.run:
    - name: /Applications/Eclipse.app/Contents/MacOS/eclipse -clean -purgeHistory -application org.eclipse.equinox.p2.director -noSplash -repository http://www.apache.org/dist/ant/ivyde/updatesite -installIU "org.apache.ivyde.eclipse"
    - runas: {{ user }}
    - unless: find /Applications/Eclipse.app/Contents/Eclipse/ -name "org.apache.ivyde.eclipse_*" | grep '.*'

install Eclipse Class Decompiler Core:
  cmd.run:
    - name: /Applications/Eclipse.app/Contents/MacOS/eclipse -clean -purgeHistory -application org.eclipse.equinox.p2.director -noSplash -repository http://opensource.cpupk.com/decompiler/update -installIU "org.sf.feeling.decompiler.feature.group"
    - runas: {{ user }}
    - unless: find /Applications/Eclipse.app/Contents/Eclipse/ -name "org.sf.feeling.decompiler_*" | grep '.*'
