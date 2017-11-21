# Network Documentation

## Nodes

*zebra, finch, sirius, strfinator, goats*

### tdrive

What is tdrive and where is it?

### fhome

What is fhome and where is it?

## Setting up a new computer

1. ??

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
