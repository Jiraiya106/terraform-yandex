resource "yandex_mdb_mysql_database" "db" {
  cluster_id = yandex_mdb_mysql_cluster.db_cluster.id
  name       = var.db_name
}

resource "yandex_mdb_mysql_cluster" "db_cluster" {
  name        = var.cluster_name
  environment = "PRESTABLE"
  network_id  = yandex_vpc_network.general_network.id
  version     = var.version_cluster_database

  resources {
    resource_preset_id = var.type_cluster_database
    disk_type_id       = var.disk_type_cluster_database
    disk_size          = var.disk_size
  }

  host {
    zone      = var.region_1
    subnet_id = yandex_vpc_subnet.private_db_1.id
  }
}

resource "yandex_mdb_mysql_user" "user1" {
    cluster_id = yandex_mdb_mysql_cluster.db_cluster.id
    name       = var.db_user
    password   = var.db_user_password

    permission {
      database_name = yandex_mdb_mysql_database.db.name
      roles         = ["ALL"]
    }

    connection_limits {
      max_questions_per_hour   = 10
      max_updates_per_hour     = 20
      max_connections_per_hour = 30
      max_user_connections     = 40
    }

    global_permissions = ["PROCESS"]

    authentication_plugin = "SHA256_PASSWORD"
}