# allow custom port for partner Apache Server
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 192.168.133.36 --dport 18133 -m limit --limit 10/sec -j LOG --log-prefix "custom-port-APACHE"

iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 192.168.133.36 --dport 18133 -j ACCEPT
iptables -A FORWARD -p tcp -s 192.168.133.36 -d 10.66.53.0/24 --sport 18133 -j ACCEPT

# allow custom port for partner MySQL Server
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 192.168.133.36 --dport 16133 -m limit --limit 10/sec -j LOG --log-prefix "custom-port-mysql"

iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 192.168.133.36 --dport 16133 -j ACCEPT
iptables -A FORWARD -p tcp -s 192.168.133.36 -d 10.66.53.0/24 --sport 16133 -j ACCEPT

# allow custom port for partner IIS Server
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 192.168.133.36 --dport 19133 -m limit --limit 10/sec -j LOG --log-prefix "custom-port-IIS"

iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 192.168.133.36 --dport 19133 -j ACCEPT
iptables -A FORWARD -p tcp -s 192.168.133.36 -d 10.66.53.0/24 --sport 19133 -j ACCEPT

# allow custom port for partner Windows Server RDP
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 192.168.133.36 --dport 13133 -m limit --limit 10/sec -j LOG --log-prefix "custom-port-RDP"

iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 192.168.133.36 --dport 13133 -j ACCEPT
iptables -A FORWARD -p tcp -s 192.168.133.36 -d 10.66.53.0/24 --sport 13133 -j ACCEPT

# allow custom port88133 for partner Linux Server SSH
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 192.168.133.36 --dport 12133 -m limit --limit 10/sec -j LOG --log-prefix "custom-port-SSH"

iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 192.168.133.36 --dport 12133 -j ACCEPT
iptables -A FORWARD -p tcp -s 192.168.133.36 -d 10.66.53.0/24 --sport 12133 -j ACCEPT

# allow partner traffic after NAT mapping

#HTTP
iptables -A FORWARD -p tcp -s 192.168.133.36 --dport 80 -m limit --limit 10/sec -j LOG --log-prefix "log-captures masquerading HTTP"
iptables -A FORWARD -p tcp -s 192.168.133.36 --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp -d 192.168.133.36--sport 80 -j ACCEPT

# SSH
iptables -A FORWARD -p tcp -s 192.168.133.36 --dport 22 -m limit --limit 10/sec -j LOG --log-prefix "log-captures masquerading SSH"
iptables -A FORWARD -p tcp -s 192.168.133.36 --dport 22 -j ACCEPT
iptables -A FORWARD -p tcp -d 192.168.133.36 --sport 22 -j ACCEPT

# RDP
iptables -A FORWARD -p tcp -s 192.168.133.36 --dport 3389 -m limit --limit 10/sec -j LOG --log-prefix "log-captures masquerading RDP"
iptables -A FORWARD -p tcp -s 192.168.133.36 --dport 3389 -j ACCEPT
iptables -A FORWARD -p tcp -d 192.168.133.36 --sport 3389 -j ACCEPT

#MySQL
iptables -A FORWARD -p tcp -s 192.168.133.36 --dport 3306 -m limit --limit 10/sec -j LOG --log-prefix "log-captures masquerading MYSQL"
iptables -A FORWARD -p tcp -s 192.168.133.36 --dport 3306 -j ACCEPT
iptables -A FORWARD -p tcp -d 192.168.133.36 --sport 3306 -j ACCEPT

