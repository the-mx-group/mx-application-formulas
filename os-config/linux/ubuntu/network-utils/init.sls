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
    - name: sshd
