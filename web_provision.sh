# v0.1 Initial - web-provision.sh

# The basic install steps are:

# Install the small, free Oracle Instant Client libraries.
# Run npm install oracledb to install from the NPM registry.

# Install Oracle Instant Client
yum install libaio
cd /vagrant/software/; rpm -ivh oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
cd /vagrant/software/; rpm -ivh oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm

# Install nodejs

curl -sL https://rpm.nodesource.com/setup | bash -
yum install -y nodejs

# cd /opt
# tar -zxf /vagrant/software/node-v0.12.2-linux-x64.tar.gz
 
# Run npm install oracledb to install from the NPM registry.


npm install oracledb