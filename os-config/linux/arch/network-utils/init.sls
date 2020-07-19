Install tools:
  pkg.installed:
    - pkgs:
      - openssh
      - bind
      - net-tools

Enable SSH service:
  service.enabled:
    - name: sshd
