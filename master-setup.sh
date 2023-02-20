#!/bin/bash

while getopts "i:" arg; do
  case $arg in
    i)
      FIRST_SERVER_IP=${OPTARG}
      ;;
    *)
      echo "Error: Invalid argument provided"
      exit 1
      ;;
  esac
done

if [ -z "${FIRST_SERVER_IP}" ]
then
  echo "Error: No IP address provided for the Spark master"
  echo "Usage: $0 -i <IP_ADDRESS_OF_FIRST_SERVER>"
  exit 1
fi

# Start the Spark master
cd /path/to/spark-3.3.2-bin-hadoop3
./sbin/start-master.sh --ip $FIRST_SERVER_IP

# Display the URL for accessing the Spark web UI
echo "Spark master URL: http://$FIRST_SERVER_IP:8080"
