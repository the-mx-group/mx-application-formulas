Install tools:
  pkg.installed:
    - pkgs:
      - curl
      - net-tools
      - openssh-server
      - wget
      - whois

Enable SSH service:
  service.enabled:
{%- if grains.os in ("Ubuntu") and grains.osrelease >= "24.04" %}
    - name: ssh
{%- else %}
    - name: sshd
{%- endif %}
