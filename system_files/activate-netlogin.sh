#!/bin/bash
SUDO_FORCE_REMOVE=yes apt-get --assume-yes install sudo-ldap autofs-ldap libnss-ldap
echo "base dc=fet,dc=local
uri ldap://ldap
ldap_version 3
pam_password md5
sudoers_base ou=SUDOers,dc=fet,dc=local
" > /etc/ldap/ldap.conf
ln -sf /etc/ldap/ldap.conf /etc/ldap.conf
ln -sf /etc/ldap/ldap.conf /etc/sudo-ldap.conf
auth-client-config -t nss -p lac_ldap
pam-auth-update
echo 'automount: ldap' >> /etc/nsswitch.conf
echo 'sudoers: ldap' >> /etc/nsswitch.conf
