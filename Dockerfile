 FROM kalilinux/kali-rolling
 # Install metasploit
 RUN apt -y update && \
     apt -y upgrade && \
     #apt -y install gnupg2 && \
     #apt -y install ruby libssl-dev && \
     apt -y install metasploit-framework && \
     apt -y install lsof net-tools vim systemctl
 RUN service postgresql start && /usr/bin/msfdb init
 COPY user.list / 
 COPY pass.list /
 CMD service postgresql start && tail -f /dev/null