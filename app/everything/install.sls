install_everything:
  chocolatey.upgraded:
    - name: everything
    - install_args: '-install-options "-noapp-data -disable-run-as-admin -disable-update-notification -install-efu-association -uninstall-folder-context-menu -uninstall-quick-launch-shortcut -install-run-on-system-startup -install-service -install-start-menu-shortcuts -uninstall-url-protocol -language 1033"'
