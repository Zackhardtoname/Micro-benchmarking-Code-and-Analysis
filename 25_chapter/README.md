Question in section 25.2

From Chapter 5, about how long would you expect the disk write of 40MB to take to get the data all the way to disk? Would you expect the 40MB disk read to take just about the same time? Would you expect the sequential 4KB reads to take shorter, about the same, or longer than the 40MB read? About how long should the 4KB random reads take? Scribble down your estimates in milliseconds or seconds. Do similar estimates and write them down for an SSD. What would you expect to be different when running two copies simultaneously? Would you expect the disk pair to take about the same amount of elapsed time, twice as long, or something in between? How about the SSD pair? Jot down your notes before continuing.


Only answering for SSD:

From chapter 5, I got 6.6k MB/s for sequential writing. So 40 / 6.6k s = 6 ms

Based on chapter 5, I would expect read to be about the same, and maybe slightly faster.

-> Writing took 60 ms and readign took 6 as expected. Why is writing (sync) 10x the time? It seems like sync is really slow. TODO maybe I'll set up kutrace one day and exam my SSD behaviorals in depth.

4KB read should take much shorter time. Perhaps at 4KB / 7.3k MB/s = 0.535 us. However, there is an observed lower bound for the io seek cost: 210 us.

4KB random read should take 1 OP. 1 / 1200 K OPs/s = 0.8 us. Once again, it should be 210 us.

4KB sequential reads totaling 40 MB should be only somewhat slower than the 40 MB read and much faster than random reads, thanks to SSD read ahead.
-> I was wrong. It was much closwer to random reads (2x the speed) and 2.5% the speed of a single 40 MB read.

4KB random reads totaling 40 MB would be 40 MB / 4KB = 10240 OPs
10240 OPs / 1,200K IOPS = 8.5 ms

When running two copies simultaneously, I think disk will take twice as long unless we are doing small (4KB) reads/writes that are next to each other.

SSD can do concurrent processing, so I expect the about same time and maybe slightly higher.
-> reads are only 50% more throughput. sync is 2x, so no resource is saturated. read is the same throughput, some resource is fully saturated. Seq read is saturated. random read is not. 
---
Actual run running sync very close to each other to avoid the effects of other programs

❯ ./mystery25 ./tmpfile
opening ./tmpfile for write
  write:      40.00MB  0.009sec 4269.40 MB/sec
  sync:       40.00MB  0.057sec 704.18 MB/sec
  read:       40.00MB  0.006sec 6643.41 MB/sec
  seq read:   40.00MB  0.237sec 168.52 MB/sec
  rand read:  40.00MB  0.537sec  74.51 MB/sec

❯ ./mystery25 ./tmpfile2
opening ./tmpfile2 for write
  write:      40.00MB  0.011sec 3751.64 MB/sec
  sync:       40.00MB  0.034sec 1164.96 MB/sec
  read:       40.00MB  0.006sec 6647.83 MB/sec
  seq read:   40.00MB  0.242sec 165.36 MB/sec
  rand read:  40.00MB  0.609sec  65.70 MB/sec

❯ ./mystery25 ./tmpfile1 & ./mystery25 ./tmpfile2
[1] 34005
opening ./tmpfile2 for write
opening ./tmpfile1 for write
  write:      40.00MB  0.013sec 3078.34 MB/sec
  write:      40.00MB  0.013sec 3047.85 MB/sec
  sync:       40.00MB  0.052sec 768.51 MB/sec
  sync:       40.00MB  0.052sec 771.25 MB/sec
  read:       40.00MB  0.012sec 3433.48 MB/sec
  read:       40.00MB  0.012sec 3393.86 MB/sec
  seq read:   40.00MB  0.434sec  92.20 MB/sec
  seq read:   40.00MB  0.435sec  92.04 MB/sec
  rand read:  40.00MB  0.565sec  70.76 MB/sec
  rand read:  40.00MB  0.566sec  70.71 MB/sec
[1]  + 34005 done       ./mystery25 ./tmpfile1

## 25.1 Find another anomaly in the HTML files for the four traces in this chapter. Specify
the time range, what looks odd, and your thoughts and reasoning about what likely is
going on. How would you improve the performance?

It's more of an observation on the data: the book says without "the over-eager mwait, sequential reads
should be about 150 MB/sec." (2x) instead of 72.95.

However, running two seq read programs together gave us 42.36 + 42.48 = 84.84. It means we barely have any increase in throughput from making the machine 2x as busy. I think the issue is that with 2x read IO requests, the busy part is still the disk and the CPU is still largely idle, so running two copies the same disk-count programs do not help defeat the over-eager mwait.