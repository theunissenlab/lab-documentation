# Accessing the network from savio

1. Create a rsa key from the savio in `/global/home/users/username/.ssh` with `ssh-keygen -t rsa -f id_rsa_savio`

2. Edit `/global/home/uesrs/username/.ssh/config` on savio to tell it to use the correct key and point it to the host (**zebra**)

```
Host TheunissenLab
  User USERNAME_ON_FET_CLUSTER
  IdentityFile ~/.ssh/id_rsa_savio
  HostName 169.229.219.171
```

3. Copy the public key onto the FET cluster into `/auto/fhome/USERNAME_ON_FET_CLUSTER/.ssh/` directory
