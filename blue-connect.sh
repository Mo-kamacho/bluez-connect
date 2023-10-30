#!/bin/bash

# Replace "Your_Device_Name" with the actual name of your Bluetooth headset
DEVICE_NAME="YOUR_DEVICE_NAME_OR_MAC_ADDRESS"
MAX_RETRIES=3  # Number of connection retries

# Function to connect to the device
function connect_device() {
  if bluetoothctl connect "$DEVICE_NAME" | grep -q "successful"; then
    echo "Connected to $DEVICE_NAME."
    return 0  # Connection successful
  else
    echo "Failed to connect to $DEVICE_NAME. Retrying..."
    return 1  # Connection failed
  fi
}

# Function to disconnect from the device
function disconnect_device() {
  if bluetoothctl disconnect "$DEVICE_NAME" | grep -q "Successful"; then
    echo "Disconnected from $DEVICE_NAME."
  else
    echo "Failed to disconnect from $DEVICE_NAME."
  fi
}

# Function to scan for available devices
function scan_devices() {
  bluetoothctl scan on
  echo "Scanning for available devices..."
  sleep 5  # Adjust the scan duration as needed

  # Display the list of available devices
  echo "List of available devices:"
  bluetoothctl devices
}

# Check for command-line arguments
if [ "$1" == "off" ]; then
  disconnect_device
elif [ "$1" == "scan" ]; then
  scan_devices
else
  # Check if Bluetooth is enabled
  if ! bluetoothctl show | grep -q "Powered: yes"; then
    echo "Bluetooth is not enabled. Enabling..."
    bluetoothctl power on
    sleep 2  # Allow time for Bluetooth to power on
  fi

  # Attempt to connect to the specified device with retries
  retry=0
  while [ $retry -lt $MAX_RETRIES ]; do
    if connect_device; then
      break  # Connection successful, exit the loop
    fi

    ((retry++))
  done

  if [ $retry -eq $MAX_RETRIES ]; then
    echo "Max connection retries reached. Unable to connect to $DEVICE_NAME."
  fi
fi
