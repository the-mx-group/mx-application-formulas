{% from "app/gradle/map.jinja" import gradle with context %}

{{ gradle.package }}:
  {{ gradle.installer }}
