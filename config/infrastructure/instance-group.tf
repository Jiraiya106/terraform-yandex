# # resource "yandex_resourcemanager_folder" "myfolder" {
# #   cloud_id = "myfolder"
# # }

# resource "yandex_compute_instance_group" "private-group-2" {
#   name                = "test-ig"
#   #folder_id           = yandex_resourcemanager_folder.myfolder.id
#   service_account_id  = yandex_iam_service_account.sa.id
#   deletion_protection = true
#   instance_template {
#     platform_id = "standard-v1"
#     resources {
#       memory = 2
#       cores  = 2
#     }
#     boot_disk {
#       mode = "READ_WRITE"
#       initialize_params {
#         image_id = "fd807ed79a4kkqfvd1mb"
#         size     = 1
#       }
#     }
#     network_interface {
#       network_id = yandex_vpc_network.general_network.id
#       subnet_ids = ["${yandex_vpc_subnet.private_app_subnet_2.id}"]
#     }
#     labels = {
#       label1 = "label1-value"
#       label2 = "label2-value"
#     }
#     metadata = {
#       foo      = "bar"
#       ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
#     }
#     network_settings {
#       type = "STANDARD"
#     }
#   }

#   variables = {
#     test_key1 = "test_value1"
#     test_key2 = "test_value2"
#   }

#   scale_policy {
#     auto_scale {
#       initial_size           = 1
#       measurement_duration   = 500
#       cpu_utilization_target = 90
#     }
#   }

#   allocation_policy {
#     zones = ["ru-central1-a"]
#   }

#   deploy_policy {
#     max_unavailable = 2
#     max_creating    = 2
#     max_expansion   = 2
#     max_deleting    = 2
#   }
# }

# data "yandex_compute_instance_group" "my_group" {
#   instance_group_id = yandex_compute_instance_group.private-group-2.id
# }

# output "instance_external_ip" {
#   value = "${data.yandex_compute_instance_group.my_group.instances.*.network_interface.0.nat_ip_address}"
# }