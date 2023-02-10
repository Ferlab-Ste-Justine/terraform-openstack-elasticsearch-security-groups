# About

This is a terraform module that provisions security groups meant to be restrict network access to an elasticsearch cluster.

The following security groups are created:
- **master**: Security groups for the masters in the elasticsearch cluster. Will have unrestricted networking access to other nodes in the es cluster.
- **worker**: Security groups for the workers in the elasticsearch cluster. Will have unrestricted networking access to other nodes in the es cluster. Unless you apply more specific rules to the returned groups, it is the same as the **master** group.
- **bastion**: Security group for a bastion giving it incoming access on port 22 (ssh). Additionally, it gives external access on its own port 22.
- **client**: Security group for a client of the cluster, giving it access to port 9200 on the master and worker nodes.


The **master**, **worker** and **bastion** security groups are self-contained. They can be applied by themselves on vms with no other security groups and the vms will be functional in their role.

The **client** security group is meant to supplement other security groups a vm will have as the only thing it grants is client access to the cluster.

# Usage

## Variables

The module takes the following variables as input:

- **namespace**: Namespace to differenciate the security group names across es clusters. The generated security groups will have the following names: 

```
<namespace>-es-master
<namespace>-es-worker
<namespace>-es-client
<namespace>-es-bastion
```

## Output

The module outputs the following variables as output:

- groups: A map with 3 keys: client, master, worker, bastion. Each key map entry contains a resource of type **openstack_networking_secgroup_v2**