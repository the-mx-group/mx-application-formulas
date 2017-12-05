Install HFS utilities if we're on a Mac:
  cmd.run:
    - unless: pacman -Qi hfsprogs
    - runas: pacaur-builder
    - name: pacaur -S hfsprogs --noconfirm --noedit

Install Hfs progs if we're on a Mac:
  cmd.run:
    - unless: pacman -Qi hfsutils
    - runas: pacaur-builder
    - name: pacaur -S hfsutils --noconfirm --noedit

Install fan control if we're on a Mac:
  cmd.run:
    - unless: pacman -Qi mbpfan-git
    - runas: pacaur-builder
    - name: pacaur -S mbpfan-git --noconfirm --noedit
