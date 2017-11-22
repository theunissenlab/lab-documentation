# Network Documentation

## Nodes

*zebra* - located at colo, this is where `fhome` lives and is connected directly to `tdrive`

*finch* - located in LKS, runs dhcp (assigns ip addresses to mac addresses), dns (maps domain names to ip addresses), IPsec (creates virtual link between *finch* and *zebra*)

*sirius, strfinator, goats, ...* - individual computers

### tdrive

store data on it

### fhome

users home directories

## Setting up a new computer

1. Plug the computer into a ethernet port on our internal network (one of the 8 ports in LKS). *finch* assigns it an IP in the subnet.
2. Copy the script `activate-netlogin.sh` from *zebra* (located at `home/ubuntu/actiate-netlogin.sh`) onto the new computer and run it.

## Setting up a new user

1. ??

## Setting up VPN access for a user

Connect to *zebra* as user `ubuntu` and use a helper script to generate keys for a user 

```
ssh ubuntu@169.229.219.171
$ cd easy-rsa
$ ./makeuser USERNAME
```

The makeuser script requires the creation of a password for the key, as well as another password?

The keys are created in the directory `/keys`. Copy the new keys from zebra to your local computer

```scp ubuntu@169.229.219.171:/keys/<USERNAME>_keys.tar.gz .```

Send these keys to the user, who can load the file config.ovpn using TunnelBlick (Mac) or the default networkmanager openvpn client (Linux).

## Troubleshooting

### Login loop after rebooting or /auto/fhome not accessible

* Press Ctrl-Alt-F1 (or enter a shell). As the "ubuntu" user run the command `sudo service autofs restart`. This resolves a timing bug between when fhome is mounted and when the network becomes accessible.

### Reset LDAP user password

* From ubuntu user on *zebra*, run `sudo ldapsetpasswd USERNAME`
