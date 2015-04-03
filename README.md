Oracle Database with multiple node.js connecting
------------------------------------------------
Pre Reqs
- Vagrant (www.vagrantup.com)
- VirtualBox 

Automatically provisions the following:

DB node (2Gb mem:
- Install oracle-rdbms-server-12cR1-preinstall
- Install DB software
- Create database
- Install node.js  
- Install node.js driver for Oracle

Web Tier x 5 (1Gb mem each):
- Install instant client
- Install node.js
- Install driver for Oracle
- Run test


Each shows the results of a simple test query (web_connect_test.js). This uses oracledb to connect, 
so doesn't use connection pooling. I couldn't get the supplied example/webapp.js to send data to the
browser for reasons not clear to me at the moment... 


Requires software directory with Oracle binaries already downloaded and contained within it:
```bash
$ ls software
keep								oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
linuxamd64_12102_database_1of2.zip				oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
linuxamd64_12102_database_2of2.zip				oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm
```

Run
---
vagrant up | tee vagrant.log

Open browser for each web node to see if it's worked:

http://localhost:7001/

http://localhost:7002/

http://localhost:7003/

http://localhost:7004/

http://localhost:7005/


