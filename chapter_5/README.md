# Context
## Commands
❯ lsblk -d -o TRAN,NAME,TYPE,MODEL,SERIAL,SIZE
TRAN   NAME    TYPE MODEL                  SERIAL         SIZE
       loop0   loop                                         4K
       loop1   loop                                      55.5M
       loop2   loop                                      55.5M
       loop3   loop                                      63.8M
       loop4   loop                                     164.8M
       loop5   loop                                      91.7M
       loop6   loop                                     105.7M
       loop7   loop                                      50.8M
usb    sda     disk MassStorageClass       000000001539     0B
       zram0   disk                                         8G
nvme   nvme0n1 disk WD_BLACK SN850X 4000GB 24212X803387   3.6T
❯ sudo hdparm -Tt /dev/nvme0n1

/dev/nvme0n1:
 Timing cached reads:   98474 MB in  1.99 seconds = 49382.36 MB/sec
 Timing buffered disk reads: 7478 MB in  3.00 seconds = 2492.17 MB/sec

## [Official spec](https://documents.westerndigital.com/content/dam/doc-library/en_us/assets/public/western-digital/product/internal-drives/wd-black-ssd/data-sheet-wd-black-sn850x-nvme-ssd.pdf)
seq read: 7.3k MB/s
seq write 6.6k MB/s
random read: 1200 K IOPS
random write: 1100 K IOPS

From the read graph, I see an initial delay of about 210 us, about 20% of the delay in the book.
Then subsequent seek pattern has the shape of the letter T. We will always have a slope of fetching at a constant pace. Then we will suddenly have a spike of arrivals from offsets both below and above the last offset. And then another spike, so on and so forth. After a while, at the same spike, there would be very long vertical line of many Ts. There are also long gaps between runs.

For another 3 runs, it's just simple Ts all the way.

# Exercises
## 5.1 What causes groups of about 150–250 disk blocks with time gaps between? About what is the time between groups? What is causing this delay?

For my SSD, the intermediate number of blocks between the vertical lines varies. For HDD at least, the groups result from the OS filesystem or the HDD firmware breaking up the transfer request into 1 MB chunks.

For me, the gap between vertical lines is about 40 usec at first, and then decreases to something like 20 usec toward the end. The delay is probably the disk head swirving around to the next section/track.

5.2 Extra credit: If some groups are one block shorter than others, why?
My groups vary quick dramatically across each other. Once again, it's just SSD being different from the HDD the book primarily analyzes.

5.3 In the JSON file, find the smallest transfer time (which may not be at the front).
There are a lot of zero times for me and many negative times. I see see that SSD accesses are much more random.

What is the seek and rotate time to get to the very first block read, in milliseconds?
136 ms.

5.4 Find the largest transfer time, and divide it by the 40MB transferred. What is the
overall transfer rate observed, in MB/sec? (This time includes the initial seek and all inter-
mediate delays so is somewhat lower than any marketing number.)
5.5 Looking at a typical group of ~200 blocks with time gaps on both sides, what is the
overall transfer rate within that group, in MB/sec? This should be the true transfer rate at
the read/write head.
5.6 Look around for a group that has a faster transfer rate than the disk surface supports.
What is the fast transfer rate, in MB/sec? What is going on when that happens?
5.7 Now run mystery3 on an SSD using /datassd/dserve. What is the seek time to read the
soonest-delivered block? What is the overall transfer rate start to finish, in MB/sec?
5.8 The SSD timings probably have a different pattern than the disk timings, with per-
haps very regular discontinuities or changes in rate. How many discontinuities are there?
Comment briefly on what you think is happening.
5.9 Complete the missing part of TimeDiskWrite(). Mine is seven more lines, setting
the block current times. This will be easy if you have followed what the strategy is, and a
bit harder if you have been only skimming this text and the code. But when you are done,
you will better understand what is going on.
5.10 Now re-run on disk and look at the disk write timings. Are you surprised? You
might see a lot of discontinuities. How many discontinuities or big groups are there?
Comment briefly on what you think is happening.
5.11 Finally, re-run on an SSD and look at the SSD write timings and comment briefly on
what you think is happening. Use your order-of-magnitude knowledge to compare various
time delays to possible causes. If the delay from a possible cause is a different order of mag-
nitude than the observed delay, move on to another possibility.
