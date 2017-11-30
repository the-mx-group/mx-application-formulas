{% set user = salt['pillar.get']('users:primary-user') %}
{% set userinfo = salt['user.info'](user) %}

Create MX profile container for things Mx wants to add to user profiles:
  file.exists:
    - name: {{ userinfo.home }}/.mx_profile

Ensure user is running the mx profile content:
  file.append:
    - name: {{ userinfo.home }}/.bash_profile
    - text: source ~/.mx_profile
