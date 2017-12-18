Install HFS utilities if we're on a Mac:
  cmd.run:
    - unless: pacman -Qi hfsprogs
    - runas: aur-builder
    - name: yay -S hfsprogs --noconfirm

Install Hfs progs if we're on a Mac:
  cmd.run:
    - unless: pacman -Qi hfsutils
    - runas: aur-builder
    - name: yay -S hfsutils --noconfirm

Install fan control if we're on a Mac:
  cmd.run:
    - unless: pacman -Qi mbpfan-git
    - runas: aur-builder
    - name: yay -S mbpfan-git --noconfirm
