Install Gnome3 GUI:
  pkg.group_installed:
    - name: gnome

Install GDM:
  pkg.installed:
    pkgs:
      - gdm

Set GDM to start at startup:
  service.enabled:
    - name: gdm

