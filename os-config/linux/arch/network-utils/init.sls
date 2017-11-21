Install tools:
  pkg.installed:
    - pkgs:
      - openssh
      - bind-tools
      - net-tools

Enable SSH service:
  service.enabled:
    - name: sshd
