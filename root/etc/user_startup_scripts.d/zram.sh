#!/bin/bash
echo 0 > /sys/module/zswap/parameters/enabled
modprobe zram num_devices=2
echo lz4hc > /sys/block/zram0/comp_algorithm
echo zstd > /sys/block/zram1/comp_algorithm
echo 2G > /sys/block/zram0/disksize
echo 10G > /sys/block/zram1/disksize
mkswap /dev/zram0
mkswap /dev/zram1
swapon /dev/zram0 -p 32767
swapon /dev/zram1 -p 32766
