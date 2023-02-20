# Checkpoint6 Submission ✔️

- **COURSE INFORMATION: CSN 400-Computer Systems Projects**
- **STUDENT’S NAME: Janelle Marie Almonte**
- **STUDENT'S NUMBER: 144525201**
- **GITHUB USER ID: 144525201-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

## Table of Contents 📚
1. [Part A - DevTest Lab VM Configuration](#part-a---devtest-lab-vm-configuration)
2. [Part B - Linux VMs Firewall Setting](#part-b---linux-vms-firewall-setting)
3. [Part C - Enable IP Forwarding in NIC](#part-c---enable-ip-forwarding-in-nic)
4. [Part D - Basic Connectivity](#part-d---basic-connectivity)
5. [Part E - Azure Cost Analysis Charts](#part-e---azure-cost-analysis-charts)

### Part A - DevTest Lab VM Configuration

```markdown
# Windows 10 Client :  WC-110
Base Image:  Windows 10 Pro 21H1

Install the following applications:  
- Notepad++, Filezilla FTP client, MySQL shell (MySQL client)

# Linux Router :  LR-110
Base Image:  Red Hat Linux Enterprise 8.0

# Windows Server :  WS-110
Base Image:  Windows 2019 Datacenter

Optional - Perform the following configuration tasks:
- Install Wireshark, Firefox

# Linux Server : LS-110
Base Image:  Red Hat Linux Enterprise 8.0
```

### Part B - Linux VMs Firewall Setting

```
Please see iptables folder
```

### Part C - Enable ip-forwarding in NIC

```json
{
  "ipForwardingEnabled": true,
  "name": "lr-110"
}
```

### Part D - Basic Connectivity

```
[jmalmonte@LR-110 workfolder]$ sudo iptables -nvL

Chain INPUT (policy ACCEPT 2 packets, 80 bytes)
 pkts bytes target     prot opt in     out     source               destination
13056 2268K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
    2   104 ACCEPT     tcp  --  *      *       10.66.53.0/24        0.0.0.0/0            state NEW tcp dpt:22
   22  3280 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_INPUT"
   22  3280 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
   60  5753 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.32/27     tcp dpt:22
   42  5437 ACCEPT     tcp  --  *      *       172.17.110.32/27     10.66.53.0/24        tcp spt:22
 2807  184K ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.32/27     tcp dpt:3389
 3324  512K ACCEPT     tcp  --  *      *       172.17.110.32/27     10.66.53.0/24        tcp spt:3389
    3  3780 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_FORWARD"
    3  3780 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT 20 packets, 2576 bytes)
 pkts bytes target     prot opt in     out     source               destination
18255 3910K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0

[jmalmonte@LR-110 workfolder]$ sudo iptables -nvL

Chain INPUT (policy ACCEPT 2 packets, 80 bytes)
 pkts bytes target     prot opt in     out     source               destination
13215 2304K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
    2   104 ACCEPT     tcp  --  *      *       10.66.53.0/24        0.0.0.0/0            state NEW tcp dpt:22
   22  3280 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_INPUT"
   22  3280 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
   87  9622 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.32/27     tcp dpt:22
   68  9878 ACCEPT     tcp  --  *      *       172.17.110.32/27     10.66.53.0/24        tcp spt:22
 3108  242K ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.32/27     tcp dpt:3389
 3638  603K ACCEPT     tcp  --  *      *       172.17.110.32/27     10.66.53.0/24        tcp spt:3389
    6  7560 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_FORWARD"
    6  7560 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT 20 packets, 2576 bytes)
 pkts bytes target     prot opt in     out     source               destination
18467 3967K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0

[jmalmonte@LR-110 workfolder]$ sudo iptables -nvL

Chain INPUT (policy ACCEPT 2 packets, 80 bytes)
 pkts bytes target     prot opt in     out     source               destination
14090 2512K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
    2   104 ACCEPT     tcp  --  *      *       10.66.53.0/24        0.0.0.0/0            state NEW tcp dpt:22
   24  3424 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_INPUT"
   24  3424 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
  115 13567 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.32/27     tcp dpt:22
   95 14419 ACCEPT     tcp  --  *      *       172.17.110.32/27     10.66.53.0/24        tcp spt:22
 3532  303K ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.32/27     tcp dpt:3389
 4055  669K ACCEPT     tcp  --  *      *       172.17.110.32/27     10.66.53.0/24        tcp spt:3389
    9 11340 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_FORWARD"
    9 11340 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT 20 packets, 2576 bytes)
 pkts bytes target     prot opt in     out     source               destination
19656 4287K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0
```

**Run a command in CLI that lists all your Custom Images in your DevTest Lab environment. Hint: `az lab custom-image list ...`**

![Custom_Image](https://github.com/144525201-myseneca/CSN400-Capstone/blob/bdcad82bb01b2c346a43a6b870156d1bff98b3eb/Checkpoint6/images/custom_images.png)

**Delete your VMs after your work is completed. Run a command in CLI that lists all your VMs in your DEvTEst Lab environment. Hint: `az lab vm list ...`**

![Delete_VM](https://github.com/144525201-myseneca/CSN400-Capstone/blob/bdcad82bb01b2c346a43a6b870156d1bff98b3eb/Checkpoint6/images/virtual_machines.png)

### Part E - Azure Cost Analysis Charts

1. Column (Stacked) - DailyCosts - Last 7 Days - Resource - Daily

![Chart1](https://github.com/144525201-myseneca/CSN400-Capstone/blob/7c2260f5be092bb602e6b7f0f15713d6e24c2b0b/Checkpoint6/images/chart1.png)

This filter displays a stacked column chart that breaks down daily costs of virtual machines over the past 7 days, helping me monitor and optimize my usage and spending. It's a convenient way to get a clear visual representation of the costs for each individual virtual machine on a daily basis in Azure.

2. Column (Stacked) - DailyCosts - Last 7 Days - Service - Daily

![Chart2](https://github.com/144525201-myseneca/CSN400-Capstone/blob/7c2260f5be092bb602e6b7f0f15713d6e24c2b0b/Checkpoint6/images/chart2.png)

This filter shows a stacked column chart of daily costs for different services in Azure over the past 7 days, providing a clear picture of my spending and how it has changed over time. It's a useful tool for monitoring and optimizing my usage of Azure services, and for making informed decisions about how to use them more efficiently. In short, the "Column (Stacked) - DailyCosts - Last 7 Days - Service - Daily" filter helps me analyze and manage my Azure service costs on a daily basis.

3. Area	AccumulatedCosts - Last 7 Days - Resource - Accumulated

![Chart3](https://github.com/144525201-myseneca/CSN400-Capstone/blob/7c2260f5be092bb602e6b7f0f15713d6e24c2b0b/Checkpoint6/images/chart3.png)

This filter displays an area chart that shows the total cost of my virtual machines over the last 7 days. By analyzing this chart, I can track the trend of my virtual machine costs over time and identify opportunities to optimize my usage and save money. The "Area AccumulatedCosts - Last 7 Days - Resource - Accumulated" filter is a convenient tool for monitoring the accumulated cost of the virtual machines in Azure.

4. Pie Chart - Service Name

***last month***

![Chart4_LastMonth](https://github.com/144525201-myseneca/CSN400-Capstone/blob/7c2260f5be092bb602e6b7f0f15713d6e24c2b0b/Checkpoint6/images/chart4_lastmonth.png)

This filter offers a concise pie chart view of the cost distribution across various services in Azure over the last month. By analyzing this chart, I can quickly determine which services are consuming the most resources and contributing the most to my total costs. 

***last 30 days***

![Chart4_Last30Days](https://github.com/144525201-myseneca/CSN400-Capstone/blob/7c2260f5be092bb602e6b7f0f15713d6e24c2b0b/Checkpoint6/images/chart4_last30days.png)

This filter is pretty similar to the last one, with the exception that it covers the last 30 days instead of just a month. I wanted to include this screenshot to show you that unfortunately, we won't see any data for the last month filter because we just started using Azure.

However, what we do see in this screenshot is a pie chart that breaks down the proportion of costs associated with each service in Azure. From the chart, we can see that Storage, Virtual Machines, Virtual Machines License, Bandwidth, and Virtual Network are the services consuming the most resources. This information can be valuable for you to identify where you can make adjustments and optimize costs in Azure.

5. Pie Chart - Service Family

***last month***

![Chart5_LastMonth](https://github.com/144525201-myseneca/CSN400-Capstone/blob/7c2260f5be092bb602e6b7f0f15713d6e24c2b0b/Checkpoint6/images/chart5_lastmonth.png)

This filter shows a pie chart that breaks down the proportion of costs for each service family in Azure over the last month. It provides a clear view of which service families are consuming the most resources and driving up my Azure costs. While this filter returned no results due to a lack of activity in the last month, it can still be a valuable tool for optimizing costs by identifying high-cost service families.

***last 30 days***

![Chart5_Last30Days](https://github.com/144525201-myseneca/CSN400-Capstone/blob/7c2260f5be092bb602e6b7f0f15713d6e24c2b0b/Checkpoint6/images/chart5_last30days.png)

This filter is similar to the previous one, but with a different time range of the last 30 days. It displays a pie chart that breaks down the proportion of costs associated with different service families in Azure. From the chart, we can see that the service families of Compute, Storage, and Networking are the ones that have been costing me the most money over the last 30 days.

6. Pie Chart - Product

***last month***

![Chart6_LastMonth](https://github.com/144525201-myseneca/CSN400-Capstone/blob/7c2260f5be092bb602e6b7f0f15713d6e24c2b0b/Checkpoint6/images/chart6_lastmonth.png)
This filter provides me with a breakdown of costs for each product I'm using in Azure, helping me identify which products are consuming the most resources and contributing the most to my total costs.

***last 30 days***

![Chart6_Last30Days](https://github.com/144525201-myseneca/CSN400-Capstone/blob/7c2260f5be092bb602e6b7f0f15713d6e24c2b0b/Checkpoint6/images/chart6_last30days.png)

I've applied the same filter as before, but with a date range of the last 30 days. The screenshot displays the products that have consumed the most resources during this period. In this example, the top five products are Red Hat Enterprise Linux, Virtual Machine BS Series Windows, Standard HDD Managed Disks, Files - LRS - CA Central, and a group of other products.
