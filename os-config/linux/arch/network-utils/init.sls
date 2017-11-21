Install tools:
  pkg.installed:
    - pkgs:
      - openssh
      - bind-tools

Enable SSH service:
  service.enabled:
    - name: sshd
