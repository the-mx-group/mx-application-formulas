{% set user = salt['pillar.get']('users:primary-user') %}
{% set userinfo = salt['user.info'](user) %}

Install oh-my-zsh for primary user:
  cmd.run:
    - creates: {{ userinfo.home }}/.oh-my-zsh
    - name: sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    - runas: {{ user }}
