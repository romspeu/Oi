#!/bin/bash

# Install Java
sudo yum install java

# Download and extract Apache Spark
curl -O https://downloads.apache.org/spark/spark-3.2.0/spark-3.2.0-bin-hadoop3.2.tgz
tar xzf spark-3.2.0-bin-hadoop3.2.tgz

# Configure Apache Spark
cd spark-3.2.0-bin-hadoop3.2/conf
cp spark-env.sh.template spark-env.sh
IP_ADDRESS=$(hostname -I | awk '{print $1}')
echo "export SPARK_LOCAL_IP=$IP_ADDRESS" >> spark-env.sh

# Start the Apache Spark cluster
cd ../sbin
./start-all.sh
