install-microsoft-office:
  chocolatey.installed:
    - name: microsoft-office-deployment
    - package_args: "'/64bit /Product O365ProPlusRetail'"
