# Checkpoint8 Submission ✔️

- **COURSE INFORMATION: CSN 400-Computer Systems Projects**
- **STUDENT’S NAME: Janelle Marie Almonte**
- **STUDENT'S NUMBER: 144525201**
- **GITHUB USER ID: 144525201-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

## Table of Contents 📚
1. [Part A – Logging and Analyzing DNS and HTTP Traffic](#part-a--logging-and-analyzing-dns-and-http-traffic)
2. [Part B – Logging and Analyzing FTP and MySQL Traffic](#part-b--logging-and-analyzing-ftp-and-mysql-traffic)
3. [Part C – Adjusting Firewalls to DROP and LOG Traffic](#part-c--adjusting-firewalls-to-drop-and-log-traffic)
4. [Part D - Azure Cost Analysis Charts](#part-d---azure-cost-analysis-charts)

### Part A – Logging and Analyzing DNS and HTTP Traffic

**[Apache-IIS Filtered](https://github.com/144525201-myseneca/CSN400-Capstone/blob/887ebe249bdfe81013f9ae6b01f2382166883953/Checkpoint8/images/apache-iis.filtered.PNG)**

<div align="center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/887ebe249bdfe81013f9ae6b01f2382166883953/Checkpoint8/images/apache-iis.filtered.PNG">
</div>


### Part B – Logging and Analyzing FTP and MySQL Traffic

**[FTP-MySQL Filtered](https://github.com/144525201-myseneca/CSN400-Capstone/blob/c1b05c2a7e085413fc508015d79082cdd8f3afdb/Checkpoint8/images/ftp-mysql.filtered.PNG)**

<div align="center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/c1b05c2a7e085413fc508015d79082cdd8f3afdb/Checkpoint8/images/ftp-mysql.filtered.PNG">
</div>

### Part C – Adjusting Firewalls to DROP and LOG Traffic

**Updated Script in [lr-drop-log.sh](https://github.com/144525201-myseneca/CSN400-Capstone/blob/86d6fdab4ba1990e01ddbad1ddd0ba479f3c902d/Checkpoint8/PART_C/lr-drop-log.sh)**

`SSH - PORT 22`

```bash
 iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.37 --dport 22 -m limit --limit 1/min -j LOG --log-prefix "IPTables-Dropped: " --log-level 4
```

`FTP - PORT 21`

```bash
 iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.36 --dport 21 -m limit --limit 1/min -j LOG --log-prefix "IPTables-Dropped: " --log-level 4
```
<a href="https://github.com/144525201-myseneca/CSN400-Capstone/blob/173942d50ca46d0d7cf77f094210ca977f48347a/Checkpoint8/PART_C/lr-nondrop-log-filtered-pcap.PNG" style="color:black;">lr-nondrop-log-filtered.pcap</a>

<div align="center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/6d3453d2725b298ad6778e4d186af6874d147bc7/Checkpoint8/PART_C/lr-nondrop-log-filtered-pcap.PNG">
</div>

**lr-drop-log-filtered.log**

**SSH**

```bash
Mar 28 03:32:39 LR-110 kernel: IPTables-Dropped: IN=eth0 OUT=eth0 MAC=00:22:48:af:13:8e:fc:bd:67:ad:94:93:08:00 SRC=10.66.53.4 DST=172.17.110.37 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=49377 DF PROTO=TCP SPT=64649 DPT=22 WINDOW=64240 RES=0x00 SYN URGP=0
```

**FTP**

```bash
Mar 28 03:32:41 LR-110 kernel: IPTables-Dropped: IN=eth0 OUT=eth0 MAC=00:22:48:af:13:8e:fc:bd:67:ad:94:93:08:00 SRC=10.66.53.4 DST=172.17.110.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=18279 DF PROTO=TCP SPT=64651 DPT=21 WINDOW=64240 RES=0x00 SYN URGP=0
```

**[lr-drop-log-filtered.pcap](https://github.com/144525201-myseneca/CSN400-Capstone/blob/6d3453d2725b298ad6778e4d186af6874d147bc7/Checkpoint8/PART_C/lr-drop-log-filtered-pcap.PNG){:style="color:black"}**

<div align="center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/6d3453d2725b298ad6778e4d186af6874d147bc7/Checkpoint8/PART_C/lr-drop-log-filtered-pcap.PNG">
</div>

### Part D - Azure Cost Analysis Charts

[DAILY COSTS - RESOURCE](https://github.com/144525201-myseneca/CSN400-Capstone/blob/d377b8db9c4b1716658eb533024e3a97421d9c34/Checkpoint8/PART_D/dailycosts_resource.PNG)

<p align="center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/d377b8db9c4b1716658eb533024e3a97421d9c34/Checkpoint8/PART_D/dailycosts_resource.PNG" alt="q&a">
</p>


[DAILY COSTS - SERVICE](https://github.com/144525201-myseneca/CSN400-Capstone/blob/d377b8db9c4b1716658eb533024e3a97421d9c34/Checkpoint8/PART_D/dailycosts_service.PNG)

<p align="center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/d377b8db9c4b1716658eb533024e3a97421d9c34/Checkpoint8/PART_D/dailycosts_service.PNG" alt="q&a">
</p>


[ACCUMULATED COSTS - RESOURCE](https://github.com/144525201-myseneca/CSN400-Capstone/blob/d377b8db9c4b1716658eb533024e3a97421d9c34/Checkpoint8/PART_D/accumatedcosts_resource.PNG)

<p align="center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/d377b8db9c4b1716658eb533024e3a97421d9c34/Checkpoint8/PART_D/accumatedcosts_resource.PNG" alt="q&a">
</p>


[PIE CHART - SERVICE NAME](https://github.com/144525201-myseneca/CSN400-Capstone/blob/d377b8db9c4b1716658eb533024e3a97421d9c34/Checkpoint8/PART_D/piechart_servicename.PNG)

<p align="center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/d377b8db9c4b1716658eb533024e3a97421d9c34/Checkpoint8/PART_D/piechart_servicename.PNG" alt="q&a">
</p>


[PIE CHART - SERVICE FAMILY](https://github.com/144525201-myseneca/CSN400-Capstone/blob/d377b8db9c4b1716658eb533024e3a97421d9c34/Checkpoint8/PART_D/piechart_servicefamily.PNG)

<p align="center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/d377b8db9c4b1716658eb533024e3a97421d9c34/Checkpoint8/PART_D/piechart_servicefamily.PNG" alt="q&a">
</p>


[PIE CHART - PRODUCT](https://github.com/144525201-myseneca/CSN400-Capstone/blob/d377b8db9c4b1716658eb533024e3a97421d9c34/Checkpoint8/PART_D/piechart_product.PNG)

<p align="center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/d377b8db9c4b1716658eb533024e3a97421d9c34/Checkpoint8/PART_D/piechart_product.PNG" alt="q&a">
</p>



