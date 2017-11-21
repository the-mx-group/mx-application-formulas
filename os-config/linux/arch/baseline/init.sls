Install OS baseline:
  pkg.group_installed:
    - name: base

Install Devel headers:
  pkg.group_installed:
    - name: base-devel

Install baseline tools for management:
  pkg.installed:
      - salt
      - networkmanager
      - linux-headers
