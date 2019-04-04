provider "google" {
  project = "infra-236514"
  region = "europe-west1"
  }
resource "google_compute_instance" "app" {
name = "reddit-app"
machine_type = "g1-small"
zone = "europe-west1-b"
metadata {
	sshKeys = "appuser:${file ("~/.ssh/id_rsa.pub")}"
	}
# определение загрузочного диска
boot_disk {
  initialize_params {
    image = "reddit-base-1554306998"
  }
}
# определение сетевого интерфейса
network_interface {
# сеть, к которой присоединить данный интерфейс
network = "default"
# использовать ephemeral IP для доступа из Интернет
access_config {}
  }
resource "google_compute_firewall" "firewall_puma" {
name = "allow-puma-default"
# Название сети, в которой действует правило
network = "default"
# Какой доступ разрешить
allow {
	protocol = "tcp"
	ports = ["9292"]
	}
# Каким адресам разрешаем доступ
source_ranges = ["0.0.0.0/0"]
# Правило применимо для инстансов с тегом …
target_tags = ["reddit-app"]
  }
}
