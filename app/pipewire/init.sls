{% from tpldir ~ "/map.jinja" import pipewire with context %}

Install pipewire:
  {{ pipewire.main.installer }}

Install wireplumber:
  {{ pipewire.wireplumber.installer }}
