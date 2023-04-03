### Add Firewalls for Mapped Ports ###

# allow custom port for partner Apache Server
iptables -A FORWARD -p tcp -s 10.42.67.0/24 -d 192.168.110.36 --dport 18110 -j ACCEPT
iptables -A FORWARD -p tcp -s 192.168.110.36 -d 10.42.67.0/24 --sport 18110 -j ACCEPT

# allow custom port for partner MySQL Server
iptables -A FORWARD -p tcp -s 10.42.67.0/24 -d 192.168.110.36 --dport 16110 -j ACCEPT
iptables -A FORWARD -p tcp -s 192.168.110.36 -d 10.42.67.0/24 --sport 16110 -j ACCEPT

# allow custom port for partner IIS Server
iptables -A FORWARD -p tcp -s 10.42.67.0/24 -d 192.168.110.36 --dport 19110 -j ACCEPT
iptables -A FORWARD -p tcp -s 192.168.110.36 -d 10.42.67.0/24 --sport 19110 -j ACCEPT

# allow custom port for partner Windows Server RDP
iptables -A FORWARD -p tcp -s 10.42.67.0/24 -d 192.168.110.36 --dport 13110 -j ACCEPT
iptables -A FORWARD -p tcp -s 192.168.110.36 -d 10.42.67.0/24 --sport 13110 -j ACCEPT

# allow custom port88119 for partner Linux Server SSH
iptables -A FORWARD -p tcp -s 10.42.67.0/24 -d 192.168.110.36 --dport 12110 -j ACCEPT
iptables -A FORWARD -p tcp -s 192.168.110.36 -d 10.42.67.0/24 --sport 12110 -j ACCEPT

# allow partner traffic after NAT mapping
#HTTP
iptables -A FORWARD -p tcp -s 192.168.133.36 --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp -d 192.168.133.36 --sport 80 -j ACCEPT
# SSH
iptables -A FORWARD -p tcp -s 192.168.133.36 --dport 22 -j ACCEPT
iptables -A FORWARD -p tcp -d 192.168.133.36 --sport 22 -j ACCEPT
# RDP
iptables -A FORWARD -p tcp -s 192.168.133.36 --dport 3389 -j ACCEPT
iptables -A FORWARD -p tcp -d 192.168.133.36 --sport 3389 -j ACCEPT
#MySQL
iptables -A FORWARD -p tcp -s 192.168.133.36 --dport 3306 -j ACCEPT
iptables -A FORWARD -p tcp -d 192.168.133.36 --sport 3306 -j ACCEPT

# to DROP all traffic which is not explicitly allowed by firewall rules
iptables -A FORWARD -j DROP

# list the updated iptables
iptables -nvL --line
