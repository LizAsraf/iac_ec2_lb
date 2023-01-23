resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.13.1"

  values = [
    "${file("${path.module}/argo-values.yaml")}"
  ]
  set {
    name  = "cluster.enabled"
    value = "true"
  }

  set {
    name  = "metrics.enabled"
    value = "true"
  }

  set {
    name  = "service.annotations.prometheus\\.io/port"
    value = "9127"
  }
}
resource "helm_release" "appofapps" {
  name  = "appofapps"
  chart = "${path.module}/appofapps"
  depends_on = [helm_release.aws-ebs-csi-driver]
}

resource "helm_release" "aws-ebs-csi-driver" {
  name       = "aws-ebs-csi-driver"
  repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
  chart      = "aws-ebs-csi-driver"
  version    = "2.13.0"
  depends_on = [helm_release.argocd]
}
resource "time_sleep" "wait_one_minute" {
  depends_on = [helm_release.aws-ebs-csi-driver , helm_release.appofapps]

  create_duration = "60s"
}
resource "null_resource" "update_dns" {
  provisioner "local-exec" {
    command = "${path.module}/update_dns.sh"
  }
  depends_on = [time_sleep.wait_one_minute]
}