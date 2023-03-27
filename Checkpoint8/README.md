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

**Updated Script in lr-drop-log.sh**


```bash
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.32/27 --dport 22 -j DROP
```


```bash
iptables -A FORWARD -p tcp -s 10.66.53.0/24 -d 172.17.110.36 --dport 21 -j DROP
```

### Part D - Azure Cost Analysis Charts






