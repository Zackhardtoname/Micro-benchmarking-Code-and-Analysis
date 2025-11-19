Question in section 25.2

From Chapter 5, about how long would you expect the disk write of 40MB to take to get the data all the way to disk? Would you expect the 40MB disk read to take just about the same time? Would you expect the sequential 4KB reads to take shorter, about the same, or longer than the 40MB read? About how long should the 4KB random reads take? Scribble down your estimates in milliseconds or seconds. Do similar estimates and write them down for an SSD. What would you expect to be different when running two copies simultaneously? Would you expect the disk pair to take about the same amount of elapsed time, twice as long, or something in between? How about the SSD pair? Jot down your notes before continuing.


Only answering for SSD:

From chapter 5, I got 6.6k MB/s for sequential writing. So 40 / 6.6k s = 6 ms

Based on chapter 5, I would expect read to be about the same, and maybe slightly faster.

4KB read should take much shorter time. Perhaps at 4KB / 7.3k MB/s = 0.535 us. However, there is an observed lower bound for the io seek cost: 210 us.

4KB random read should take 1 OP. 1 / 1200 K OPs/s = 0.8 us. Once again, it should be 210 us.

When running two copies simultaneously, I think disk will take twice as long unless we are doing small (4KB) reads/writes that are next to each other.

SSD can do concurrent processing, so I expect the about same time and maybe slightly higher.


