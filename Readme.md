# BBB PRU Input Program 

A simple PRU input example.
This program runs on PRU1 and waits for P8.28 to go high and then pulls P8.29 high.

## Circuit

A switch should be placed between the 3.3V and P8.28.
An LED should be placed in series with a 1k resistor between P8.29 and ground.

## Installation


An updated device tree compiler may be needed:

    wget -c https://raw.githubusercontent.com/RobertCNelson/tools/master/pkgs/dtc.sh; chmod +x dtc.sh; ./dtc.sh

The <a href="https://github.com/beagleboard/am335x_pru_package">PRU Drivers</a> must be installed also.

The HDMI must be disabled by adding the following line to `/boot/uEnv.txt`

    optargs=quiet capemgr.disable_partno=BB-BONELT-HDMI,BB-BONELT-HDMIN

The following will compile all the code for the PRU and main cpu:
    
    make

Compile the device tree overlay and enable it:

    cd device-tree
    make enable


## Running
    
    ./input





    
