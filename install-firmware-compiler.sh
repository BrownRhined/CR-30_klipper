#!/bin/bash
# This script installs Klipper firmware compiler on an Ubuntu 18.04 machine

# Install only required system packages for making menuconfig and building klipper firmware
install_packages()
{
    # Install git package if already not present
    PKGLIST="git"
    # Install make and gcc package
    PKGLIST="${PKGLIST} build-essential"
    # Install python2(only required packages) if already not present
    PKGLIST="${PKGLIST} python python-cffi python-dev"
    # AVR chip installation and building
    PKGLIST="${PKGLIST} avrdude gcc-avr binutils-avr avr-libc"
    # ARM chip installation and building
    PKGLIST="${PKGLIST} stm32flash libnewlib-arm-none-eabi"
    PKGLIST="${PKGLIST} gcc-arm-none-eabi binutils-arm-none-eabi libusb-1.0"

    # Update system package info
    report_status "Running apt-get update..."
    sudo apt-get update

    # Install desired packages
    report_status "Installing packages..."
    sudo apt-get install --yes ${PKGLIST}
}
#
#
# Helper functions
report_status()
{
    echo -e "\n\n###### $1"
}

verify_ready()
{
    if [ "$EUID" -eq 0 ]; then
        echo "This script must not run as root"
        exit -1
    fi
}
#
#
# Force script to exit if an error occurs
set -e
#
#
# Run installation steps defined above
verify_ready
install_packages