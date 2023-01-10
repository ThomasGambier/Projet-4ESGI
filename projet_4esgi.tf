# Création d'une ressource de paire de clés SSH
resource "openstack_compute_keypair_v2" "projet_4esgi" {
  count      = 3
  provider   = openstack.ovh
  name       = "sshkey_${var.instance_name}_${count.index+1}"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Création d'une instance
resource "openstack_compute_instance_v2" "projet_4esgi" {
  count       = 3
  name        = "${var.instance_name}_${count.index+1}"    # Nom de l'instance
  provider    = openstack.ovh        # Nom du fournisseur
  image_name  = var.image_name       # Nom de l'image
  flavor_name = var.flavor_name      # Nom du type d'instance
  region      = var.region           # Nom de la régions


# Nom de la ressource openstack_compute_keypair_v2 nommée projet_4esgi
  key_pair    = openstack_compute_instance_v2.projet_4esgi[count.index+1].name


# Composant réseau par défaut
  network {
    name      = "Ext-Net"

# Création de clée SSH pour chaque région
resource "openstack_compute_keypair_v2" "projet_4esgi" {
  count      = length(var.region)
  provider   = openstack.ovh
  name       = "sshkey_eductive13"
  public_key = file("~/.ssh/id_rsa.pub")
  region     = element(var.region, count.index)
}

# Créer une ressource de stockage
resource "openstack_blockstorage_volume_v2" "volume_to_add" {
  name = "volume_eductive13"        # Nom du volume
  size = 10                         # Taille du volume en GB
  provider = openstack.ovh          # Nom du fournisseur
  count = length(var.region)
  region = var.region[count.index]
}

# Ajouter à l'instance le volume
resource "openstack_compute_volume_attach_v2" "attached" {
  count = length(var.region)
# Identifiant de la ressource openstack_compute_instance_v2 nommée test_terraform_instance
  instance_id = openstack_compute_instance_v2.projet_4esgi[count.index].id

# Identifiant de la ressource openstack_blockstorage_volume_v2 nommée volume_to_add
  volume_id = openstack_blockstorage_volume_v2.volume_to_add[count.index].id

# Region
  region = var.region[count.index]
}

# Création d'un réseau privé
 resource "ovh_cloud_project_network_private" "network" {
    service_name = var.service_name
    name         = "private_network_${var.instance_name}"   # Nom du réseau
    regions      = var.region
    provider     = ovh.ovh                                  # Nom du fournisseur
    vlan_id      = var.vlan_id                              # Identifiant du vlan pour le vRrack
 }

resource "ovh_cloud_project_network_private_subnet" "subnet" {
    count        = length(var.region)
    service_name = var.service_name
    network_id   = ovh_cloud_project_network_private.network.id
    start        = var.vlan_dhcp_start                          # Première IP du sous réseau
    end          = var.vlan_dhcp_end                            # Dernière IP du sous réseau
    network      = var.vlan_dhcp_network
    dhcp         = true                                         # Activation du DHCP
    region       = var.region[count.index]
    provider     = ovh.ovh                                      # Nom du fournisseur
    no_gateway   = true                                         # Pas de gateway par defaut
 }

# Composant réseau par défaut
  network {
    name      = "Ext-Net"
  }
  network {
    name      = "Ext-Net"
  }
  network {
    name = ovh_cloud_project_network_private.network.name
  }
  depends_on = [ovh_cloud_project_network_private_subnet.subnet]


 }
}
