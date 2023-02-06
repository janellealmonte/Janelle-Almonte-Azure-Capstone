# Checkpoint4 Submission ✔️

- **COURSE INFORMATION: CSN 400-Computer Systems Projects**
- **STUDENT’S NAME: Janelle Marie Almonte**
- **STUDENT'S NUMBER: 144525201**
- **GITHUB USER ID: 144525201-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

## Table of Contents 📚
1. [Part A - Creating Your Unique Network Topology](#part-a---creating-your-unique-network-topology)
2. [Part B - Creating Resources in Azure Portal](#part-b---creating-resources-in-azure-portal)
3. [Part C - Working in Azure CLI in Bash](#part-c---working-in-azure-cli-in-bash)

### Part A - Creating Your Unique Network Topology
![network topology diagram](https://github.com/144525201-myseneca/CSN400-Capstone/blob/0b3866dac93454f06ae62ceec7f0a791695be13a/Checkpoint4/images/networkdiagramcp4.png)

The above diagram describes the network topology, displaying the relationships between the Student VNET, Router VNET, and Server VNET. These virtual networks are interconnected through VNET peering, resulting in a seamless flow of communication between them.

The Student VNET includes a single Windows Client, the Router VNET is equipped with a Linux Router, and the Server VNET encompasses both a Windows Server and a Linux Server. The diagram also presents a table that showcases the routing information, including the Route Name, Destination, Next Hop Type, and Next Hop IP.

Diagram created via [Draw.io](https://www.draw.io)

### PART B - Creating Resources in Azure Portal

### VNET Router-110

```bash
#Details:
VNET Name:  Router-110
IPv4 Address Space:  192.168.110.0/24
Subnets:  Create 4
SN1:  192.168.110.32/27
SN2:  192.168.110.64/27
SN3:  192.168.110.96/27
SN4:  192.168.110.128/27
```

### VNET Server-110

```bash
#Details:
VNET Name:  Server-110
IPv4 Address Space:  172.17.110.0/24
Subnets:  Create 4
SN1:  172.17..110.32/27
SN2:  172.17.110.64/27
SN3:  172.17.110.96/27
SN4:  172.17.110.128/27
```

### VNET Peerings

```bash
# Peer the Router Network to the Server Network
Peering Name:  Router110-Server110
Remote Peering Name:  Server110-Router110

# Peer the Router Network to the Student Network
Peering Name:  Router110-Student846404
Remote Peering Name:  Student846404-Router110
```

### Route Table

```bash
Route Table Name:  RT-110

```

### Route Associations
```
-
SN1
172.17.110.32/27
Server-110
-
Virtual-Desktop-Client
10.66.53.0/24
Student-846404-vnet
-
```

### PART C - Working in Azure CLI in Bash
**1. List all VNETs using az network vnet list command and send the output in json format to vnet_list.jsonfile**

- [vnet_list.jsonfile](https://github.com/144525201-myseneca/CSN400-Capstone/blob/eeb15e71ec04aa70f701c486b220563c150ad5db/Checkpoint4/Part_C/vnet_list.json)

**2. Get the details of your default student VNET using az show command and send the output in json format to student_vnet.json file**

- [student_vnet.json](https://github.com/144525201-myseneca/CSN400-Capstone/blob/3464322daca2dd876b6dc0d12d0f05aaf76d11d7/Checkpoint4/Part_C/student_vnet.json)

**3. List all peerings using az peering peering list command and send the output in table format to peerings.tbl file**

- [peerings.tbl](https://github.com/144525201-myseneca/CSN400-Capstone/blob/3464322daca2dd876b6dc0d12d0f05aaf76d11d7/Checkpoint4/Part_C/peerings.tbl)

**4. Get the details of your Router-XX subnet SN1 using az show command in json format and query it for details of subnet and rout associations. Only submit the specific property you are asked for. You will need to embed this in your README.md as per instructions This one is not easy ☀️**

***command used:***

az network vnet subnet show --name SN1 --resource-group Student-RG-846404 --vnet-name Router-110 --query "[{Subnet:name, subNetId:addressPrefix, Route:id}]" --output json

```json
[
  {
    "Route": "/subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourceGroups/Student-RG-846404/providers/Microsoft.Network/virtualNetworks/Router-110/subnets/SN1",
    "Subnet": "SN1",
    "subNetId": "192.168.110.32/27"
  }
]
```

**5. List all routes in RT-xx using az network route-table route list command and send the output in table format to route_list.tbl file**

- [route_list.tbl](https://github.com/144525201-myseneca/CSN400-Capstone/blob/3464322daca2dd876b6dc0d12d0f05aaf76d11d7/Checkpoint4/Part_C/route_list.tbl)

**6. Get the details of route between your Router-xx SN1 and Server-xx SN using az network route-table route show and send the output in json format to route_details.json**

- [route_details.json](https://github.com/144525201-myseneca/CSN400-Capstone/blob/3464322daca2dd876b6dc0d12d0f05aaf76d11d7/Checkpoint4/Part_C/route_details.json)

**7. (Optional) What CLI command will show you which subnet is associated to which route in toute table? (Hint: maybe start with 'az network vnet subnet show`)**

***command used:***

az network vnet subnet show --name SN1 --resource-group Student-RG-846404 --vnet-name Server-110 --query "{ Subnet:name, AddressPrefix:addressPrefix, RouteTable:routeTable.id }"

```json
{
  "AddressPrefix": "172.17.110.32/27",
  "RouteTable": "/subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourceGroups/Student-RG-846404/providers/Microsoft.Network/routeTables/RT-110",
  "Subnet": "SN1"
}
```
