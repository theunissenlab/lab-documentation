Documentation of specific nodes

### zebra

Located in colo. Hosts home directories and is connected by ethernet to internet and **tdrive**.

Runs

* IPsec (`strongSwan`)

  * virtual connection between **zebra** and **finch**
  
* LDAP (`slapd`, `openldap`)

  * user credentials for network login ("ou=People,dc=fet,dc=local"), automount info ("ou=autofs,dc=fet,dc=local")
  
* RAID (`mdadm`)

  * data backup/replication
  
* VPN (`openvpn`)

  * vpn stuffs
  
### finch
