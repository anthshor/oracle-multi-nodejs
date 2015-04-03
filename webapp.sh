# v0.0 By Alvaro


# Run test as Oracle
su - oracle -c 'export NODE_PATH=/usr/lib/node_modules 
export LD_LIBRARY_PATH=/u01/app/oracle/product/12c/lib
export ORACLE_SID=fred
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=/u01/app/oracle/product/12c
export PATH=${PATH}:${ORACLE_HOME}/bin

sqlplus / as sysdba << EOF
alter user hr account unlock;
alter user welcome identified by hr;
exit

EOF

node node-oracledb/examples/webapp.js'
if [ $? -ne 0 ]; then
  echo "Something went wrong. Node.js test FAILED"
else
  echo "node.js test Succeeded!"
fi

