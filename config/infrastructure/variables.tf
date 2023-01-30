variable "vpc_name" {
  description = "Name for VPC"
  default     = "general"
  type        = string
}

variable "public_web" {
  description = "Name for public subnet"
  default     = "public-web"
  type        = string
}

variable "private_app" {
  description = "Name for private subnet"
  default     = "private-app"
  type        = string
}

variable "private_db" {
  description = "Name for DB subnet"
  default     = "private-db"
  type        = string
}

variable "region_1" {
  description = "Region 1"
  default     = "ru-central1-a"
  type        = string
}

variable "region_2" {
  description = "Region 2"
  default     = "ru-central1-b"
  type        = string
}

variable "cluster_name" {
  description = "Name cluster database"
  default     = "cluster-database"
  type        = string
}

variable "version_cluster_database" {
  description = "Version cluster database"
  default     = "8.0"
  type        = string
}

variable "type_cluster_database" {
  description = "Type cluster database"
  default     = "s2.micro"
  type        = string
}

variable "disk_type_cluster_database" {
  description = "Disk type cluster database"
  default     = "network-ssd"
  type        = string
}

variable "disk_size" {
  description = "database size"
  default     = 16
  type        = number
}

variable "db_name" {
  description = "Name database"
  default     = "database-1"
  type        = string
}

variable "db_user" {
  description = "User for database"
  default     = "user"
  type        = string
}

variable "db_user_password" {
  description = "User password for database"
  default     = "password"
  type        = string
}

variable "instance_platform" {
  description = "Type instance platform"
  default     = "standard-v3"
  type        = string
}

variable "instance_core" {
  description = "Instance core"
  default     = 2
  type        = number
}

variable "instance_memory" {
  description = "Instance memory"
  default     = 2
  type        = number
}

variable "instance_fraction" {
  description = "Instance core fraction"
  default     = 20
  type        = number
} 

variable "instance_image_id" {
  description = "Instance image ID"
  default     = "fd807ed79a4kkqfvd1mb"
  type        = string
}  

variable "instance_user" {
  description = "User for instance"
  default     = "ubuntu"
  type        = string
}

variable "file_path_ssh" {
  description = "File path SSH"
  default     = "~/.ssh/id_rsa.pub"
  type        = string
}

variable "file_path_cloudcaonfig" {
  description = "File path SSH"
  default     = "../config/infrastructure/cloudconfig.yaml"
  type        = string
}