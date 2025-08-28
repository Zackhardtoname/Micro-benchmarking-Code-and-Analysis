All tests done on amd ryzen 7 9800x3d.
I modified the script to account for my unusually large L3 cache (96 MiB).

```
stride[16] naive 3 cy/ld, linear 9 cy/ld, scrambled 36 cy/ld
stride[32] naive 6 cy/ld, linear 10 cy/ld, scrambled 76 cy/ld
stride[64] naive 9 cy/ld, linear 17 cy/ld, scrambled 169 cy/ld
stride[128] naive 9 cy/ld, linear 22 cy/ld, scrambled 194 cy/ld
stride[256] naive 8 cy/ld, linear 23 cy/ld, scrambled 203 cy/ld
stride[512] naive 12 cy/ld, linear 16 cy/ld, scrambled 307 cy/ld
stride[1024] naive 12 cy/ld, linear 26 cy/ld, scrambled 300 cy/ld
stride[2048] naive 16 cy/ld, linear 22 cy/ld, scrambled 217 cy/ld
stride[4096] naive 18 cy/ld, linear 28 cy/ld, scrambled 218 cy/ld
lgcount[4] load N cache lines, giving cy/ld. Repeat.  5 2 2 0
lgcount[5] load N cache lines, giving cy/ld. Repeat.  2 2 1 1
lgcount[6] load N cache lines, giving cy/ld. Repeat.  41 1 0 0
lgcount[7] load N cache lines, giving cy/ld. Repeat.  117 2 2 2
lgcount[8] load N cache lines, giving cy/ld. Repeat.  88 2 2 2
lgcount[9] load N cache lines, giving cy/ld. Repeat.  110 3 3 3
lgcount[10] load N cache lines, giving cy/ld. Repeat.  97 8 8 8
lgcount[11] load N cache lines, giving cy/ld. Repeat.  90 8 8 9
lgcount[12] load N cache lines, giving cy/ld. Repeat.  94 8 8 8
lgcount[13] load N cache lines, giving cy/ld. Repeat.  91 9 8 8
lgcount[14] load N cache lines, giving cy/ld. Repeat.  111 14 12 12
lgcount[15] load N cache lines, giving cy/ld. Repeat.  97 21 22 21
lgcount[16] load N cache lines, giving cy/ld. Repeat.  80 23 21 21
lgcount[17] load N cache lines, giving cy/ld. Repeat.  76 25 22 23
lgcount[18] load N cache lines, giving cy/ld. Repeat.  78 27 23 23
lgcount[19] load N cache lines, giving cy/ld. Repeat.  76 27 23 23
FindCacheAssociativity(64, 32768) not implemented yet.
FindCacheAssociativity(64, 262144) not implemented yet.
FindCacheAssociativity(64, 2097152) not implemented yet.
❯ ./a.out
stride[16] naive 1 cy/ld, linear 8 cy/ld, scrambled 61 cy/ld
stride[32] naive 4 cy/ld, linear 10 cy/ld, scrambled 129 cy/ld
stride[64] naive 5 cy/ld, linear 16 cy/ld, scrambled 248 cy/ld
stride[128] naive 6 cy/ld, linear 23 cy/ld, scrambled 263 cy/ld
stride[256] naive 7 cy/ld, linear 31 cy/ld, scrambled 217 cy/ld
stride[512] naive 8 cy/ld, linear 35 cy/ld, scrambled 356 cy/ld
stride[1024] naive 10 cy/ld, linear 29 cy/ld, scrambled 316 cy/ld
stride[2048] naive 12 cy/ld, linear 22 cy/ld, scrambled 314 cy/ld
stride[4096] naive 20 cy/ld, linear 26 cy/ld, scrambled 181 cy/ld
lgcount[4] load N cache lines, giving cy/ld. Repeat.  5 2 2 0
lgcount[5] load N cache lines, giving cy/ld. Repeat.  2 2 1 0
lgcount[6] load N cache lines, giving cy/ld. Repeat.  41 0 1 1
lgcount[7] load N cache lines, giving cy/ld. Repeat.  113 2 2 2
lgcount[8] load N cache lines, giving cy/ld. Repeat.  82 3 3 3
lgcount[9] load N cache lines, giving cy/ld. Repeat.  117 3 3 3
lgcount[10] load N cache lines, giving cy/ld. Repeat.  97 8 8 8
lgcount[11] load N cache lines, giving cy/ld. Repeat.  87 8 8 8
lgcount[12] load N cache lines, giving cy/ld. Repeat.  85 8 8 8
lgcount[13] load N cache lines, giving cy/ld. Repeat.  85 8 8 8
lgcount[14] load N cache lines, giving cy/ld. Repeat.  118 15 13 13
lgcount[15] load N cache lines, giving cy/ld. Repeat.  73 19 20 21
lgcount[16] load N cache lines, giving cy/ld. Repeat.  78 21 21 21
lgcount[17] load N cache lines, giving cy/ld. Repeat.  79 22 22 21
lgcount[18] load N cache lines, giving cy/ld. Repeat.  79 24 22 22
lgcount[19] load N cache lines, giving cy/ld. Repeat.  81 26 22 22
FindCacheAssociativity(64, 32768) not implemented yet.
FindCacheAssociativity(64, 262144) not implemented yet.
FindCacheAssociativity(64, 2097152) not implemented yet.
```

3.1 In the first part of mystery2.cc that looks at cache line size timings, what do you think the cache line size is, and why? If you have access to sample servers with more than one type of CPU chip, be sure to specify which server you measured.

64 bytes because it has the first slow latency increase. It matches /sys/devices/system/cpu/cpu0/cache/index0/coherency_line_size

3.2 In the first part of mystery2.cc that looks at cache line size timings, explain a little about the three timings for a possible line size of 256 bytes. These are the ones that should be about 30, 80, and 200 cycles per load.

The native is fast due to having N+1 prefetching,  multiple instructions per cycle, and outstanding loads.

The linear one only has N+1 prefetching so it's slower.

The scrambled one minimizes all 3 effects so it's even slower.

zanesterling claims that for Intel, the prefetching is tracked separately for each instruction in the code, so the effective stride size is 4 times (as many times as we have unrolled the loop) the value in the code. Running their rolled code shows little difference on my machine. I imagine that even if prefetching is tracked separately, the caches are still all loaded up in L1 and thus whether it's one instruction or 4 makes little difference.

3.3 In the first part of mystery2.cc that looks at cache line size timings, make a copy of the program, and in routine MakeLongList(), add a line after

int extrabit = makelinear ? 0 : (1 << 14);that defeats the DRAM different-row address patterns:

extrabit = 0;

Explain a little about the changes this produces in the scrambled timings, especially for possible line size of 128 bytes. Keep in mind that the virtual-to-physical address mapping will somewhat corrupt the alternate different-row pattern before your change and will somewhat corrupt the same-row pattern afterward.

Answer: GPT tells me that each DRAM can only keep one row in buffer at a time. So even though the code just toggles between 2 rows instead of actually randomly accessing from a pool of rows, it's as good as the latter.

The change will allow us to access slots in the same row of memory. I would expect a decrease in the cycles. However, I see no difference in the output.

3.4 In the second part that looks at total cache size FindCacheSizes(), what do you think are the total sizes of the L1, L2, and L3 caches?

Looks like L1 data cache has 2^10 cache lines so 1024 * 64 bytes = 64 KB. lscpu says 48 KB per core.
L2 cache has 2^14 cache lines so 1 MB. lscpu says 1 MB.
L3 cache has 2^21 cahce lines so 134 MB. lscpu says 96 MB. The 2^21 latency is clearly between 2^20 and 2^22. I think the non-perfect LRU is making an impact here.

Interestingly, the first hot read would often have a higher latency. Maybe once again it's the eviction policy at work. #TODO why?

3.5 What is your best estimate of the load-to-use time in cycles for each cache level?
L1: 2 cycles.
L2: 14 cycles.
L3: 150 cycles. Based on 2^21, 75 cycles, matching the x5 pattern described in the book.

3.6 To run on a CPU with a non-power-of-2 cache size, such as an Intel i3 with 3MB L3 cache, how would you modify the program slightly to test for somewhat-common not-power-of-2 sizes? (You need not do the modification; just explain what you would do.)

I would do an exponential search to find the actual target cache size.

3.7 In the second part that looks at total cache size FindCacheSizes(), explain a bit about the variation in cycle counts within each cache level. The ones that barely fill a level are somewhat faster than the ones that completely fill a level. Why could that be?

Because 1) the program has other variables that would also compete for cache and 2) the "LRU" algorithm used is generally an approximation, so some data are misplaced. 

zanesterling also points out that context-switch would clear out caches.

3.8 Implement FindCacheAssociativity(). What is the associativity of each cache level?

See mystery2_ex_3_8.cc
L1 is 8. L2 is 64. L3 is 1024.
Linux says: L1 is 12, L2 is 8, and L3 is 16 :(
It's actually common to have higher associativity in L1 than L2, which I did not expect.

To measure L2 reliably, I need to make "spreads across a small number of associative sets in the L2 cache but all land in a single set in the L1 cache, overwhelming the L1 associativity and forcing misses out to L2."

Knowing that L1 is 12, we need to access 12 times first to occupy all 12 ways in L1 and then start the experiment for L2. The number of sets in L1 is 48 KB / 12 ways / 64 bytes = 64. So we use 6 bits for the set index, and 6 for the block index. The actual addresses would be increments by a bit index past the set index for L1, so the stride should be 1 << 12. Then do something similar for L3.
#TODO get help with measuring L2