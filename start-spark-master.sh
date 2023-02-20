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

# Find the Spark installation directory
SPARK_DIR=$(dirname $(dirname $(which spark-submit)))

# Set the path to Spark
export PATH=$PATH:$SPARK_DIR/bin

# Start the Spark master
$SPARK_DIR/sbin/start-master.sh --ip $FIRST_SERVER_IP

# Display the URL for accessing the Spark web UI
echo "Spark master URL: http://$FIRST_SERVER_IP:8080"
