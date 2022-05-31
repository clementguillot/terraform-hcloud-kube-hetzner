---
apiVersion: v1
kind: Namespace
metadata:
  name: cattle-system
---
apiVersion: helm.cattle.io/v1
kind: HelmChart
metadata:
  name: rancher
  namespace: kube-system
spec:
  chart: rancher
  repo: https://releases.rancher.com/server-charts/${rancher_install_channel}
  targetNamespace: cattle-system
  valuesContent: |-
    ingress:
      tls:
        source: ${rancher_tls_source}
    hostname: ${rancher_hostname}
    replicas: ${number_control_plane_nodes}
    bootstrapPassword: ${rancher_bootstrap_password}