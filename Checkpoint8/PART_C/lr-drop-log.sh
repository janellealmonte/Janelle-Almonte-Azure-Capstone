# Flush All Iptables Chains/Firewall rules
echo "-------------------------------------------"
echo "Flush All Iptables Chains/Firewall rules"
iptables -F

# Delete all Iptables Chains
echo "-------------------------------------------"
echo "Delete all Iptables Chains"
iptables -X

# Allow any INPUT tcp traffic if RELATED or ESTABLISHED
echo "-------------------------------------------"
echo "Allow any INPUT tcp traffic if RELATED or ESTABLISHED"
iptables -A INPUT -p tcp  -m state --state RELATED,ESTABLISHED -j ACCEPT


# Allow icmp traffic into the VM
echo "-------------------------------------------"
echo "Allow icmp traffic into the VM"
iptables -A INPUT -p icmp -s 10.66.53.0/24 -d 192.168.110.36 -j ACCEPT

# Allow any traffic from loopback interface into the VM
echo "-------------------------------------------"
echo "Allow any traffic from loopback interface into the VM"
iptables -A INPUT -i lo -s 127.0.0.0/24 -d 10.66.53.0/24 -j ACCEPT

# add LOG rule in INPUT chain if you are updating iptables script in-line
iptables -A INPUT -p tcp -s 10.66.53.0/24 -d 192.168.110.36 --dport 22 -m limit --limit 10/sec -j LOG --log-prefix "SSH INPUT LR-110 "

# Allow all SSH traffic on port 22 from Source IP subnet student_vnet
echo "-------------------------------------------"
echo "Allow all SSH traffic on port 22 from Source IP subnet student_vnet"
iptables -A INPUT -p tcp -s 10.66.53.0/24 -d 192.168.110.36 -m state --state NEW --dport 22 -j ACCEPT

# Log before DROPPING
echo "-------------------------------------------"
echo "Add a rule to LOG instead of DROPPING INPUT packets"
iptables -A INPUT -p all -m limit --limit 10/s -j LOG  --log-prefix "TO_DROP_INPUT"

# Reject all other INPUT traffic
# echo "-------------------------------------------"
# echo "Reject all other INPUT traffic"
iptables -A INPUT -j DROP

# add LOG rule in FORWARD chain if you are working from CLI
echo "-------------------------------------------"
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.37 --dport 22 -m limit --limit 1/min -j LOG --log-prefix "SSH FORWARD LS-110 "

# Allow forwarding SSH traffic on port 22 from Windows Client to Server SN1
echo "-------------------------------------------"
echo "SSH"
echo "Allow forwarding all SSH traffic on port 22 from any source to any destination"
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.32/27 --dport 22 -j DROP
iptables -A FORWARD -p tcp -s 172.17.110.32/27 -d 10.66.53.0/24 --sport 22 -j ACCEPT

# add LOG rule in FORWARD chain if you are working from CLI
echo "-------------------------------------------"
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.36 --dport 3389 -m limit --limit 1/min -j LOG --log-prefix "RDP FORWARD WS-110 "

# Allow forwarding RDP traffic on port 3389 from from Windows Client to Server SN1
echo "-------------------------------------------"
echo "RDP"
echo "Allow forwarding all RDP traffic on port 3389 from any source to any destination"
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.32/27 --dport 3389 -j ACCEPT
iptables -A FORWARD -p tcp -s 172.17.110.32/27 -d 10.66.53.0/24 --sport 3389 -j ACCEPT

# add LOG rule in FORWARD chain if you are working from CLI
echo "-------------------------------------------"
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.36 --dport 53 -m limit --limit 1/min -j LOG --log-prefix "DNS TCP FORWARD WS-110 "
# Firewall Settings to allow specific traffic on Router FORWARD chain
echo "-------------------------------------------"
echo "DNS"
echo "allow any tcp and udp traffic pass through Linux router for DNS protocol"
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.36 --dport 53 -j ACCEPT
iptables -A FORWARD -p tcp -s 172.17.110.36 -d 10.66.53.0/24 --sport 53 -j ACCEPT

# add LOG rule in FORWARD chain if you are working from CLI
echo "-------------------------------------------"
iptables -A FORWARD -p udp -s 10.66.53.0/24 -d 172.17.110.36 --dport 53 -m limit --limit 1/min -j LOG --log-prefix "DNS UDP FORWARD WS-110 "
echo "-------------------------------------------"
echo "DNS"
echo "allow any tcp and udp traffic pass through Linux router for DNS protocol"
iptables -A FORWARD -p udp -s 10.66.53.0/24 -d 172.17.110.36 --dport 53 -j ACCEPT
iptables -A FORWARD -p udp -s 172.17.110.36 -d 10.66.53.0/24 --sport 53 -j ACCEPT

# add LOG rule in FORWARD chain if you are working from CLI
echo "-------------------------------------------"
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.37 --dport 3306 -m limit --limit 1/min -j LOG --log-prefix "MySQL FORWARD LS-110 "
echo "-------------------------------------------"
echo "MySQL"
echo "allow any tcp traffic pass through Source WC-110 subnet to Destination LS-110 for destination MySQL protocol"
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.37 --dport 3306 -j ACCEPT
echo "allow any tcp traffic pass through Source WS-110 to destination WC-110 subnet for source MySQL protocol"
iptables -A FORWARD -p tcp -d 10.66.53.0/24 -s 172.17.110.37 --sport 3306 -j ACCEPT

# add LOG rule in FORWARD chain if you are working from CLI
echo "-------------------------------------------"
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.37 --dport 80 -m limit --limit 1/min -j LOG --log-prefix     "HTTP FORWARD LS-110 "
echo "-------------------------------------------"
echo "Apache"
echo "allow any tcp traffic pass through Source WC-110 subnet to Destination WS-110 for destination Apache protocol"
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.37 --dport 80 -j ACCEPT
echo "allow any tcp traffic pass through Source WS-110 to destination WC-110 subnet for source Apache protocol"
iptables -A FORWARD -p tcp -d 10.66.53.0/24 -s 172.17.110.37 --sport 80 -j ACCEPT

# add LOG rule in FORWARD chain if you are working from CLI
echo "-------------------------------------------"
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.36 --dport 80 -m limit --limit 1/min -j LOG --log-prefix "HTTP FORWARD WS-110 "
echo "-------------------------------------------"
echo "IIS"
echo "allow any tcp traffic pass through Source WC-110 subnet to Destination LR-110 for destination HTTP protocol to access IIS"
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.36 --dport 80 -j ACCEPT
echo "allow any tcp traffic pass through Source LS-110 to destination WC-110 subnet for source HTTP protocol to access IIS"
iptables -A FORWARD -p tcp -d 10.66.53.0/24 -s 172.17.110.36 --sport 80 -j ACCEPT

# add LOG rule in FORWARD chain if you are working from CLI
echo "-------------------------------------------"
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.36 --dport 21 -m limit --limit 1/min -j LOG --log-prefix "FTP CONTROL PLANE FORWARD WS-110 "
echo "-------------------------------------------"
echo "FTP Administration Port"
echo "allow any tcp traffic pass through Source WC-110 subnet to Destination LR-110 for destination FTP protocol"
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.36 --dport 21 -j DROP
echo "allow any tcp traffic pass through Source LS-110 to destination WC-110 subnet for source FTP protocol"
iptables -A FORWARD -p tcp -d 10.66.53.0/24 -s 172.17.110.36 --sport 21 -j ACCEPT

# add LOG rule in FORWARD chain if you are working from CLI
echo "-------------------------------------------"
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.36 --dport 50000:51000 -m limit --limit 1/min -j LOG --log-prefix "FTP DATA PLANE FORWARD WS-110 "
echo "-------------------------------------------"
echo "FTP DATA Port"
echo "allow any tcp traffic pass through Source WC-110 subnet to Destination LR-110 for destination FTP protocol"
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.36 --dport 50000:51000 -j ACCEPT
echo "allow any tcp traffic pass through Source LS -110 to destination WC-110 subnet for source FTP protocol"
iptables -A FORWARD -p tcp -d 10.66.53.0/24 -s 172.17.110.36 --sport 50000:51000 -j ACCEPT

# Log before DROPPING
echo "-------------------------------------------"
echo "Add a rule to LOG instead of DROPPING INPUT packets"
iptables -A FORWARD -p all -m limit --limit 10/s -j LOG  --log-prefix "TO_DROP_FORWARD"

# Reject all other FORWARD traffic from this machine
# echo "-------------------------------------------"
# echo "Reject all other FORWARD traffic from this machine"
iptables -A FORWARD -j DROP

# add LOG rule in OUTPUT chain if you are updating iptables script in-line
iptables -A OUTPUT -p tcp -d 10.66.53.0/24 -s 192.168.110.36 --sport 22 -m limit --limit 1/min -j LOG --log-prefix "SSH OUTPUT WC-110 "

# Allow all output traffic from this machine
echo "-------------------------------------------"
echo "Allow all output traffic from this machine"
iptables -A OUTPUT -j ACCEPT

# Allow all output traffic from this machine
echo "-------------------------------------------"
echo "Allow all output traffic from this machine"
#iptables -A OUTPUT -p tcp -d 192.168.110.36 -s 10.66.53.0/24 --sport 22 ACCEPT

# List current iptables status
echo "-------------------------------------------"
echo "list current iptables status"
iptables -nvL --line-number
