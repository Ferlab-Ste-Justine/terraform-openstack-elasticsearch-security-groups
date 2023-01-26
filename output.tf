output "groups" {
  value = {
    master = openstack_networking_secgroup_v2.es_master
    worker = openstack_networking_secgroup_v2.es_worker
    bastion = openstack_networking_secgroup_v2.es_bastion
    client = openstack_networking_secgroup_v2.es_client
  }
}