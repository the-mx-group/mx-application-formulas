Enable multilib:
  file.append:
    - name: /etc/pacman.conf
    - text: |
        [multilib]
        Include = /etc/pacman.d/mirrorlist

Update pacman with new repo:
  pkg.uptodate:
    - refresh: true
    - onchanges:
      - file: Enable multilib
