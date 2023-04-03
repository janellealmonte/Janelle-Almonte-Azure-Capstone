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

**PS /home/odl_user> az network route-table list --output table**                                                                                             

```bash                                               
DisableBgpRoutePropagation    Location       Name       ProvisioningState    ResourceGroup      ResourceGuid
----------------------------  -------------  ---------  -------------------  -----------------  ------------------------------------
False                         canadacentral  RT-110     Succeeded            Student-RG-846404  1ab4a3a4-46a4-4770-a2f9-98d57568962d
False                         canadacentral  RT-EX-110  Succeeded            Student-RG-846404  650cab74-7a57-488b-972e-525f62b8a4ff
```

**PS /home/odl_user> az network route-table route list --resource-group Student-RG-846404 --route-table-name RT-110 --output table**                          

```bash                                                
AddressPrefix      HasBgpOverride    Name             NextHopIpAddress    NextHopType       ProvisioningState    ResourceGroup
-----------------  ----------------  ---------------  ------------------  ----------------  -------------------  -----------------
172.17.110.32/27   False             RouterServer     192.168.110.36      VirtualAppliance  Succeeded            Student-RG-846404
10.66.53.0/24      False             RouterStudent    192.168.110.36      VirtualAppliance  Succeeded            Student-RG-846404
192.168.133.32/27  False             External-Router  192.168.110.36      VirtualAppliance  Succeeded            Student-RG-846404
```

**PS /home/odl_user> az network route-table route list --resource-group Student-RG-846404 --route-table-name RT-EX-110 --output table**                       

```bash                                              
AddressPrefix      HasBgpOverride    Name          NextHopIpAddress    NextHopType       ProvisioningState    ResourceGroup
-----------------  ----------------  ------------  ------------------  ----------------  -------------------  -----------------
192.168.133.32/27  False             Route-to-Hub  192.168.99.36       VirtualAppliance  Succeeded            Student-RG-846404
```

**PS /home/odl_user> az network vnet subnet list --resource-group Student-RG-846404 --vnet-name Router-110 --query "[].{Name:name, RouteTable:routeTable.id}" --output table**

```bash 
Name    RouteTable
------  --------------------------------------------------------------------------------------------------------------------------------------
SN2
SN3
SN4
SN1     /subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourceGroups/Student-RG-846404/providers/Microsoft.Network/routeTables/RT-EX-110
```

**PS /home/odl_user> az network vnet subnet list --resource-group Student-RG-846404 --vnet-name Server-110 --query "[].{Name:name, RouteTable:routeTable.id}" --output table**

```bash 
Name    RouteTable
------  -----------------------------------------------------------------------------------------------------------------------------------
SN2
SN3
SN4
SN1     /subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourceGroups/Student-RG-846404/providers/Microsoft.Network/routeTables/RT-110
```
 
**PS /home/odl_user> az network vnet subnet list --resource-group Student-RG-846404 --vnet-name Student-846404-vnet --query "[].{Name:name, RouteTable:routeTable.id}" --output table**    

```bash              
Name                    RouteTable
----------------------  -----------------------------------------------------------------------------------------------------------------------------------
Virtual-Desktop-Client  /subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourceGroups/Student-RG-846404/providers/Microsoft.Network/routeTables/RT-110
```

### Part B - Port Forwarding Basic Connectivity



### Part C - Logging & Isolating Masqueraded Packets



### Part D - Azure Cost Analysis Charts

