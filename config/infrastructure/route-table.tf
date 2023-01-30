resource "yandex_vpc_gateway" "egress-gateway" {
  name = "egress-gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "output" {
  network_id = yandex_vpc_network.general_network.id
  

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = "${yandex_vpc_gateway.egress-gateway.id}"
  }
}

resource "yandex_vpc_route_table" "private_public_1" {
  network_id = yandex_vpc_network.general_network.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address = yandex_compute_instance.public_web_1.network_interface.0.ip_address
  }
}

resource "yandex_vpc_route_table" "db_private_1" {
  network_id = yandex_vpc_network.general_network.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address = yandex_compute_instance.private_app_1.network_interface.0.ip_address
  }
}

resource "yandex_vpc_route_table" "private_public_2" {
  network_id = yandex_vpc_network.general_network.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address = yandex_compute_instance.public_web_2.network_interface.0.ip_address
  }
}

resource "yandex_vpc_route_table" "db_private_2" {
  network_id = yandex_vpc_network.general_network.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address = yandex_compute_instance.private_backend_2.network_interface.0.ip_address
  }
}

