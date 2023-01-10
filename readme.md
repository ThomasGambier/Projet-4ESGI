Global Project :

This project consists in deploying instances with Terraform (ovh provider), configuring them from Ansible and using Docker to manage several services.
The infrastructure will be composed of a front-end located at gra11 providing HaProxy service and an NFS server.
We will also have two back-end located in two different regions (GR11 & SBG5) in order to have a back-up in case of failure, they will host Nginx + Docker and on the other side the NFS client + Wordpress.


Terraform :

For this first part we have 3 instances of the Debian 11 operating system.
These three machines are located on two different regions (GRA11 & SBG5) which in case of failure of one of the networks, allows us to have a redundancy of servers and thus guarantee a high availability of services.
All the services are managed by a database. To ensure optimal security, the connection to the instances is only done via SSH and authentication requires the use of a public key.

Ansible :

This part will be used to configure services such as HaProxy, the different back-end, load balancing, as well as statistics, but also Docker, Nginx and the NFS server.
The installation of a firewall will be mandatory to access the websites. Restriction rules will of course be applied to limit the risk of intrusion.

Docker : 

On the docker we will set up a wordpress service and the NFS client.
