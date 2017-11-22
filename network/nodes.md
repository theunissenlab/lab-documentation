Documentation of specific nodes

### hostname: zebra (10.0.1.1)

Located in colo. Hosts home directories and is connected by ethernet to the internet and to **tdrive**. This computer is the gateway to the VPN and is currently the LDAP server as well.

#### Connect

Can only be accessed with key login (cannot log in with password), need public key to be added to authorized_keys. Connect as ubuntu user, through `ssh ubuntu@zebra` or `ssh ubuntu@169.229.219.171` when not on the network.

#### Runs

* IPsec (`strongSwan`): virtual connection between **zebra** and **finch**
  
* LDAP (`slapd`, `openldap`): controls user credentials for network login ("ou=People,dc=fet,dc=local"), and automount info ("ou=autofs,dc=fet,dc=local")
  
* RAID (`mdadm`): data backup/replication
  
* VPN (`openvpn`): vpn stuffs
  
### hostname: finch (10.0.2.0/24)

Located in LKS, basically is the network's DHCP and DNS server. When a new computer connects to the network, **finch** will assign it an IP and associate its hostname.

#### Connect

Not sure how to connect to **finch**, but I think its also key only login.

#### Runs 

* IPsec (`strongSwan`): virtual connection between **zebra** and **finch**

* DHCP (`isc-dhcp-server`): maps mac addresses to ip addresses

* DNS (`Bind9`): maps domain names to ip addresses

### tdrive (10.0.1.203)

Located in colo. Data server. How much spaces does it have?

### hostname(s): goats, strfinator, sirius, quaint-produce, ... (10.0.2.x)

Regular ol computers. Can be accessed by key login or password. Directories fhome and tdrive should be automounted.

#### Connect

Connect by `ssh USERNAME@HOSTNAME` while on the network or VPN.

#### Runs 

* autofs (`autofs-ldap`): automatically mounts directories by looking to the ldap server (defined in `/etc/ldap.conf`). The ldap server `ldap` currently points to 10.0.1.11 which is **zebra**'s current ip.
