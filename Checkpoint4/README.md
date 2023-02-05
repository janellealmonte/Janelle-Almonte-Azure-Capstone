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
![network topology diagram](https://github.com/144525201-myseneca/CSN400-Capstone/blob/b4f5b5005cd3abbef4d76a8bab6b33fb2ef353d8/Checkpoint4/images/networkdiagramcp4.png)

The above diagram describes the network topology, displaying the relationships between the Student VNET, Router VNET, and Server VNET. These virtual networks are interconnected through VNET peering, resulting in a seamless flow of communication between them.

The Student VNET includes a single Windows Client, the Router VNET is equipped with a Linux Router, and the Server VNET encompasses both a Windows Server and a Linux Server. The diagram also presents a table that showcases the routing information, including the Route Name, Destination, Next Hop Type, and Next Hop IP.

Diagram created via [Draw.io](https://www.draw.io)

### PART B - Creating Resources in Azure Portal

### PART C - Working in Azure CLI in Bash
1. List all VNETs using az network vnet list command and send the output in json format to vnet_list.jsonfile
```
https://github.com/144525201-myseneca/CSN400-Capstone/blob/eeb15e71ec04aa70f701c486b220563c150ad5db/Checkpoint4/Part_C/vnet_list.json
```
2. Get the details of your default student VNET using az show command and send the output in json format to student_vnet.json file
3. List all peerings using az peering peering list command and send the output in table format to peerings.tblfile
4. Get the details of your Router-XX subnet SN1 using az show command in json format and query it for details of subnet and rout associations. Only submit the specific property you are asked for. You will need to embed this in your README.md as per instructions This one is not easy ☀️
5. List all routes in RT-xx using az network route-table route list command and send the output in table format to route_list.tblfile
6. Get the details of route between your Router-xx SN1 and Server-xx SN using az network route-table route show and send the output in json format to route_details.json
7. (Optional) What CLI command will show you which subnet is associated to which route in toute table? (Hint: maybe start with 'az network vnet subnet show`)

### Part D - Network Review Questions
