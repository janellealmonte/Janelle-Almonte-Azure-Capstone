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
4. [Part D - Network Review Questions](#part-d---network-review-questions)

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

az network route-table show -n RT-110 -g Student-RG-846404 --query "{subnetId: subnets[].id, nextHopType: routes[].nextHopType, destinationIpAddress: routes[].nextHopIpAddress}" --out json

```json
{
  "destinationIpAddress": [
    "192.168.110.36",
    "192.168.110.36"
  ],
  "nextHopType": [
    "VirtualAppliance",
    "VirtualAppliance"
  ],
  "subnetId": [
    "/subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourceGroups/Student-RG-846404/providers/Microsoft.Network/virtualNetworks/Server-110/subnets/SN1",
    "/subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourceGroups/Student-RG-846404/providers/Microsoft.Network/virtualNetworks/Student-846404-vnet/subnets/Virtual-Desktop-Client"
  ]
}
```

**5. List all routes in RT-xx using az network route-table route list command and send the output in table format to route_list.tbl file**

- [route_list.tbl](https://github.com/144525201-myseneca/CSN400-Capstone/blob/3464322daca2dd876b6dc0d12d0f05aaf76d11d7/Checkpoint4/Part_C/route_list.tbl)

**6. Get the details of route between your Router-xx SN1 and Server-xx SN using az network route-table route show and send the output in json format to route_details.json**

- [route_details.json](https://github.com/144525201-myseneca/CSN400-Capstone/blob/3464322daca2dd876b6dc0d12d0f05aaf76d11d7/Checkpoint4/Part_C/route_details.json)

**7. (Optional) What CLI command will show you which subnet is associated to which route in toute table? (Hint: maybe start with 'az network vnet subnet show`)**

### Part D - Network Review Questions

**1. What is Azure Virtual Network (VNET)? Elaborate in your own words, you may use diagrams if drawn by yourself.**

Azure Virtual Network (VNET) is like a virtualized version of a traditional network that allows you to securely connect and manage resources in the cloud. It's a way to virtually isolate and network your Azure resources so that they can communicate with each other securely, just like your on-premises resources. Think of it like creating your own little neighborhood in the cloud where your resources can live, work and play together. You can customize and configure your virtual network to suit your needs and ensure that your resources are isolated from the public internet and other tenants. With VNET, you can establish a secure connection between your on-premises network and the Azure cloud, enabling you to use the cloud as an extension of your own network.

**2. In the context of Hybrid Cloud architecture. How on-prem computers can access resources inside Azure virtual network?**

By connecting your on-premises network to a cross-premises Azure virtual network, you're essentially extending your network into the cloud. This allows you to include subnets and virtual machines hosted within Azure infrastructure services as part of your network. This connection creates a direct pathway for your on-premises computers to access the virtual machines in Azure, and for those virtual machines to access your on-premises resources. Think of it as a bridge that connects your in-house network with your virtual network in the cloud, enabling seamless communication and collaboration between the two.

**3. What are the most important benefits of Azure Virtual Networks? Elaborate in your own words. Do not copy/paste from Azure Documentation. Itemized list of just benefit without proper elaboration will not receive any marks**

Azure Virtual Networks offer a range of benefits for organizations looking to move their infrastructure to the cloud. Some of the most important benefits include:

- Network security: Azure Virtual Networks provide a secure environment for your cloud resources, using firewall rules and network security groups to control inbound and outbound traffic.

- Network segmentation: By creating multiple virtual networks within your Azure subscription, you can segment your network into smaller, isolated sections, making it easier to manage security and network traffic.

- Increased network control: Azure Virtual Networks give you greater control over your network, allowing you to manage your own IP address space, configure custom domain name system (DNS) settings, and more.

- Scalability: Azure Virtual Networks can be scaled up or down as needed, giving you the flexibility to adjust your network to meet the changing needs of your organization.

- Hybrid connectivity: Azure Virtual Networks allow you to connect to on-premises resources, giving you the ability to extend your network to the cloud and provide a seamless experience for your end-users.

- Cost savings: By using Azure Virtual Networks, you can reduce costs associated with network infrastructure, as you only pay for what you use and can take advantage of Azure's cost-effective pricing model.

In summary, Azure Virtual Networks provide organizations with a highly secure and flexible network infrastructure, giving them the control they need to manage their cloud resources and connect to on-premises resources as needed.

**4. What is the difference between Network Security Group (NSG) and Route-Tables?**

Think of it this way, imagine you're the security guard in charge of a building. A Network Security Group (NSG) is like the security checkpoint at the entrance of the building, where you check and control who enters and leaves. You can allow or deny access to specific individuals or groups based on certain rules and protocols. On the other hand, a Route Table is like the building's map or blueprint. It specifies the direction and path of how traffic flows within the building. You can use Route Tables to control the flow of traffic between different subnets and even to different buildings. So in a nutshell, an NSG controls access to the resources in your network, while a Route Table controls the flow of traffic within the network.

**5. What is the difference between NSG and Firewalls?**

NSGs and firewalls are both security features that are used to protect your network and its resources, but they work in slightly different ways. Think of NSGs as traffic cop for your network. NSGs allow you to control inbound and outbound network traffic to your virtual network and its resources based on a set of predefined rules. You can set these rules to only allow specific types of traffic to reach your virtual network, such as HTTP traffic from a specific IP address. Firewalls, on the other hand, are a more comprehensive network security solution that often come with more advanced features such as application-level traffic inspection, intrusion detection and prevention, and even URL filtering. A firewall acts as a barrier to protect your network from malicious traffic and unauthorized access. So while NSGs are great for controlling the flow of network traffic, firewalls offer a more complete and robust security solution for your network. In general, you would use NSGs in combination with firewalls to provide a multi-layered approach to network security.

**6. What is a hob-and-spoc network topology and how be deployed in Azure Cloud?**

A hub-and-spoke network topology in Azure Cloud refers to a design pattern where multiple virtual networks (spokes) are connected to a central virtual network (hub). This design allows for better network segmentation and security, as well as easier communication between the spoke virtual networks and the shared resources in the hub virtual network. To deploy a hub-and-spoke network topology in Azure, you would first create a hub virtual network and configure it with the shared resources and services that the spoke virtual networks will need access to. Then, you would create the spoke virtual networks and connect each one to the hub virtual network using a virtual network peering connection. By using a hub-and-spoke design, you can effectively manage and secure your network resources while still allowing for efficient communication between the different parts of your network.

**7. In working with Azure VNETs, do you need to define gateways for Azure to route traffic between subnets?**

Yes, when working with Azure virtual networks (VNETs), you usually need to define gateways in order for Azure to route traffic between subnets. This is because subnets within a VNET are isolated from each other by default, and a gateway allows communication between the subnets and between the VNET and other networks.

**8. When do you need to configure and use Virtual Network Gateways?**

Virtual Network Gateways are used in Microsoft Azure to securely connect Virtual Networks (VNets) to other networks, such as on-premises networks or other VNets.**

You need to configure and use a Virtual Network Gateway when you want to:

- Connect a VNet to an on-premises network over an IPsec/IKE VPN tunnel.
- Connect multiple VNets to each other using VNet-to-VNet connections.
- Connect VNets to Microsoft ExpressRoute circuits for a high-bandwidth, low-latency connection.

In general, a Virtual Network Gateway is necessary when you want to establish a secure and stable connection between Azure VNets and other networks for communication and data exchange purposes.
