### FLUSH IPTABLES ###

# to flush NAT tables
iptables -t nat -F

### Add NAT PREROUTING ###

# to allow other students to access APACHE server
iptables -t nat -A PREROUTING -p tcp --dport 18110 -j DNAT --to-destination 172.17.110.37:80

# to allow other students to access MySQL server
iptables -t nat -A PREROUTING -p tcp --dport 16110 -j DNAT --to-destination 172.17.110.37:3306

# to allow other students to access Linux server - SSH
iptables -t nat -A PREROUTING -p tcp --dport 12110 -j DNAT --to-destination 172.17.110.37:22

# to allow other students to access IIS server
iptables -t nat -A PREROUTING -p tcp --dport 19110 -j DNAT --to-destination 172.17.110.36:80

# to allow other students to access Windows server - RDP
iptables -t nat -A PREROUTING -p tcp --dport 13110 -j DNAT --to-destination 172.17.110.36:3389

iptables -t nat -A POSTROUTING -o eth0 -m limit --limit 10/sec -j LOG --log-prefix "LOG MASQUERADE"
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
