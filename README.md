# Overview
My code and answers to the book Understanding Software Dynamics.
Go into each chapter for code and analyses.

# Quick Results
## hardware
* MAG X870E TOMAHAWK WIFI motherboard 
    * M.2_1, a PCIe 5.0x4 lane, for SSD
    * 1x Realtek® 8126 5Gbps LAN controller
* AMD Ryzen 7 9800X3D 8-Core
* Flare X5 DDR5-6000 CL30-40-40-96 1.40V 64GB (2x32GB) AMD EXPO
* WD_BLACK™ SN850X NVMe™ SSD M.2 2280 NVMe™ SSD
* external ethernet speed is about 300 Mbps

## CPU (chapter 2)
(Using -fno-tree-reassoc.)
* 0.76 cycles for 64-bit integer addition.
* 2.37 cycles for 64-bit integer multiplication.
* 25 cycles for 64-bit integer division, but it probably gets to 0 pretty fast.

* 3 cycles for double addition.
* 3 cycles for double multiplication.
* 10 cycles for double division.

## RAM (chapter 3)
* cache line size: 64 bytes
* L1 data cache: 48 KB per core
* L1 inst cache: 32 KB per core
* L2 cache: 1 MB
* L3 cache: 96 MiB

load-to-use time in cycles for each cache level
* L1: 2 cycles.
* L2: 14 cycles.
* L3: 150 cycles.

associativity of each cache level
* L1: 12
* L2: 8
* L3: 16

## RAM (chapter 6)
official spec
94 GiB/s

sysbench shows that my RAM
* randam write is 3.76 GiB/sec
* random read is 4 GiB/sec
* sequential write is 39 GiB/sec
* sequential read is 100 MiB/sec (beating official)

## SSD (chapter 5)
official specs
* seq read: 7.3k MB/s (my observation is 6780 MB / sec)
* seq write 6.6k MB/s
* random read: 1200 K IOPS
* random write: 1100 K IOPS

initial delay of about 210 us

## networking (chapter 6)
weighed process speed is about 5/8 * 2/6.5 + (102770+40000) / 2 / 1024 * 4/6.5 = 48 GiB/s

### ping of 100 KiB
* Send time = send back time = 1 ms
* Process time = 12.5 us

### writes of 1 MiB
* Send time = 10 ms
* Process time ranges from 0.4 to 1 ms
* Send back times = 0.2 ms (200x estimate likely due to initial delay)

### reads of 1 MiB
* Send time = 0.2 ms (200x estimate likely due to initial delay)
* Process time ranges from 0.4 to 1 ms
* Send back times = 10 ms