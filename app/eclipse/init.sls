{% set user = salt['pillar.get']('users:primary-user') %}
{% from "app/eclipse/map.jinja" import eclipse with context %}

{{ eclipse.package }}:
  {{ eclipse.installer }}

install Eclipse Ivy plugin:
  cmd.run:
    - name: {{ eclipse.binary }} -clean -purgeHistory -application org.eclipse.equinox.p2.director -noSplash -repository http://www.apache.org/dist/ant/ivyde/updatesite -installIU "org.apache.ivy"
    - runas: {{ user }}
    - unless: find {{ eclipse.packageLocation }} -wholename "*plugins/org.apache.ivy_*" | grep '.*'

install Eclipse IvyDE plugin:
  cmd.run:
    - name: {{ eclipse.binary }} -clean -purgeHistory -application org.eclipse.equinox.p2.director -noSplash -repository http://archive.apache.org/dist/ant/ivyde/updatesite -installIU "org.apache.ivyde.eclipse"
    - runas: {{ user }}
    - unless: find {{ eclipse.packageLocation }} -wholename "*plugins/org.apache.ivyde.eclipse_*" | grep '.*'

install Eclipse Class Decompiler Core:
  cmd.run:
    - name: {{ eclipse.binary }} -clean -purgeHistory -application org.eclipse.equinox.p2.director -noSplash -repository https://ecd-plugin.github.io/update -installIU "org.sf.feeling.decompiler.feature.group"
    - runas: {{ user }}
    - unless: find {{ eclipse.packageLocation }} -wholename "*plugins/org.sf.feeling.decompiler_*" | grep '.*'

Install BIRT plugin required for MAT charts:
  cmd.run:
    - name: {{ eclipse.binary }} -clean -purgeHistory -application org.eclipse.equinox.p2.director -noSplash -repository http://download.eclipse.org/birt/update-site/latest -installIU org.eclipse.birt.feature.group
    - runas: {{ user }}
    - unless: find {{ eclipse.packageLocation }} -wholename "*plugins/org.eclipse.birt*" | grep '.*'

install Eclipse MAT:
  cmd.run:
    - name: {{ eclipse.binary }} -clean -purgeHistory -application org.eclipse.equinox.p2.director -noSplash -repository http://download.eclipse.org/mat/latest/update-site -installIU "org.eclipse.mat.feature.feature.group"
    - runas: {{ user }}
    - unless: find {{ eclipse.packageLocation }} -wholename "*plugins/org.eclipse.mat.*" | grep '.*'

install SpotBugs for Eclipse:
  cmd.run:
    - name: {{ eclipse.binary }} -clean -purgeHistory -application org.eclipse.equinox.p2.director -noSplash -repository https://spotbugs.github.io/eclipse/ -installIU "com.github.spotbugs.plugin.eclipse.feature.group"
    - runas: {{ user }}
    - unless: find {{ eclipse.packageLocation }} -wholename "*plugins/com.github.spotbugs.*" | grep '.*'

install Checkstyle for Eclipse:
  cmd.run:
    - name: {{ eclipse.binary }} -clean -purgeHistory -application org.eclipse.equinox.p2.director -noSplash -repository https://checkstyle.org/eclipse-cs-update-site -installIU "net.sf.eclipsecs.feature.group"
    - runas: {{ user }}
    - unless: find {{ eclipse.packageLocation }} -wholename "*plugins/net.sf.eclipsecs.*" | grep '.*'
