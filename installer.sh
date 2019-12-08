#!/bin/bash

# How to use:
# Run this file by entering commands:
# chmod +x ./installer.sh
# sudo ./installer.sh


# - Initial message:
echo "Installing rpi_home_guardian service..."

# - Start the configure.py script to set up S3 bucket:
echo "Start the configure.py script to set up the S3 bucket and initialize the ./media folder..."
python configure.py
echo "- Done!"

# - Make the rpi_home_guardian.sh executable:
echo "Making the rpi_home_guardian.sh executable..."
chmod +x rpi_home_guardian.sh
echo "- Done!"

# - Place the rpi_home_guardian.service in /etc/systemd/system:
echo "Place the rpi_home_guardian.service in /etc/systemd/system..."
mv ./rpi_home_guardian.service /etc/systemd/system/rpi_home_guardian.service
echo "- Done!"

# - Make the service start at boot and start it now:
echo "Make the service start at boot, reload daemons and starting it now..."
systemctl enable rpi_home_guardian.service
systemctl daemon-reload
systemctl start rpi_home_guardian.service
echo "- Done!"

# - Final message:
echo "-- All done!"