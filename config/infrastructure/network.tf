resource "yandex_vpc_network" "general_network" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "public_web_1" {
    name           = "${var.public_web}-1"
    v4_cidr_blocks = ["10.10.1.0/24"]
    zone           = var.region_1
    network_id     = yandex_vpc_network.general_network.id
    route_table_id = yandex_vpc_route_table.output.id
}

resource "yandex_vpc_subnet" "private_app_1" {
    name           = "${var.private_app}-1"
    v4_cidr_blocks = ["10.10.3.0/24"]
    zone           = var.region_1
    network_id     = yandex_vpc_network.general_network.id
    route_table_id = yandex_vpc_route_table.private_public_1.id
}

resource "yandex_vpc_subnet" "private_db_1" {
    name           = "${var.private_db}-1"
    v4_cidr_blocks = ["10.10.5.0/24"]
    zone           = var.region_1
    network_id     = yandex_vpc_network.general_network.id
    route_table_id = yandex_vpc_route_table.db_private_1.id
}


resource "yandex_vpc_subnet" "public_web_2" {
    name           = "${var.public_web}-2"
    v4_cidr_blocks = ["10.10.2.0/24"]
    zone           = var.region_2
    network_id     = yandex_vpc_network.general_network.id
    route_table_id = yandex_vpc_route_table.output.id
}

resource "yandex_vpc_subnet" "private_app_2" {
    name           = "${var.private_app}-2"
    v4_cidr_blocks = ["10.10.4.0/24"]
    zone           = var.region_2
    network_id     = yandex_vpc_network.general_network.id
    route_table_id = yandex_vpc_route_table.private_public_2.id
}

resource "yandex_vpc_subnet" "private_db_2" {
    name           = "${var.private_db}-2"
    v4_cidr_blocks = ["10.10.6.0/24"]
    zone           = var.region_2
    network_id     = yandex_vpc_network.general_network.id
    route_table_id = yandex_vpc_route_table.db_private_2.id
}

