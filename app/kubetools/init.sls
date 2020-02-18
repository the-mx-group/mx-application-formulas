{% from "app/kubetools/map.jinja" import kubetools with context %}

Install Kubernetes packages:
  {{ kubetools.installer }}
