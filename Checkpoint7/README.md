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
- [lr_firewall_log.txt](https://github.com/144525201-myseneca/CSN400-Capstone/blob/8af1ed54282114ef8d41b0187054865cce9a0b16/Checkpoint7/PART_A/lr_firewall_log.txt)

```bash
Chain INPUT (policy ACCEPT 1 packets, 40 bytes)
 pkts bytes target     prot opt in     out     source               destination
10204 2315K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    8   480 ACCEPT     icmp --  *      *       10.66.53.0/24        192.168.110.36
    0     0 ACCEPT     all  --  lo     *       127.0.0.0/24         10.66.53.0/24
    4   208 LOG        tcp  --  *      *       10.66.53.0/24        192.168.110.36       tcp dpt:22 limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "SSH INPUT LR-110 "
    4   208 ACCEPT     tcp  --  *      *       10.66.53.0/24        192.168.110.36       state NEW tcp dpt:22
   14  1680 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_INPUT"
   14  1680 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
   20  1520 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.37        tcp dpt:22 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "SSH FORWARD LS-110 "
   20  1520 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.32/27     tcp dpt:22
   40  2800 ACCEPT     tcp  --  *      *       172.17.110.32/27     10.66.53.0/24        tcp spt:22
    9   627 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:3389 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "RDP FORWARD WS-110 "
  581  122K ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.32/27     tcp dpt:3389
  657  171K ACCEPT     tcp  --  *      *       172.17.110.32/27     10.66.53.0/24        tcp spt:3389
    5   274 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:53 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "DNS TCP FORWARD WS-110 "
   36  1828 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:53
   31  1988 ACCEPT     tcp  --  *      *       172.17.110.36        10.66.53.0/24        tcp spt:53
   32  2240 LOG        udp  --  *      *       10.66.53.0/24        172.17.110.36        udp dpt:53 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "DNS UDP FORWARD WS-110 "
   78  5387 ACCEPT     udp  --  *      *       10.66.53.0/24        172.17.110.36        udp dpt:53
   72  9611 ACCEPT     udp  --  *      *       172.17.110.36        10.66.53.0/24        udp spt:53
    5   463 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.37        tcp dpt:3306 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "MySQL FORWARD LS-110 "
   23  2209 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.37        tcp dpt:3306
   21 11375 ACCEPT     tcp  --  *      *       172.17.110.37        10.66.53.0/24        tcp spt:3306
   10  1220 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.37        tcp dpt:80 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "HTTP FORWARD LS-110 "
   20  1620 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.37        tcp dpt:80
   13  1456 ACCEPT     tcp  --  *      *       172.17.110.37        10.66.53.0/24        tcp spt:80
    5   610 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:80 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "HTTP FORWARD WS-110 "
    9   770 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:80
    6  1647 ACCEPT     tcp  --  *      *       172.17.110.36        10.66.53.0/24        tcp spt:80
    5   244 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:21 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "FTP CONTROL PLANE FORWARD WS-"
   20   962 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpt:21
   23  1545 ACCEPT     tcp  --  *      *       172.17.110.36        10.66.53.0/24        tcp spt:21
    4   172 LOG        tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpts:50000:51000 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "FTP DATA PLANE FORWARD WS-110"
    4   172 ACCEPT     tcp  --  *      *       10.66.53.0/24        172.17.110.36        tcp dpts:50000:51000
    4   332 ACCEPT     tcp  --  *      *       172.17.110.36        10.66.53.0/24        tcp spts:50000:51000
   11  4384 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_FORWARD"
   11  4384 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT 47 packets, 6796 bytes)
 pkts bytes target     prot opt in     out     source               destination
   54  4288 LOG        tcp  --  *      *       192.168.110.36       10.66.53.0/24        tcp spt:22 limit: avg 1/min burst 5 LOG flags 0 level 4 prefix "SSH OUTPUT WC-110 "
13386 3612K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0
```

### Part B - Filtering Logged Packets

The filtered logged packets found in var/log/messages can be found [here](https://github.com/144525201-myseneca/CSN400-Capstone/blob/01871d41c3eee14ff3f1343408fcf97da44e1982/Checkpoint7/PART_B/logged_packets.log).

**A NEW SSH session from Windows Client to Linux Router**

```bash
Mar 20 00:57:13 LR-110 kernel: SSH INPUT LR-110 IN=eth0 OUT= MAC=00:22:48:3c:8a:e3:d4:af:f7:7f:02:28:08:00 SRC=10.66.53.4 DST=192.168.110.36 LEN=52 TOS=0x00 PREC=0x00 TTL=128 ID=26983 DF PROTO=TCP SPT=63555 DPT=22 WINDOW=64240 RES=0x00 SYN URGP=0
```

**A NEW SSH session response from Linux Router to Windows Client**

```bash
Mar 20 00:57:26 LR-110 kernel: SSH OUTPUT WC-110 IN= OUT=eth0 SRC=192.168.110.36 DST=10.66.53.4 LEN=132 TOS=0x08 PREC=0x40 TTL=64 ID=57191 DF PROTO=TCP SPT=22 DPT=62833 WINDOW=295 RES=0x00 ACK PSH URGP=0
```

**A DNS request from Windows Client, requesting the FQDN of the IIS server**

```bash
Mar 20 00:59:55 LR-110 kernel: DNS TCP FORWARD WS-110 IN=eth0 OUT=eth0 MAC=00:22:48:3c:8a:e3:d4:af:f7:7f:02:28:08:00 SRC=10.66.53.4 DST=172.17.110.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=7656 DF PROTO=TCP SPT=63573 DPT=53 WINDOW=64240 RES=0x00 SYN URGP=0
```

**An HTTP request from Windows Client to the IIS Server**

```bash
Mar 20 01:07:12 LR-110 kernel: HTTP FORWARD WS-110 IN=eth0 OUT=eth0 MAC=00:22:48:3c:8a:e3:d4:af:f7:7f:02:28:08:00 SRC=10.66.53.4 DST=172.17.110.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=7710 DF PROTO=TCP SPT=63620 DPT=80 WINDOW=64240 RES=0x00 SYN URGP=0
```

**A DNS request from Windows Client, requesting the FQDN of the APACHE server**

```bash
Mar 20 00:59:38 LR-110 kernel: DNS UDP FORWARD WS-110 IN=eth0 OUT=eth0 MAC=00:22:48:3c:8a:e3:d4:af:f7:7f:02:28:08:00 SRC=10.66.53.4 DST=172.17.110.36 LEN=72 TOS=0x00 PREC=0x00 TTL=127 ID=7655 PROTO=UDP SPT=65400 DPT=53 LEN=52
```

**An HTTP request from Windows Client to the APACHE Server**

```bash
Mar 20 01:08:40 LR-110 kernel: HTTP FORWARD LS-110 IN=eth0 OUT=eth0 MAC=00:22:48:3c:8a:e3:d4:af:f7:7f:02:28:08:00 SRC=10.66.53.4 DST=172.17.110.37 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=30390 DF PROTO=TCP SPT=63636 DPT=80 WINDOW=64240 RES=0x00 SYN URGP=0
```

**A MySQL request from Windows Client to Linux Server**

```bash
Mar 20 01:12:09 LR-110 kernel: MySQL FORWARD LS-110 IN=eth0 OUT=eth0 MAC=00:22:48:3c:8a:e3:d4:af:f7:7f:02:28:08:00 SRC=10.66.53.4 DST=172.17.110.37 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=30412 DF PROTO=TCP SPT=63686 DPT=3306 WINDOW=64240 RES=0x00 SYN URGP=0
```

**An FTP request from Windows Client to Windows Server**

```bash
Mar 20 01:13:02 LR-110 kernel: FTP CONTROL PLANE FORWARD WS-110 IN=eth0 OUT=eth0 MAC=00:22:48:3c:8a:e3:d4:af:f7:7f:02:28:08:00 SRC=10.66.53.4 DST=172.17.110.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=7813 DF PROTO=TCP SPT=63698 DPT=21 WINDOW=64240 RES=0x00 SYN URGP=0
```

### Part C - Analyzing Logged Packets

The following table shows information about the packets that were filtered and logged in var/log/messages:

| Packet ID | Date             | MAC Address                               | Protocol | Source Address | Dest. Address    | Source Port | Dest. Port | Packet Length | LOG Prefix                       | Time To Live |
|-----------|------------------|-------------------------------------------|----------|----------------|------------------|-------------|------------|---------------|----------------------------------|--------------|
| 26983     | Mar 20 00:57:13  | 00:22:48:3c:8a:e3:d4:af:f7:7f:02:28:08:00 | TCP      | 10.66.53.4     | 192.168.110.36   | 63555       | 22         | 52            | SSH INPUT LR-110                 | 128          |
| 57191     | Mar 20 00:57:26  |                                           | TCP      | 192.168.110.36 | 10.66.53.4       | 22          | 62833      | 132           | SSH OUTPUT WC-110                | 64           |
| 7656      | Mar 20 00:59:55  | 00:22:48:3c:8a:e3:d4:af:f7:7f:02:28:08:00 | TCP      | 10.66.53.4     | 172.17.110.36    | 63573       | 53         | 52            | DNS TCP FORWARD WS-110           | 127          |
| 7710      | Mar 20 01:07:12  | 00:22:48:3c:8a:e3:d4:af:f7:7f:02:28:08:00 | TCP      | 10.66.53.4     | 172.17.110.36    | 63620       | 80         | 52            | HTTP FORWARD WS-110              | 127          |
| 7655      | Mar 20 00:59:38  | 00:22:48:3c:8a:e3:d4:af:f7:7f:02:28:08:00 | UDP      | 10.66.53.4     | 172.17.110.36    | 65400       | 53         | 72            | DNS UDP FORWARD WS-110           | 127          |
| 30390     | Mar 20 01:08:40  | 00:22:48:3c:8a:e3:d4:af:f7:7f:02:28:08:00 | TCP      | 10.66.53.4     | 172.17.110.37    | 63636       | 80         | 52            | HTTP FORWARD LS-110              | 127          |
| 30412     | Mar 20 01:12:09  | 00:22:48:3c:8a:e3:d4:af:f7:7f:02:28:08:00 | TCP      | 10.66.53.4     | 172.17.110.37    | 63686       | 3306       | 52            | MySQL FORWARD LS-110             | 127          |
| 7813      | Mar 20 01:13:02  | 00:22:48:3c:8a:e3:d4:af:f7:7f:02:28:08:00 | TCP      | 10.66.53.4     | 172.17.110.36    | 63698       | 21         | 52            | FTP CONTROL PLANE FORWARD WS-110 | 127          |

![questions](https://github.com/144525201-myseneca/CSN400-Capstone/blob/d4f5ae4bec65f56344d690ba1cb15de3762df295/Checkpoint7/PART_C/cp7.PNG)

### Part D - Azure Cost Analysis Charts
