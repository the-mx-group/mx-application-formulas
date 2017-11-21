{% from "app/google-chrome/map.jinja" import chrome with context %}

{{ chrome.package }}:
  {{ chrome.installer }}
