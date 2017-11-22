# Connecting to the computers in NAF

The two computers in NAF are **pumpkin** and **chubbyninja**. They are connected to the router in 123E and are physically located in 125.

The router is a virtual server for the 2 computers, and you can ssh to them by ssh-ing to the router at a particular port:

router ip: 169.229.251.200

pumpkin port: 65455

chubbyninja port: 65454

You can add this to your ssh config file

```
Host pumpkin
  HostName 169.229.251.200
  Port 65455
  User fet
Host chubbyninja
  HostName 169.229.251.200
  Port 65454
  User fet
```

**NOTE** For now anyone can ssh to the computer and just authenticate using the computer's password. It would be nicer to authenticate using RSA keys only and then enforce it by changing the ssh config in `/etc/ssh/sshd_config`, and uncomment the line `Password authentication no`? or is it `yes`?
