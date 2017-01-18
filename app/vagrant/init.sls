Caskroom/cask/vagrant:
  pkg.installed

# We use the hostmanager plugin
vagrant-hostmanager:
  cmd.run:
    - name: vagrant plugin install vagrant-hostmanager
    - unless: vagrant plugin list | grep vagrant-hostmanager