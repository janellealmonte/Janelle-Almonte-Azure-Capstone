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

```tbl
Author                                         CreationDate                      Description                                         ManagedSnapshotId                                                                                                                      Name        ProvisioningState    ResourceGroup      UniqueIdentifier
---------------------------------------------  --------------------------------  --------------------------------------------------  -------------------------------------------------------------------------------------------------------------------------------------  ----------  -------------------  -----------------  ------------------------------------
odl_user_846404@seneca-csn400ndd.cloudlabs.ai  2023-02-10T05:18:55.495996+00:00  Tasks Completed                                     /subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.compute/snapshots/ws-img-v01  WS-img-v01  Succeeded            student-rg-846404  cbe3cb1b-3c39-4c51-8946-d859983465d5
                                                                                 No connection, no setup
odl_user_846404@seneca-csn400ndd.cloudlabs.ai  2023-02-10T05:20:19.590494+00:00  Tasks Completed:                                    /subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.compute/snapshots/ls-img-v01  LS-img-V01  Succeeded            student-rg-846404  d7e596b4-bf93-4c01-b84b-4497ccaa9eab
                                                                                 No configuration
odl_user_846404@seneca-csn400ndd.cloudlabs.ai  2023-02-10T05:21:03.791154+00:00  Task Completed:                                     /subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.compute/snapshots/lr-img-v01  LR-img-V01  Succeeded            student-rg-846404  7fc5a00d-993f-4d2b-a26c-acc8a22054c7
                                                                                 added linuxkey and tested, working!
odl_user_846404@seneca-csn400ndd.cloudlabs.ai  2023-02-10T05:21:48.157315+00:00  Tasks Completed:                                    /subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.compute/snapshots/wc-img-v01  WC-img-V01  Succeeded            student-rg-846404  4385643d-d44c-410e-90bf-daa5edac9d1e
                                                                                 Added linuxkey, changed extension, tested
odl_user_846404@seneca-csn400ndd.cloudlabs.ai  2023-02-18T22:51:54.778610+00:00  Tasks Completed                                     /subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.compute/snapshots/wc-img-v02  WC-img-v02  Succeeded            student-rg-846404  658e811d-ec82-4a80-971c-fdc2ac729ad8
                                                                                 Installed Notepad++, Filezilla Client, Mysql shell
odl_user_846404@seneca-csn400ndd.cloudlabs.ai  2023-02-18T22:52:59.050185+00:00  Tasks Completed                                     /subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.compute/snapshots/lr-img-v02  LR-img-v02  Succeeded            student-rg-846404  515cb0d7-f104-4454-b8ea-3ae6eeb1ffde
                                                                                 basic config, iptables
odl_user_846404@seneca-csn400ndd.cloudlabs.ai  2023-02-19T02:46:08.679219+00:00  Tasks Completed:                                    /subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.compute/snapshots/ls-img-v02  LS-img-v02  Succeeded            student-rg-846404  b36d5174-a543-4129-be79-0a9783d3ce13
                                                                                 basic config, iptables
```

### Part E - Azure Cost Analysis Charts
