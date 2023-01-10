variable "instance_name" {
  type    = string
  default = "eductive13"
}

variable "image_name" {
  type    = string
  default = "Debian 11"
}

variable "flavor_name" {
  type    = string
  default = "s1-2"
}

variable "region1" {
  type    = string
  default = "GRA11"
}

variable "region2" {
  type    = string
  default = "SBG5"
}

variable "service_name" {
  type    = string
}
variable "vlan_id" {
  type    = number
  default = 13
}
variable "vlan_dhcp_start" {
  type = string
  default = "192.168.13.100"
}
variable "vlan_dhcp_end" {
  type = string
  default = "192.168.13.200"
}
variable "vlan_dhcp_network" {
  type = string
  default = "192.168.13.0/24"
}
