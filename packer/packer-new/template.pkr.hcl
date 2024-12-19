packer {
  required_plugins {
    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = "~> 1"
    }
    googlecompute = {
      source  = "github.com/hashicorp/googlecompute"
      version = "~> 1"
    }
  }
}
 
source "googlecompute" "computeimage" {
  network             = var.network
  subnetwork          = var.subnetwork
  image_name          = var.image_name
  preemptible         = var.preemptible_choice
  project_id          = var.project_id
  source_image_family = var.img_family
  ssh_username        = var.ssh-user
  zone                = var.zone
  use_internal_ip     =  true
}
 
build {
  sources = ["source.googlecompute.computeimage"]
 
  provisioner "shell-local" {
    inline = [ 
      "sudo apt update -y",
      "sudo apt install ansible-core -y",
      "ansible --version"
    ]
  }
  provisioner "ansible" {
    playbook_file = "./ansible/playbook.yml"
    use_proxy = false
  }
}
