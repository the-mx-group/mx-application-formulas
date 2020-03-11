install-microsoft-office:
  chocolatey.installed:
    - name: microsoft-office-deployment
    - package_args: "'/64Bit /Product O365ProPlusRetail'"
