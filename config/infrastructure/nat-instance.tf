resource "yandex_compute_instance" "nat-instance-2" {
  name        = "nat-instance-2"
  platform_id = var.instance_platform
  zone        = var.region_2
  service_account_id = yandex_iam_service_account.sa.id

  resources {
    cores  = var.instance_core
    memory = var.instance_memory
    core_fraction = var.instance_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.instance_image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public_web_2.id
  }

  metadata = {
    install-unified-agent = "0"
    serial-port-enable = "1"
    name    = var.instance_user
    ssh-keys = "${var.instance_user}:${file("${var.file_path_ssh}")}"
    user-data = file(var.file_path_cloudcaonfig)
  }
}