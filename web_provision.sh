# v0.1 Initial - web-provision.sh

# The basic install steps are:

# Install the small, free Oracle Instant Client libraries.
# Run npm install oracledb to install from the NPM registry.

# ORA-21561: OID generation failed
# Requires hostname in /etc/hosts
# Add hostname to hosts file. 

if [ `grep -i $hostname /etc/hosts | wc -l` -ne 0 ]; then
    echo "Skipping modifying hosts file, hostname present"
  else
    long="`hostname`"
    short="`hostname -s`"
    echo "updating /etc/hosts with $HOSTNAME information"
    if [ "$short" == "$long" ]; then
      echo "127.0.0.1 localhost.localdomain localhost $short" > /etc/hosts
    else
      echo "127.0.0.1 localhost.localdomain localhost $long $short" > /etc/hosts
    fi
fi


# Install Pre Requirement Packages
yum install -y libaio git gcc gcc-c++ autoconf automake

# Install Oracle Instant Client
yum localinstall -y /vagrant/software/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
yum localinstall -y /vagrant/software/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
yum localinstall -y /vagrant/software/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm

# Install node.js
rpm -q nodejs
if [ $? -ne 0 ]; then
  curl -sL https://rpm.nodesource.com/setup | bash -
  yum install -y nodejs
fi

# Install the driver for Oracle/node.js
export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
export ORACLE_HOME=/usr/lib/oracle/12.1/client64
export PATH=$PATH:$ORACLE_HOME/bin

if [ -d /opt/node-oracledb ]; then
  echo “node driver looks to be installed”
else
  cd /opt; git clone https://github.com/oracle/node-oracledb
  cd node-oracledb; npm install -g
fi

export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
export ORACLE_HOME=/usr/lib/oracle/12.1/client64
export PATH=$PATH:$ORACLE_HOME/bin
export NODE_PATH=/usr/lib/node_modules
node /opt/node-oracledb/examples/select1.js
if [ $? -ne 0 ]; then
  echo "Something went wrong. Node.js test FAILED"
else
  echo "node.js test Succeeded!"
fi


