# Connecting to the lab VPN

Setting up VPN access requires a couple things:

* generating a password protected RSA key on **zebra**

* setting up the openvpn configuration on your laptop or home pc

The first step requires you to have access to ubuntu@**zebra**. If you don't have access, ask someone who does (Frederic, Kevin, Bill, Julie) to follow the instructions in the "Generating keys" section. When that is done, you should have configuration files in a form that looks like "USERNAME_keys.tar.gz", and can go onto the section "Setting up vpn configuration".

## Generating keys

Connect to *zebra* as user "ubuntu" (`ssh ubuntu@169.229.219.171`). Once connected, use the following helper script to generate keys for a user 

```
$ cd easy-rsa
$ ./makeuser USERNAME
```

The `makeuser` script generates a password protected key. It will first ask you to create a password to encrypt the key with. The second password prompt is to unlock the secret key on *zebra*. This is a separate password (that I'm not sure I should put on github, but maybe its fine?).

The newly generated key (as well as previously generated keys) can be found in `/home/ubuntu/keys` as a file `USERNAME_keys.tar.gz`. Copy the new keys from zebra to your local computer using ssh:

```scp ubuntu@zebra:/keys/<USERNAME>_keys.tar.gz .```

Send these keys over to the user, who will use them to set up their VPN access.

## Setting up vpn configuration

At this point, you should have a set of files in the form of `USERNAME_keys.tar.gz`. First, copy this to the directory you want to keep them in (I keep them in my `~/.ssh/` directory), and unzip the file.

#### On Mac

* Download and install [TunnelBlick](https://tunnelblick.net/).

* You should be able to open the `config.ovpn` file with TunnelBlick. Enter in the password you created when prompted.

#### On Ubuntu

* Install openvpn `sudo apt-get install network-manager-openvpn-gnome`

* In Ubuntu's network menu drop down (top right corner), select "Edit connections..." and then click the "Add" button.

* From the dropdown, select "Import a saved VPN configuration". If this option is not available, something went wrong with step one.

* Locate the `config.ovpn` file that was generated along with your keys in the `USERNAME_keys` directory. If you put it in the .ssh folder, you might need to right-click and "show hidden files".

* Connect to the VPN by going to the network menu dropdown, going to "VPN Connections", and selecting your VPN configuration.

* Hope that it works

Once connected to the VPN, nodes can be accessed by their hostnames (e.g. **zebra**, **goats**, **strfinator**, ...) since they will be using **finch** as their DNS server
