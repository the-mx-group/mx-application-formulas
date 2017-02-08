Caskroom/cask/visual-studio-code:
  pkg.installed

Install editorconfig extension:
  cmd.run:
    - name: /usr/local/bin/code --install-extension EditorConfig.EditorConfig
    - user: {{ user }}
    - unless: /usr/local/bin/code --list-extensions | grep EditorConfig.EditorConfig