resource "yandex_iam_service_account" "sa" {
  name        = "elisey"
  description = "service account to manage VMs"
}