Install various fonts:
  pkg.installed:
    - pkgs:
      - fonts-inconsolata
      - fonts-croscore
      - fonts-hack
      - fonts-roboto

Stop-KDE-breaking-Roboto:
  file.blockreplace:
    - name: /etc/fonts/conf.avail/56-kubuntu-noto.conf
    - marker_start: "  <!-- Roboto is BCI-hinted for widely used LGC characters -->"
    - marker_end: "  <!-- Treat Noto Color Emoji as scalable. It's scalable even though"
    - content: |2
          <!--
          <match target="font">
            <test name="family"><string>Roboto</string></test>
            <edit name="hinting" mode="assign"><bool>true</bool></edit>
            <edit name="autohint" mode="assign"><bool>false</bool></edit>
            <edit name="hintstyle" mode="assign"><const>hintfull</const></edit>
            <edit name="antialias" mode="assign"><bool>true</bool></edit>
          </match>
          -->
    - backup: False
    - onlyif:
      - test -f /etc/fonts/conf.avail/56-kubuntu-noto.conf
