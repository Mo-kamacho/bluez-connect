# Bluetooth Device Connection Script

This Bash script is designed to help you manage your Bluetooth device connections. It allows you to connect to a specified Bluetooth device, disconnect from it, or scan for available devices.

## Prerequisites

Before using this script, make sure you have the following:

- A Linux system with Bluetooth support.
- The `bluetoothctl` command-line utility installed.
- A Bluetooth headset or device with a known device name (Bluetooth MAC address).

## Usage

1. Clone or download the script to your local system.

2. Make the script executable:
   ```shell
   chmod +x bluez-connect.sh
   ```

3. Replace `"YOUR_DEVICE_NAME_OR_MAC_ADDRESS"` with the actual Bluetooth device name or MAC address that you want to connect or disconnect from.

4. Run the script with the following options:

   - To connect to the specified device:
     ```shell
     ./bluez-connect.sh
     ```

   - To disconnect from the specified device:
     ```shell
     ./bluez-connect.sh off
     ```

   - To scan for available devices:
     ```shell
     ./bluez-connect.sh scan
     ```

5. Follow the on-screen instructions to connect, disconnect, or scan for devices.

## Notes

- The script will check if Bluetooth is enabled and enable it if necessary.

- The scanning duration can be adjusted by changing the `sleep` duration in the script.

- The `bluetoothctl` utility is used to control Bluetooth devices and can vary between different Linux distributions. Please ensure it's compatible with your system.

- This script is provided as-is and may require adjustments based on your specific Bluetooth device and environment.
