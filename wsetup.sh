#!/bin/bash

# Install necessary packages
sudo dnf install -y java-11-openjdk-devel python3 python3-pip tar

# Upgrade pip
sudo pip3 install --upgrade pip

# Install required Python packages
sudo pip3 install numpy pandas scikit-learn tensorflow torch torchvision jupyterlab pyspark findspark

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
