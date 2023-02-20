#!/bin/bash

while getopts "i:" arg; do
  case $arg in
    i)
      SECOND_SERVER_IP=${OPTARG}
      ;;
    *)
      echo "Error: Invalid argument provided"
      exit 1
      ;;
  esac
done

if [ -z "${SECOND_SERVER_IP}" ]
then
  echo "Error: No IP address provided for the Spark worker"
  echo "Usage: $0 -i <IP_ADDRESS_OF_SECOND_SERVER>"
  exit 1
fi

# Set the IP address of the first server (the Spark master)
FIRST_SERVER_IP=<IP_ADDRESS_OF_FIRST_SERVER>

# Start the Spark worker
cd /path/to/spark-3.3.2-bin-hadoop3
./sbin/start-worker.sh spark://$FIRST_SERVER_IP:7077 --ip $SECOND_SERVER_IP

# Display the worker ID
echo "Spark worker ID: $(cat /path/to/spark-3.3.2-bin-hadoop3/work/*/*/worker-*.out | grep "Registered worker" | tail -1 | cut -d " " -f 3)"
