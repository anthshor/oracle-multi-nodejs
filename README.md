Automated build for an Oracle Database with node.js
---------------------------------------------------

- Install oracle-rdbms-server-12cR1-preinstall
- Install DB software
- Run DBCA
- Install node.js 
- Install driver for Oracle
- Test with an example select

Requires software directory with Oracle binaries already downloaded and contained within it:
```bash
$ cd software/
$ ls -l
total 4838984
-rw-r--r--  1 anthonyshorter  staff  1361028723 18 Jul  2014 linuxamd64_12c_database_1of2.zip
-rw-r--r--  1 anthonyshorter  staff  1116527103 18 Jul  2014 linuxamd64_12c_database_2of2.zip
```

Run
---
```bash
$ vagrant up
$ vagrant ssh
.
. < lines removed>
.
==> default: [ [ 180, 'Construction' ] ]
==> default: [ { name: 'DEPARTMENT_ID' }, { name: 'DEPARTMENT_NAME' } ]
==> default: node.js test Succeeded!
```
