Install Mac utilities if we're on a Mac:
  cmd.run:
    - unless: pacman -Qi hfsutils
    - runas: pacaur-builder,
    - name: pacaur -S visual-studio-code --noconfirm --noedit
