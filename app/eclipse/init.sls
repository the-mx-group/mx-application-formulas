{% set user = salt['pillar.get']('users:primary-user') %}
{% from "app/eclipse/map.jinja" import eclipse with context %}

{{ eclipse.package }}:
  {{ eclipse.installer }}

extras:
  {{ eclipse.extras }}

install Eclipse Ivy plugin:
  cmd.run:
    - name: {{ eclipse.binary }} -clean -purgeHistory -application org.eclipse.equinox.p2.director -noSplash -repository http://www.apache.org/dist/ant/ivyde/updatesite -installIU "org.apache.ivy"
    - runas: {{ user }}
    - unless: find {{ eclipse.packageLocation }} -name "org.apache.ivy_*" | grep '.*'

install Eclipse IvyDE plugin:
  cmd.run:
    - name: {{ eclipse.binary }} -clean -purgeHistory -application org.eclipse.equinox.p2.director -noSplash -repository http://www.apache.org/dist/ant/ivyde/updatesite -installIU "org.apache.ivyde.eclipse"
    - runas: {{ user }}
    - unless: find {{ eclipse.packageLocation }} -name "org.apache.ivyde.eclipse_*" | grep '.*'

install Eclipse Class Decompiler Core:
  cmd.run:
    - name: {{ eclipse.binary }} -clean -purgeHistory -application org.eclipse.equinox.p2.director -noSplash -repository http://opensource.cpupk.com/decompiler/update -installIU "org.sf.feeling.decompiler.feature.group"
    - runas: {{ user }}
    - unless: find {{ eclipse.packageLocation }} -name "org.sf.feeling.decompiler_*" | grep '.*'

Install BIRT plugin required for MAT charts:
  cmd.run:
    - name: {{ eclipse.binary }} -clean -purgeHistory -application org.eclipse.equinox.p2.director -noSplash -repository http://download.eclipse.org/releases/oxygen -installIU org.eclipse.birt.feature.group
    - runas: {{ user }}
    - unless: find {{ eclipse.packageLocation }} -name "org.eclipse.birt*" | grep '.*'

install Eclipse MAT:
  cmd.run:
    - name: {{ eclipse.binary }} -clean -purgeHistory -application org.eclipse.equinox.p2.director -noSplash -repository http://download.eclipse.org/mat/1.7/update-site -installIU "org.eclipse.mat.feature.feature.group" -installIU "org.eclipse.mat.chart.feature.feature.group"
    - runas: {{ user }}
    - unless: find {{ eclipse.packageLocation }} -name "org.eclipse.mat.*" | grep '.*'
