{% from tpldir ~ "/map.jinja" import pipewire with context %}

Install pipewire:
  {{ pipewire.main.installer }}

Install wireplumber:
  {{ pipewire.wireplumber.installer }}

# After installing, user should run:
# systemctl --user --now disable pulseaudio.{socket,service}
# systemctl --user mask pulseaudio
# systemctl --user --now enable pipewire{,-pulse}.{socket,service} filter-chain.service
