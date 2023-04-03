# Checkpoint9 Submission ✔️

- **COURSE INFORMATION: CSN 400-Computer Systems Projects**
- **STUDENT’S NAME: Janelle Marie Almonte**
- **STUDENT'S NUMBER: 144525201**
- **GITHUB USER ID: 144525201-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

## Table of Contents 📚
1. [Part A - Route Table Updates](#part-a--route-table-updates)
2. [Part B - Port Forwarding Basic Connectivity](#part-b--port-forwarding-basic-connectivity)
3. [Part C - Logging & Isolating Masqueraded Packets](#part-c--logging--isolating-masqueraded-packets)
4. [Part D - Azure Cost Analysis Charts](#part-d---azure-cost-analysis-charts)


### Part A - Route Table Updates

**ROUTES**

```bash
PS /home/odl_user> az network route-table list --output table                                                                                            

DisableBgpRoutePropagation    Location       Name       ProvisioningState    ResourceGroup      ResourceGuid
----------------------------  -------------  ---------  -------------------  -----------------  ------------------------------------
False                         canadacentral  RT-110     Succeeded            Student-RG-846404  1ab4a3a4-46a4-4770-a2f9-98d57568962d
False                         canadacentral  RT-EX-110  Succeeded            Student-RG-846404  650cab74-7a57-488b-972e-525f62b8a4ff
```

**ROUTE TABLES - RT-110**

```bash
PS /home/odl_user> az network route-table route list --resource-group Student-RG-846404 --route-table-name RT-110 --output table                          
                                                
AddressPrefix      HasBgpOverride    Name             NextHopIpAddress    NextHopType       ProvisioningState    ResourceGroup
-----------------  ----------------  ---------------  ------------------  ----------------  -------------------  -----------------
172.17.110.32/27   False             RouterServer     192.168.110.36      VirtualAppliance  Succeeded            Student-RG-846404
10.66.53.0/24      False             RouterStudent    192.168.110.36      VirtualAppliance  Succeeded            Student-RG-846404
192.168.133.32/27  False             External-Router  192.168.110.36      VirtualAppliance  Succeeded            Student-RG-846404
```

**ROUTE TABLES - RT-EX-110**

```bash
PS /home/odl_user> az network route-table route list --resource-group Student-RG-846404 --route-table-name RT-EX-110 --output table                       
                                              
AddressPrefix      HasBgpOverride    Name          NextHopIpAddress    NextHopType       ProvisioningState    ResourceGroup
-----------------  ----------------  ------------  ------------------  ----------------  -------------------  -----------------
192.168.133.32/27  False             Route-to-Hub  192.168.99.36       VirtualAppliance  Succeeded            Student-RG-846404
```

**ASSOCIATED SUBNETS - ROUTER 110**

```bash
PS /home/odl_user> az network vnet subnet list --resource-group Student-RG-846404 --vnet-name Router-110 --query "[].{Name:name, RouteTable:routeTable.id}" --output table

Name    RouteTable
------  --------------------------------------------------------------------------------------------------------------------------------------
SN2
SN3
SN4
SN1     /subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourceGroups/Student-RG-846404/providers/Microsoft.Network/routeTables/RT-EX-110
```

**ASSOCIATED SUBNETS - SERVER 110**

```bash
PS /home/odl_user> az network vnet subnet list --resource-group Student-RG-846404 --vnet-name Server-110 --query "[].{Name:name, RouteTable:routeTable.id}" --output table

Name    RouteTable
------  -----------------------------------------------------------------------------------------------------------------------------------
SN2
SN3
SN4
SN1     /subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourceGroups/Student-RG-846404/providers/Microsoft.Network/routeTables/RT-110
```
 
**ASSOIATED SUBNETS - STUDENT-846404-VNET**

```bash
PS /home/odl_user> az network vnet subnet list --resource-group Student-RG-846404 --vnet-name Student-846404-vnet --query "[].{Name:name, RouteTable:routeTable.id}" --output table
              
Name                    RouteTable
----------------------  -----------------------------------------------------------------------------------------------------------------------------------
Virtual-Desktop-Client  /subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourceGroups/Student-RG-846404/providers/Microsoft.Network/routeTables/RT-110
```

### Part B - Port Forwarding Basic Connectivity

**[nat_basic-connectivity.sh](https://github.com/144525201-myseneca/CSN400-Capstone/blob/75cfdc156c0b60ca589b5d0fef68bb80b60e82e7/Checkpoint9/links/nat_basic-connectivity.sh)**

```bash
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
```

**[firewalls-cp9.sh](https://github.com/144525201-myseneca/CSN400-Capstone/blob/a7e8371c5a74e91b52accb3c4ce1b074486fe5ec/Checkpoint9/links/firewalls-cp9.sh)**

```bash
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
```

### Part C - Logging & Isolating Masqueraded Packets



### Part D - Azure Cost Analysis Charts

[DAILY COSTS - RESOURCE](https://github.com/144525201-myseneca/CSN400-Capstone/blob/a54ac29bfbf065ca02327cf8ebeccb239aa16ee0/Checkpoint9/Part_D/dailycosts_resource.PNG)

<p align="center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/a54ac29bfbf065ca02327cf8ebeccb239aa16ee0/Checkpoint9/Part_D/dailycosts_resource.PNG" alt="q&a">
</p>


[DAILY COSTS - SERVICE](https://github.com/144525201-myseneca/CSN400-Capstone/blob/a54ac29bfbf065ca02327cf8ebeccb239aa16ee0/Checkpoint9/Part_D/dailycosts_service.PNG)

<p align="center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/a54ac29bfbf065ca02327cf8ebeccb239aa16ee0/Checkpoint9/Part_D/dailycosts_service.PNG" alt="q&a">
</p>


[ACCUMULATED COSTS - RESOURCE](https://github.com/144525201-myseneca/CSN400-Capstone/blob/a54ac29bfbf065ca02327cf8ebeccb239aa16ee0/Checkpoint9/Part_D/accumatedcosts_resource.PNG)

<p align="center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/a54ac29bfbf065ca02327cf8ebeccb239aa16ee0/Checkpoint9/Part_D/accumatedcosts_resource.PNG" alt="q&a">
</p>


[PIE CHART - SERVICE NAME](https://github.com/144525201-myseneca/CSN400-Capstone/blob/a54ac29bfbf065ca02327cf8ebeccb239aa16ee0/Checkpoint9/Part_D/piechart_servicename.PNG)

<p align="center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/a54ac29bfbf065ca02327cf8ebeccb239aa16ee0/Checkpoint9/Part_D/piechart_servicename.PNG" alt="q&a">
</p>


[PIE CHART - SERVICE FAMILY](https://github.com/144525201-myseneca/CSN400-Capstone/blob/a54ac29bfbf065ca02327cf8ebeccb239aa16ee0/Checkpoint9/Part_D/piechart_servicefamily.PNG)

<p align="center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/a54ac29bfbf065ca02327cf8ebeccb239aa16ee0/Checkpoint9/Part_D/piechart_servicefamily.PNG" alt="q&a">
</p>


[PIE CHART - PRODUCT](https://github.com/144525201-myseneca/CSN400-Capstone/blob/a54ac29bfbf065ca02327cf8ebeccb239aa16ee0/Checkpoint9/Part_D/piechart_product.PNG)

<p align="center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/a54ac29bfbf065ca02327cf8ebeccb239aa16ee0/Checkpoint9/Part_D/piechart_product.PNG" alt="q&a">
</p>



