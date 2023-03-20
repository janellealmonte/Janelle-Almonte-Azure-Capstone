# Checkpoint7 Submission ✔️

- **COURSE INFORMATION: CSN 400-Computer Systems Projects**
- **STUDENT’S NAME: Janelle Marie Almonte**
- **STUDENT'S NUMBER: 144525201**
- **GITHUB USER ID: 144525201-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

## Table of Contents 📚
1. [Part A - Logging Packets with Specific Prefixes](#part-a---logging-packets-with-specific-prefixes)
2. [Part B - Filtering Logged Packets](#part-b---filtering-logged-packets)
3. [Part C - Analyzing Logged Packets](#part-c---analyzing-logged-packets)
4. [Part D - Azure Cost Analysis Charts](#part-d---azure-cost-analysis-charts)

### Part A - Logging Packets with Specific Prefixes

**To monitor certain types of network traffic, I incorporated logging rules into the firewall configuration. You may access the script utilized for configuring the firewall logging rules and the output of the 'iptables -nvL' command via the link provided below:**

- [lr_firewall_log.sh](https://github.com/144525201-myseneca/CSN400-Capstone/blob/cb30ead48f0cbcc5728ea31bc019dea7945e581f/Checkpoint7/PART_A/lr_firewall_log.sh)
- [lr_firewall_log.txt](https://github.com/144525201-myseneca/CSN400-Capstone/blob/cb30ead48f0cbcc5728ea31bc019dea7945e581f/Checkpoint7/PART_A/lr_firewall_log.txt)

```bash
Chain INPUT (policy ACCEPT 18 packets, 720 bytes)
 pkts bytes target     prot opt in     out     source               destination
 4137  794K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    3   180 ACCEPT     icmp --  *      *       10.66.53.0/24        192.168.110.36
    0     0 ACCEPT     all  --  lo     *       127.0.0.0/24         10.66.53.0/24
    1    52 LOG        tcp  --  *      *       10.66.53.0/24        192.168.110.36       tcp dpt:22 limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "SSH INPUT LR-110 "
    1    52 ACCEPT     tcp  --  *      *       10.66.53.0/24        192.168.110.36       state NEW tcp dpt:22
    2   144 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_INPUT"
    2   144 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy ACCEPT 2 packets, 130 bytes)
 pkts bytes target     prot opt in     out     source               destination
   10   688 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.37        tcp dpt:22 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "SSH FORWARD LS-110 "
   33  4325 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.32/27     tcp dpt:22
   37  5241 ACCEPT     tcp  --  *      *       172.17.110.32/27     10.66.53.0/24        tcp spt:22
   23   920 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:3389 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "RDP FORWARD WS-110 "
 1107  143K ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.32/27     tcp dpt:3389
 1113  172K ACCEPT     tcp  --  *      *       172.17.110.32/27     10.66.53.0/24        tcp spt:3389
    5   274 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:53 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "DNS TCP FORWARD WS-110 "
   72  3656 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:53
   64  4056 ACCEPT     tcp  --  *      *       172.17.110.36        10.66.53.0/24        tcp spt:53
   15   983 LOG        udp  --  *      *       10.66.53.0/24        172.17.110.36        udp dpt:53 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "DNS UDP FORWARD WS-110 "
   63  4327 ACCEPT     udp  --  *      *       10.66.53.0/24        172.17.110.36        udp dpt:53
   39  5698 ACCEPT     udp  --  *      *       172.17.110.36        10.66.53.0/24        udp spt:53
    5   222 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.37        tcp dpt:3306 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "MySQL FORWARD LS-110 "
   26  2339 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.37        tcp dpt:3306
   22 11580 ACCEPT     tcp  --  *      *       172.17.110.37        10.66.53.0/24        tcp spt:3306
    5   610 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.37        tcp dpt:80 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "HTTP FORWARD LS-110 "
   10   810 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.37        tcp dpt:80
    6   708 ACCEPT     tcp  --  *      *       172.17.110.37        10.66.53.0/24        tcp spt:80
    5   610 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:80 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "HTTP FORWARD WS-110 "
    9   770 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:80
    6  1647 ACCEPT     tcp  --  *      *       172.17.110.36        10.66.53.0/24        tcp spt:80
    5   244 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:21 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "FTP CONTROL PLANE FORWARD WS-"
   20   962 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:21
   23  1545 ACCEPT     tcp  --  *      *       172.17.110.36        10.66.53.0/24        tcp spt:21
    4   172 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpts:50000:51000 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "FTP DATA PLANE FORWARD WS-110"
    4   172 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpts:50000:51000
    4   332 ACCEPT     tcp  --  *      *       172.17.110.36        10.66.53.0/24        tcp spts:50000:51000
    3  3780 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_FORWARD"
    3  3780 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT 427 packets, 61328 bytes)
 pkts bytes target     prot opt in     out     source               destination
   23  1988 LOG        tcp  --  *      *       192.168.110.36       10.66.53.0/24        tcp spt:22 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "SSH OUTPUT WC-110 "
 4856 1244K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0
```

### Part B - Filtering Logged Packets

The filtered logged packets found in var/log/messages can be found [here](https://github.com/144525201-myseneca/CSN400-Capstone/blob/a498c1bde1d73bf4ecec891e0626bbef668f2db6/Checkpoint7/PART_B/logged_packets.log).

**A NEW SSH session from Windows Client to Linux Router**

```bash
Mar 19 03:21:05 LR-110 kernel: SSH FORWARD LS-110 IN=eth0 OUT=eth0 MAC=00:22:48:ae:41:5f:c0:d6:82:33:be:00:08:00 SRC=10.66.53.4 DST=172.17.110.37 LEN=76 TOS=0x00 PREC=0x00 TTL=127 ID=28922 DF PROTO=TCP SPT=52992 DPT=22 WINDOW=2049 RES=0x00 ACK PSH URGP=0
```

**A NEW SSH session response from Linux Router to Windows Client**

```bash
Mar 19 03:23:36 LR-110 kernel: RDP FORWARD WS-110 IN=eth0 OUT=eth0 MAC=00:22:48:ae:41:5f:c0:d6:82:33:be:00:08:00 SRC=10.66.53.4 DST=172.17.110.36 LEN=224 TOS=0x00 PREC=0x00 TTL=127 ID=24155 DF PROTO=TCP SPT=53681 DPT=3389 WINDOW=2051 RES=0x00 ACK PSH URGP=0
```

**A DNS request from Windows Client, requesting the FQDN of the IIS server**

```bash
Mar 19 03:25:28 LR-110 kernel: DNS TCP FORWARD WS-110 IN=eth0 OUT=eth0 MAC=00:22:48:ae:41:5f:c0:d6:82:33:be:00:08:00 SRC=10.66.53.4 DST=172.17.110.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=24524 DF PROTO=TCP SPT=53704 DPT=53 WINDOW=64240 RES=0x00 SYN URGP=0
```

**An HTTP request from Windows Client to the IIS Server**

```bash
Mar 19 03:27:02 LR-110 kernel: HTTP FORWARD WS-110 IN=eth0 OUT=eth0 MAC=00:22:48:ae:41:5f:c0:d6:82:33:be:00:08:00 SRC=10.66.53.4 DST=172.17.110.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=24634 DF PROTO=TCP SPT=53724 DPT=80 WINDOW=64240 RES=0x00 SYN URGP=0      
```

**A DNS request from Windows Client, requesting the FQDN of the APACHE server**

```bash
Mar 19 03:28:33 LR-110 kernel: DNS TCP FORWARD LS-110 IN=eth0 OUT=eth0 MAC=00:22:48:ae:41:5f:c0:d6:82:33:be:00:08:00 SRC=10.66.53.4 DST=172.17.110.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=24711 DF PROTO=TCP SPT=53736 DPT=53 WINDOW=64240 RES=0x00 SYN URGP=0
```

**An HTTP request from Windows Client to the APACHE Server**

```bash
Mar 19 03:29:31 LR-110 kernel: HTTP FORWARD LS-110 IN=eth0 OUT=eth0 MAC=00:22:48:ae:41:5f:c0:d6:82:33:be:00:08:00 SRC=10.66.53.4 DST=172.17.110.37 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=28925 DF PROTO=TCP SPT=53746 DPT=80 WINDOW=64240 RES=0x00 SYN URGP=0  
```

**A MySQL request from Windows Client to Linux Server**

```bash
Mar 19 03:30:30 LR-110 kernel: MySQL FORWARD LS-110 IN=eth0 OUT=eth0 MAC=00:22:48:ae:41:5f:c0:d6:82:33:be:00:08:00 SRC=10.66.53.4 DST=172.17.110.37 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=28936 DF PROTO=TCP SPT=53755 DPT=3306 WINDOW=64240 RES=0x00 SYN URGP=0  
```

**An FTP request from Windows Client to Windows Server**

```bash
Mar 19 03:32:39 LR-110 kernel: FTP CONTROL PLANE FORWARD WS-110 IN=eth0 OUT=eth0 MAC=00:22:48:ae:41:5f:c0:d6:82:33:be:00:08:00 SRC=10.66.53.4 DST=172.17.110.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=24992 DF PROTO=TCP SPT=53808 DPT=21 WINDOW=64240 RES=0x00 SYN URGP=0
```

### Part C - Analyzing Logged Packets

The following table shows information about the packets that were filtered and logged in var/log/messages:


| Packet ID | Date   | MAC Address                | Protocol | Source Address | Dest. Address    | Source Port | Dest. Port | Packet Length | LOG Prefix               | Time To Live |
|-----------|--------|----------------------------|----------|----------------|------------------|-------------|------------|---------------|--------------------------|--------------|
| 1         | Mar 19 | 00:22:48:ae:41:5f:c0:d6:82 | TCP      | 10.66.53.4     | 172.17.110.37   | 52992        | 22         | 76            | SSH FORWARD LS-110       | 127          |
| 2         | Mar 19 | 00:22:48:ae:41:5f:c0:d6:82 | TCP      | 10.66.53.4     | 172.17.110.36   | 53681        | 3389       | 224           | RDP FORWARD WS-110       | 127          |
| 3         | Mar 19 | 00:22:48:ae:41:5f:c0:d6:82 | TCP      | 10.66.53.4     | 172.17.110.36   | 53704        | 53         | 52            | DNS TCP FORWARD WS-110   | 127          |
| 4         | Mar 19 | 00:22:48:ae:41:5f:c0:d6:82 | TCP      | 10.66.53.4     | 172.17.110.36   | 53724        | 80         | 52            | HTTP FORWARD WS-110      | 127          |
| 5         | Mar 19 | 00:22:48:ae:41:5f:c0:d6:82 | TCP      | 10.66.53.4     | 172.17.110.36   | 53736        | 53         | 52            | DNS TCP FORWARD LS-110   | 127          |
| 6         | Mar 19 | 00:22:48:ae:41:5f:c0:d6:82 | TCP      | 10.66.53.4     | 172.17.110.37   | 53746        | 80         | 52            | HTTP FORWARD LS-110      | 127          |
| 7         | Mar 19 | 00:22:48:ae:41:5f:c0:d6:82 | TCP      | 10.66.53.4     | 172.17.110.37   | 53755        | 3306       | 52            | MySQL FORWARD LS-110     | 127          |
| 8         | Mar 19 | 00:22:48:ae:41:5f:c0:d6:82 | TCP      | 10.66.53.4     | 172.17.110.36   | 53808        | 21         | 52            | FTP CONTROL PLANE WS-110 | 127          |


### Part D - Azure Cost Analysis Charts
