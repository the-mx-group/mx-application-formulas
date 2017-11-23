{% from "app/git/map.jinja" import git with context %}

{{ git.package }}:
  {{ git.installer }}
