Install tools:
  pkg.installed:
    - pkgs:
      - openssh
      - dnsutils

Enable SSH service:
  service.enabled:
    - name: openssh
