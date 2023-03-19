# Checkpoint7 Submission ✔️

- **COURSE INFORMATION: CSN 400-Computer Systems Projects**
- **STUDENT’S NAME: Janelle Marie Almonte**
- **STUDENT'S NUMBER: 144525201**
- **GITHUB USER ID: 144525201-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

## Table of Contents 📚
1. [Part A - Logging Packets with Specific Prefixes](#part-a--logging-packets-with-specific-prefixes)
2. [Part B - Filtering Logged Packets](#part-b---filtering-logged-packets)
3. [Part C - Analyzing Logged Packets](#part-c---analyzing-logged-packets)
4. [Part D - Azure Cost Analysis Charts](#part-d---azure-cost-analysis-charts)

### Part A - Logging Packets with Specific Prefixes

**To monitor certain types of network traffic, I incorporated logging rules into the firewall configuration. You may access the script utilized for configuring the firewall logging rules and the output of the 'iptables -nvL' command via the link provided below:**

- [lr_firewall_log.sh](https://github.com/144525201-myseneca/CSN400-Capstone/blob/85080870c953fe2310e0565ace1a46e6990b6ddf/Checkpoint7/Part_A_files/lr_firewall.log.sh)
- [lr_firewall_log.txt](https://github.com/144525201-myseneca/CSN400-Capstone/blob/a89d53bd85239e9fa7a11c675eb95651daaee30f/Checkpoint7/Part_A_files/lr_firewall_log.txt)

```bash
Chain INPUT (policy ACCEPT 2 packets, 80 bytes)
 pkts bytes target     prot opt in     out     source               destination
 1274  271K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     icmp --  *      *       10.66.53.0/24        192.168.110.36
    0     0 ACCEPT     all  --  lo     *       127.0.0.0/24         10.66.53.0/24
    0     0 LOG        tcp  --  *      *       10.66.53.0/24        192.168.110.36       tcp dpt:22 limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "SSH INPUT LR-110 "
    0     0 ACCEPT     tcp  --  *      *       10.66.53.0/24        192.168.110.36       state NEW tcp dpt:22
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_INPUT"
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    2   152 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.37        tcp dpt:22 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "SSH FORWARD LS-110 "
    2   152 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.32/27     tcp dpt:22
    4   280 ACCEPT     tcp  --  *      *       172.17.110.32/27     10.66.53.0/24        tcp spt:22
    6   240 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:3389 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "RDP FORWARD WS-110 "
  366  111K ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.32/27     tcp dpt:3389
  305 58253 ACCEPT     tcp  --  *      *       172.17.110.32/27     10.66.53.0/24        tcp spt:3389
    5   275 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:53 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "DNS TCP FORWARD WS-110 "
   72  3662 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:53
   63  4104 ACCEPT     tcp  --  *      *       172.17.110.36        10.66.53.0/24        tcp spt:53
    7   487 LOG        udp  --  *      *       10.66.53.0/24        172.17.110.36        udp dpt:53 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "DNS UDP FORWARD WS-110 "
   28  1845 ACCEPT     udp  --  *      *       10.66.53.0/24        172.17.110.36        udp dpt:53
   24  3138 ACCEPT     udp  --  *      *       172.17.110.36        10.66.53.0/24        udp spt:53
    5   463 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.37        tcp dpt:3306 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "MySQL FORWARD LS-110 "
   23  2209 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.37        tcp dpt:3306
   21 11375 ACCEPT     tcp  --  *      *       172.17.110.37        10.66.53.0/24        tcp spt:3306
    5   610 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.37        tcp dpt:80 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "HTTP FORWARD LS-110 "
   10   810 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.37        tcp dpt:80
    7   748 ACCEPT     tcp  --  *      *       172.17.110.37        10.66.53.0/24        tcp spt:80
    5   610 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:80 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "HTTP FORWARD WS-110 "
    9   770 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:80
    5  1607 ACCEPT     tcp  --  *      *       172.17.110.36        10.66.53.0/24        tcp spt:80
    5   244 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:21 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "FTP CONTROL PLANE FORWARD WS-"
   38  1821 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:21
   41  2794 ACCEPT     tcp  --  *      *       172.17.110.36        10.66.53.0/24        tcp spt:21
    5   224 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpts:50000:51000 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "FTP DATA PLANE FORWARD WS-110"
   13  1314 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpts:50000:51000
   11  1169 ACCEPT     tcp  --  *      *       172.17.110.36        10.66.53.0/24        tcp spts:50000:51000
    3  3780 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_FORWARD"
    3  3780 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT 47 packets, 6708 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 LOG        tcp  --  *      *       192.168.110.36       0.0.0.0/0            tcp dpt:22 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "SSH OUTPUT WC-110 "
 1604  444K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0
```

### Part B - Filtering Logged Packets

**A NEW SSH session from Windows Client to Linux Router**

```bash
Mar 19 02:30:20 LR-110 kernel: SSH INPUT LR-110 IN=eth0 OUT= MAC=00:22:48:ae:41:5f:c0:d6:82:33:be:00:08:00 SRC=10.66.53.4 DST=192.168.110.36 LEN=52 TOS=0x00 PREC=0x00 TTL=128 ID=16960 DF PROTO=TCP SPT=53371 DPT=22 WINDOW=64240 RES=0x00 SYN URGP=0
```

**A NEW SSH session response from Linux Router to Windows Client**

```bash
Mar 19 02:31:37 LR-110 kernel: RDP FORWARD WS-110 IN=eth0 OUT=eth0 MAC=00:22:48:ae:41:5f:c0:d6:82:33:be:00:08:00 SRC=10.66.53.4 DST=172.17.110.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=21742 DF PROTO=TCP SPT=53380 DPT=3389 WINDOW=64240 RES=0x00 SYN URGP=0
```

**A DNS request from Windows Client, requesting the FQDN of the IIS server**

```bash
Mar 19 02:34:14 LR-110 kernel: DNS TCP FORWARD WS-110 IN=eth0 OUT=eth0 MAC=00:22:48:ae:41:5f:c0:d6:82:33:be:00:08:00 SRC=10.66.53.4 DST=172.17.110.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=22219 DF PROTO=TCP SPT=53403 DPT=53 WINDOW=64240 RES=0x00 SYN URGP=0
```

**An HTTP request from Windows Client to the IIS Server**

```bash
Mar 19 02:35:18 LR-110 kernel: HTTP FORWARD WS-110 IN=eth0 OUT=eth0 MAC=00:22:48:ae:41:5f:c0:d6:82:33:be:00:08:00 SRC=10.66.53.4 DST=172.17.110.36 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=22303 DF PROTO=TCP SPT=53390 DPT=80 WINDOW=2052 RES=0x00 ACK FIN URGP=0
```

**A DNS request from Windows Client, requesting the FQDN of the APACHE server**

```bash
Mar 19 02:36:02 LR-110 kernel: DNS TCP FORWARD LS-110 IN=eth0 OUT=eth0 MAC=00:22:48:ae:41:5f:c0:d6:82:33:be:00:08:00 SRC=10.66.53.4 DST=172.17.110.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=22340 DF PROTO=TCP SPT=53419 DPT=53 WINDOW=64240 RES=0x00 SYN URGP=0
```

**An HTTP request from Windows Client to the APACHE Server**

```bash
Mar 19 02:37:01 LR-110 kernel: HTTP FORWARD LS-110 IN=eth0 OUT=eth0 MAC=00:22:48:ae:41:5f:c0:d6:82:33:be:00:08:00 SRC=10.66.53.4 DST=172.17.110.37 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=28875 DF PROTO=TCP SPT=53429 DPT=80 WINDOW=64240 RES=0x00 SYN URGP=0
```

**A MySQL request from Windows Client to Linux Server**

```bash
Mar 19 02:37:57 LR-110 kernel: MySQL FORWARD LS-110 IN=eth0 OUT=eth0 MAC=00:22:48:ae:41:5f:c0:d6:82:33:be:00:08:00 SRC=10.66.53.4 DST=172.17.110.37 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=28885 DF PROTO=TCP SPT=53437 DPT=3306 WINDOW=64240 RES=0x00 SYN URGP=0
```

**An FTP request from Windows Client to Windows Server**

`Mar 19 02:38:47 LR-110 kernel: FTP CONTROL PLANE FORWARD WS-IN=eth0 OUT=eth0 MAC=00:22:48:ae:41:5f:c0:d6:82:33:be:00:08:00 SRC=10.66.53.4 DST=172.17.110.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=22505 DF PROTO=TCP SPT=53446 DPT=21 WINDOW=64240 RES=0x00 SYN URGP=0`

### Part C - Analyzing Logged Packets



### Part D - Azure Cost Analysis Charts



