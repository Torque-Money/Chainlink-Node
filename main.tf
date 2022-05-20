terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {
    type = string
}

provider "digitalocean" {
  token = var.do_token
}

# Create the droplet
resource "digitalocean_droplet" "web" {
    image = "ubuntu-20-04-x64"
    name = "Chainlink"
    region = "sfo3"
    size = "s-2vcpu-2gb"
}

# Create the firewall
resource "digitalocean_firewall" "web" {
    name = "only-22-80-and-443"

    droplet_ids = [digitalocean_droplet.web.id]

    inbound_rule {
        protocol         = "tcp"
        port_range       = "22"
        source_addresses = ["192.168.1.0/24", "2002:1:2::/48"]
    }

    inbound_rule {
        protocol         = "tcp"
        port_range       = "80"
        source_addresses = ["0.0.0.0/0", "::/0"]
    }

    inbound_rule {
        protocol         = "tcp"
        port_range       = "443"
        source_addresses = ["0.0.0.0/0", "::/0"]
    }

    inbound_rule {
        protocol         = "icmp"
        source_addresses = ["0.0.0.0/0", "::/0"]
    }

    outbound_rule {
        protocol              = "tcp"
        port_range            = "53"
        destination_addresses = ["0.0.0.0/0", "::/0"]
    }

    outbound_rule {
        protocol              = "udp"
        port_range            = "53"
        destination_addresses = ["0.0.0.0/0", "::/0"]
    }

    outbound_rule {
        protocol              = "icmp"
        destination_addresses = ["0.0.0.0/0", "::/0"]
    }
}

# Setup domain name
resource "digitalocean_domain" "default" {
  name       = "link.torque.money"
  ip_address = digitalocean_droplet.foo.ipv4_address
}