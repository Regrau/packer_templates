#!/bin/bash

# This script will provide one off commands to deploy new VMs into the kvm
# Network.
#Startup VPN

# Shared Parameters
GRAPHICS="none"
NETWORK="virbr0"
OS_TYPE="linux"
OS_VARIANT="generic"

# Salt-Master Parameters
MASTER_NAME="Salt-Master"
MASTER_RAM=1024
MASTER_DISK_PATH="../output/master.qcow2"
MASTER_DISK_SIZE=10
MASTER_CPU_CORES=2
# Salt-Minion Params
MINION_NAME=$1
MINION_RAM=1024
MINION_DISK_PATH="/home/regrau/KvmImagePool/$MINION_NAME.qcow2"
MINION_DISK_SIZE=10
MINION_CPU_CORES=2


function main {
    copyImageToPool
    createVm
    echo $(setNextMinionName)
}

function copyImageToPool {
    mkdir /home/regrau/KvmImagePool
    cp ../output_opensuse_chipnibbles/Minion_openSUSE_42_3 /home/regrau/KvmImagePool/$MINION_NAME.qcow2
}

## The meat of the deal
function createVm {
    virt-install \
        --connect qemu:///system \
        --name $MINION_NAME \
        --ram  $MINION_RAM \
        --disk path=$MINION_DISK_PATH,device=disk,bus=virtio \
        --vcpus ${MINION_CPU_CORES} \
        --os-type $OS_TYPE \
        --boot hd \
        --os-variant $OS_VARIANT \
        --network network=Default,model=virtio \
        --noautoconsole \
        --accelerate
}

# This function gets the names of the existing Vms counts them returns the next
# Machine name.
function setNextMinionName {
    # Get the names of existing minions
    #someArr=( $(virsh list --name | grep minion | sed -e 's/[^0-9]//g') )
    someArr="hello"
}

main
