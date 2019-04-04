provider "google" {
   project = "infra-236514"
   region  = "europe-west1"
}
resource "google_compute_instance" "app" {
   name         = "reddit-app"
   machine_type = "g1-small"
   zone         = "europe-west1-b"
   boot_disk {
      initialize_params {
      image = "reddit-base-1554306998"
      }
   }
   metadata {
	sshKeys = "appuser:${file ("~/.ssh/appuser.pub")}"
   }
   tags = ["reddit-app"]
   network_interface {
     network = "default"
     access_config {}
   }
   connection {
     type = "ssh"
     user = "appuser"
     agent = false
     private_key = "${file("~/.ssh/appuser")}"
   }	
provisioner "file" {
	source 	    = "files/puma.service"
	destination = "/tmp/puma.service"
	}
provisioner "remote-exec" {
	script 	= "files/deploy.sh"
	}
}

