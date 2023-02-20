#!/bin/bash

# Set the IP address of the first server (the Spark master)
FIRST_SERVER_IP=<IP_ADDRESS_OF_FIRST_SERVER>

# Start the Spark master
cd /path/to/spark-3.3.2-bin-hadoop3
./sbin/start-master.sh --ip $FIRST_SERVER_IP

# Display the URL for accessing the Spark web UI
echo "Spark master URL: http://$FIRST_SERVER_IP:8080"
