{% set user = salt['pillar.get']('users:primary-user') %}
{% set userinfo = salt['user.info'](user) %}

Create MX profile container for things Mx wants to add to user profiles:
  file.managed:
    - name: {{ userinfo.home }}/.mx_profile
    - user: root
    - mode: 0755
    - replace: false

Ensure user is running the mx profile content:
  file.append:
    - name: {{ userinfo.home }}/.bashrc
    - text: source ~/.mx_profile
